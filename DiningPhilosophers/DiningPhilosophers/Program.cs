using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;

namespace DiningPhilosophers
{
    class Program
    {
        public static List<Fork> Forks;
        public static List<Philosopher> Philosophers;

        public static DateTime TimeToStop;
        public static Int16 Seconds; // продолжительность обеда 

        public static HashSet<int> All = new HashSet<int>();


        static void Main(string[] args)
        {
            Console.WriteLine("1.Решение задачи через монитор. Консольный вывод");
            Console.WriteLine("2.Решение задачи через семафор. Консольный вывод");
            Console.WriteLine("3.Среднее время решения задачи через монитор. Время расчитано по медиане");
            Console.WriteLine("4.Среднее время решения задачи через семафор. Время расчитано по медиане ");
            Console.WriteLine("");

            Console.WriteLine("Введите номер: ");
            String s = Console.ReadLine();

            switch (s)
            {
                case "1":
                    SolutionTaskMonitor();
                    Console.WriteLine("");
                    Main(args);
                    break;

                case "2":
                    SolutionTaskSemaphore();
                    Console.WriteLine("");
                    Main(args);
                    break;

                case "3":
                    MiddleTimeSolutionTaskMonitor();
                    Console.WriteLine("");
                    Main(args);
                    break;

                case "4":
                    MiddleTimeSolutionTaskSemaphore();
                    Console.WriteLine("");
                    Main(args);
                    break;

                default:
                    Console.WriteLine("Нет такого варианта. Повторите попытку еще раз");
                    break;
            }
        }

        //Решение задачи через монитор
        public static void SolutionTaskMonitor()
        {
            Thread.Sleep(1000);

            Console.WriteLine("Введите в секундах продолжительность обеда:   ");
            Seconds = Convert.ToInt16(Console.ReadLine());

            Forks = new List<Fork>();
            Philosophers = new List<Philosopher>();


            for (int i = 0; i < 5; i++)
            {
                Forks.Add(new Fork());
            }
            for (int i = 0; i < 5; i++)
            {
                Philosophers.Add(new Philosopher(i, Forks[i], Forks[(i + 1) % 5]));
                Philosophers[i].Run();
            }

            TimeToStop = DateTime.Now.AddSeconds(Seconds);
            Console.WriteLine("Начинаем обед");
            Console.WriteLine();

            while (DateTime.Now < TimeToStop)
            {
                printStatusPhilosophers();
                //Пока информация выводится, то поток ожидает 
                Thread.Sleep(1000);
            }


            //Завершаем обед
            for (int i = 0; i < 5; i++)
            {
                Philosophers[i].Stop_Eat();
            }

            Console.WriteLine("Обед завершен");
            //Console.ReadKey();
        }
        //Решение задачи через Семафор
        public static void SolutionTaskSemaphore()
        {
            Thread.Sleep(1000);

            Console.WriteLine("Введите в секундах продолжительность обеда:   ");
            Seconds = Convert.ToInt16(Console.ReadLine());

            Forks = new List<Fork>();
            Philosophers = new List<Philosopher>();


            for (int i = 0; i < 5; i++)
            {
                Forks.Add(new Fork());
            }
            for (int i = 0; i < 5; i++)
            {
                Philosophers.Add(new Philosopher(i, Forks[i], Forks[(i + 1) % 5]));
                Philosophers[i].RunS();
            }

            TimeToStop = DateTime.Now.AddSeconds(Seconds);
            Console.WriteLine("Начинаем обед");
            Console.WriteLine();

            while (DateTime.Now < TimeToStop)
            {
                printStatusPhilosophers();
                //Пока информация выводится, то поток ожидает 
                Thread.Sleep(1000);
            }


            //Завершаем обед
            for (int i = 0; i < 5; i++)
            {
                Philosophers[i].Stop_Eat();
            }

            Console.WriteLine("Обед завершен");
            //Console.ReadKey();
        }

        // Консольный вывод текущего состояния каждого философа 
        public static void printStatusPhilosophers()
        {
            for (int i = 0; i < 5; i++)
            {
                Console.WriteLine((i + 1).ToString() + Philosophers[i].GetStatus());
                Console.WriteLine();
            }
            Console.WriteLine();
        }

        //Для подсчета времени, за которое поедят все философы для решения через монитор
        public static void TimeSolutionTaskMonitor()
        {
            //DateTime start = DateTime.Now;

            Forks = new List<Fork>();
            Philosophers = new List<Philosopher>();
            All = new HashSet<int>();

            for (int i = 0; i < 5; i++)
            {
                Forks.Add(new Fork());
            }
            for (int i = 0; i < 5; i++)
            {
                Philosophers.Add(new Philosopher(i, Forks[i], Forks[(i + 1) % 5]));
                Philosophers[i].Run();
            }

            DateTime k1 = DateTime.Now;
            DateTime k2 = DateTime.Now;

            while ((All.Count != 5) || ((k2 - k1).Seconds > 5))
            {
                for (int i = 0; i < 5; i++)
                {
                    if ((Philosophers[i].GetStatus() == " философ ест") || (Philosophers[i].GetStatus() == " философ мыслит"))
                    {
                        All.Add(i);
                    }
                     
                }
                k2 = DateTime.Now;
                
            }
            //Завершаем обед
            for (int i = 0; i < 5; i++)
            {
                Philosophers[i].Stop_Eat();
            }
            //DateTime end = DateTime.Now;

           // Console.WriteLine((end - start).Milliseconds);
            //Console.ReadKey();

            All.Clear();
        }
        //Среднее время решения задачи через монитор 
        public static void MiddleTimeSolutionTaskMonitor()
        {
            Console.WriteLine("Решения задачи через монитор: ");

            List<int> MiddleTime = new List<int>();
            int count = 10;

            for (int i = 0; i < count; i++)
            {
                DateTime start = DateTime.Now;

                TimeSolutionTaskMonitor();

                DateTime end = DateTime.Now;

                Thread.Sleep(100);

                MiddleTime.Add(Convert.ToInt16((end - start).Milliseconds));

                //Console.WriteLine(MiddleTime[i]);
            }

            MiddleTime.Sort();
            
            Console.WriteLine("Среднее время, за которое все философы поедят: ");
            
                if (count % 2 == 0)
                {
                    Console.WriteLine(Convert.ToString((MiddleTime[count / 2] + MiddleTime[(count / 2) - 1]) / 2));
                }
                else
                {
                    Console.WriteLine(Convert.ToString((MiddleTime[count / 2])));
                }

            //Console.ReadKey();
        }

        //Для подсчета времени, за которое поедят все философы для решения через семафор
        public static void TimeSolutionTaskSemaphore()
        {
            //DateTime start = DateTime.Now;

            Forks = new List<Fork>();
            Philosophers = new List<Philosopher>();
            All = new HashSet<int>();

            for (int i = 0; i < 5; i++)
            {
                Forks.Add(new Fork());
            }
            for (int i = 0; i < 5; i++)
            {
                Philosophers.Add(new Philosopher(i, Forks[i], Forks[(i + 1) % 5]));
                Philosophers[i].RunS();
            }

            DateTime k1 = DateTime.Now;
            DateTime k2 = DateTime.Now;

            while ((All.Count != 5) || ((k2 - k1).Seconds > 5))
            {
                for (int i = 0; i < 5; i++)
                {
                    if ((Philosophers[i].GetStatus() == " философ ест") || (Philosophers[i].GetStatus() == " философ мыслит"))
                    {
                        All.Add(i);
                    }

                }
                k2 = DateTime.Now;

            }
            //Завершаем обед
            for (int i = 0; i < 5; i++)
            {
                Philosophers[i].Stop_Eat();
            }
            //DateTime end = DateTime.Now;

            // Console.WriteLine((end - start).Milliseconds);
            //Console.ReadKey();

            All.Clear();
        }
        //Среднее время решения задачи через семафор 
        public static void MiddleTimeSolutionTaskSemaphore()
        {
            Console.WriteLine("Решения задачи через семафор: ");

            List<int> MiddleTime = new List<int>();
            int count = 10;

            for (int i = 0; i < count; i++)
            {
                DateTime start = DateTime.Now;

                TimeSolutionTaskSemaphore();

                DateTime end = DateTime.Now;

                Thread.Sleep(100);

                MiddleTime.Add(Convert.ToInt16((end - start).Milliseconds));

                //Console.WriteLine(MiddleTime[i]);
            }

            MiddleTime.Sort();

            Console.WriteLine("Среднее время, за которое все философы поедят: ");

            if (count % 2 == 0)
            {
                Console.WriteLine(Convert.ToString((MiddleTime[count / 2] + MiddleTime[(count / 2) - 1]) / 2));
            }
            else
            {
                Console.WriteLine(Convert.ToString((MiddleTime[count / 2])));
            }

            //Console.ReadKey();
        }
    }
}
