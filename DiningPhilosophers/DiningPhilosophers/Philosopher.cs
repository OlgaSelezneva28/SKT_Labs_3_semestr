using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;

namespace DiningPhilosophers
{
    class Philosopher
    {
        public int Id; //порядковый номер философа
        public Fork LeftFork;
        public Fork RightFork;
        public bool CurrentLeftFork = false;
        public bool CurrentRightFork = false;
        public Condition Status; // текущее состояние философа
        Random rand = new Random(); // рандомная задержка между состояниями философов
        public bool StopEat = false; // выход из цикла 

        public enum Condition { Rest, Eat, Think } // состояния философа 

        public Philosopher() { }

        public Philosopher(int id, Fork Left_Fork, Fork Right_Fork)
        {
            Id = id;
            LeftFork = Left_Fork;
            RightFork = Right_Fork; 
            Status = Condition.Rest;   
        }

        /*-----------------------------------------*/
        //Через монитор 

        public void Run()
        {
            //Запускаем попытку есть 
            Task.Run(() => TryingToEat());
        }
        //Попытка поесть 
        public void TryingToEat()
        {
            do
            {
                if (Status == Condition.Rest)
                {
                    TakeLeftFork();

                    if (CurrentLeftFork)
                    {
                        TakeRightFork();

                        if (CurrentRightFork)
                        {
                            Eat();
                            PutForks();
                            Think();
                        }
                        else
                        {
                            PutForks();
                            Rest();
                        }
                    }
                    else
                        Rest();
                }
                else
                    Status = Condition.Rest;
            }
            while (!StopEat);

        }
   
        //Попытка получить левую вилку 
        public void TakeLeftFork()
        {
            Monitor.TryEnter(LeftFork, ref CurrentLeftFork);
            //второй параметра - логическое значение, которое указывает, получено ли владение над объектом из первого параметра
        }
        //Попытка получить правую вилку
        public void TakeRightFork()
        {
            Monitor.TryEnter(RightFork, ref CurrentRightFork);
            //второй параметра - логическое значение, которое указывает, получено ли владение над объектом из первого параметра
        }
        //Положить левую вилку
        public void PutLeftFork()
        {
            if (CurrentLeftFork)
            {
                CurrentLeftFork = false;
                Monitor.Exit(LeftFork);
            }
        }
        //Положить правую вилку
        public void PutRightFork()
        {
            if (CurrentRightFork)
            {
                CurrentRightFork = false;
                Monitor.Exit(RightFork);
            }
        }
        //Положить обе вилки 
        public void PutForks()
        {
            PutLeftFork();
            PutRightFork();
        }
        /*-----------------------------------------*/


        /*-----------------------------------------*/
        //Через семафор 

        public void RunS()
        {
            //Запускаем попытку есть 
            Task.Run(() => TryingToEat2());
        }
        //Попытка поесть 
        public void TryingToEat2()
        {
            do
            {
                if (Status == Condition.Rest)
                {
                    TakeLeftForkS();

                    if (CurrentLeftFork)
                    {
                        TakeRightForkS();

                        if (CurrentRightFork)
                        {
                            Eat();
                            PutForksS();
                            Think();
                        }
                        else
                        {
                            PutForksS();
                            Rest();
                        }
                    }
                    else
                        Rest();
                }
                else
                    Status = Condition.Rest;
            }
            while (!StopEat);

        }

        //Попытка получить левую вилку 
        public void TakeLeftForkS()
        {
            if (LeftFork.sem.WaitOne())
                CurrentLeftFork = true;
        }
        //Попытка получить правую вилку
        public void TakeRightForkS()
        {
            if (RightFork.sem.WaitOne())
                CurrentRightFork = true;
        }
        //Положить левую вилку
        public void PutLeftForkS()
        {
            if (CurrentLeftFork)
            {
                CurrentLeftFork = false;
                LeftFork.sem.Release();
            }
        }
        //Положить правую вилку
        public void PutRightForkS()
        {
            if (CurrentRightFork)
            {
                CurrentRightFork = false;
                RightFork.sem.Release();
            }
        }
        //Положить обе вилки 
        public void PutForksS()
        {
            PutLeftForkS();
            PutRightForkS();
        }
        /*-----------------------------------------*/

        // Изменение статуса философа 
        public void Eat()
        {
            Status = Condition.Eat;
            waiting();
        }

        public void Think()
        {
            Status = Condition.Think;
            waiting();
        }

        public void Rest()
        {
            Status = Condition.Rest;
            waiting();
        }

        //Получить текущий статус 
        public String GetStatus()
        {
            if (Status == Condition.Eat)
                return " философ ест";
            if (Status == Condition.Rest)
                return " философ отдыхает";
            if (Status == Condition.Think)
                return " философ мыслит";
            else
                return "Статус не определен";
        } 

        //Выжидание 
        public void waiting()
        {
            //rand.Next(100)
            Thread.Sleep(100);
        }

        //
        public void Stop_Eat()
        {
            StopEat = true;
        }
    }

}
