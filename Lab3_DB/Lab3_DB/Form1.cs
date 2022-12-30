using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data.OleDb;

namespace Lab3_DB
{
    public partial class Form1 : Form
    {

        public Form1()
        {
            InitializeComponent();

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "database1DataSet6.Диагноз". При необходимости она может быть перемещена или удалена.
            this.диагнозTableAdapter.Fill(this.database1DataSet6.Диагноз);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "database1DataSet5.Процедура". При необходимости она может быть перемещена или удалена.
            this.процедураTableAdapter.Fill(this.database1DataSet5.Процедура);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "database1DataSet4.Пациент". При необходимости она может быть перемещена или удалена.
            this.пациентTableAdapter.Fill(this.database1DataSet4.Пациент);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "database1DataSet3.Персонал". При необходимости она может быть перемещена или удалена.
            this.персоналTableAdapter.Fill(this.database1DataSet3.Персонал);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "database1DataSet2.Отделения". При необходимости она может быть перемещена или удалена.
            this.отделенияTableAdapter.Fill(this.database1DataSet2.Отделения);

        }

        /*---------------------------------------------------------------------------------*/
        // Добавление нового
        /*---------------------------------------------------------------------------------*/
        //Отделение 
        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                this.database1DataSet2.Отделения.AddОтделенияRow(Convert.ToInt32(textBox1.Text), Convert.ToString(textBox2.Text));

                dataGridView1.Update();
            }
            catch
            {
                MessageBox.Show("Не удалось добавить новое отделение. Проверьте введенные данные");
            }
                
        }
        //Сотрудник
        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                //проверить код  
                bool t = false;
                for (int i = 0; i < dataGridView1.RowCount; i++)
                {
                    if (Convert.ToInt32(textBox5.Text) == Convert.ToInt32(dataGridView1[0, i].Value))
                    {
                        t = true;
                        break;
                    }
                }
                if (t == false)
                    throw null;
                    
                //
                if (Convert.ToInt32(textBox9.Text) <= 0)
                        throw null;


                 this.database1DataSet3.Персонал.AddПерсоналRow(Convert.ToInt32(textBox3.Text), Convert.ToString(textBox4.Text),
                     Convert.ToInt32(textBox5.Text), Convert.ToDateTime(dateTimePicker1.Value.Date), Convert.ToString(textBox7.Text),
                     Convert.ToString(textBox8.Text), Convert.ToInt32(textBox9.Text));

                dataGridView2.Update();
            }
            catch
            {
                MessageBox.Show("Не удалось добавить новую запись. Проверьте введенные данные");
            }
        }
        //Пациент
        private void button6_Click(object sender, EventArgs e)
        {
            try
            {
                //проверить код  
                bool t = false;
                for (int i = 0; i < dataGridView1.RowCount; i++)
                {
                    if (Convert.ToInt32(textBox12.Text) == Convert.ToInt32(dataGridView1[0, i].Value))
                    {
                        t = true;
                        break;
                    }
                }
                if (t == false)
                    throw null;
                
                t = false; 
                //диагноз
                for (int i = 0; i < dataGridView5.RowCount; i++)
                {
                    if (Convert.ToInt32(textBox14.Text) == Convert.ToInt32(dataGridView5[0, i].Value))
                    {
                        t = true;
                        break;
                    }
                }
                if (t == false)
                    throw null;
                //дата
                if (dateTimePicker2.Value >= dateTimePicker3.Value)
                    throw null;

                this.database1DataSet4.Пациент.AddПациентRow(Convert.ToInt32(textBox10.Text), Convert.ToString(textBox11.Text),
                    Convert.ToInt32(textBox12.Text), Convert.ToString(textBox13.Text), Convert.ToInt32(textBox14.Text),
                    dateTimePicker2.Value.Date, dateTimePicker3.Value.Date);

                dataGridView3.Update();
            }
            catch
            {
                MessageBox.Show("Не удалось добавить новую запись. Проверьте введенные данные");
            }
        }
        //Процедура
        private void button7_Click(object sender, EventArgs e)
        {
            try
            {
                //проверить код  
                bool t = false;
                for (int i = 0; i < dataGridView2.RowCount; i++)
                {
                    if (Convert.ToInt32(textBox19.Text) == Convert.ToInt32(dataGridView2[0, i].Value))
                    {
                        t = true;
                        break;
                    }
                }
                if (t == false)
                    throw null;
                
                //
                if (Convert.ToInt32(textBox20.Text) <= 0)
                    throw null;


                this.database1DataSet5.Процедура.AddПроцедураRow(Convert.ToInt32(textBox17.Text), Convert.ToString(textBox18.Text),
                    Convert.ToInt32(textBox19.Text), Convert.ToInt32(textBox20.Text));

                dataGridView4.Update();
            }
            catch
            {
                MessageBox.Show("Не удалось добавить новую запись. Проверьте введенные данные");
            }
        }
        //Диагноз
        private void button8_Click(object sender, EventArgs e)
        {
            try
            {
                //проверить код  
                bool t = false;
                for (int i = 0; i < dataGridView1.RowCount; i++)
                {
                    if (Convert.ToInt32(textBox5.Text) == Convert.ToInt32(dataGridView1[0, i].Value))
                    {
                        t = true;
                        break;
                    }
                }
                if (t == false)
                    throw null;

                //проверить код  
                t = false;
                for (int i = 0; i < dataGridView4.RowCount; i++)
                {
                    if (Convert.ToInt32(textBox24.Text) == Convert.ToInt32(dataGridView4[0, i].Value))
                    {
                        t = true;
                        break;
                    }
                }
                if (t == false)
                    throw null;


                this.database1DataSet6.Диагноз.AddДиагнозRow(Convert.ToInt32(textBox21.Text), Convert.ToString(textBox22.Text),
                    Convert.ToInt32(textBox23.Text), Convert.ToInt32(textBox24.Text));

                dataGridView5.Update();
            }
            catch
            {
                MessageBox.Show("Не удалось добавить новую запись. Проверьте введенные данные");
            }
        }
        /*---------------------------------------------------------------------------------*/
        //Сохранить 
        /*---------------------------------------------------------------------------------*/
        //Отделения
        private void button9_Click(object sender, EventArgs e)
        {
            try
            {
                //Имя_ТаблицыTableAdapter.Update(имя_БДDataSet);
                this.отделенияTableAdapter.Update(this.database1DataSet2.Отделения);

                MessageBox.Show("Изменения в базе данных выполнены!", "Уведомление о результатах", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                catch (Exception)
                {
                    MessageBox.Show("Изменения в базе данных выполнить не удалось!", "Уведомление о результатах", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
        }
        //Сотрудники
        private void button5_Click(object sender, EventArgs e)
        {
            try
            {
                //проверяет введённые в поля данные на соответствие типам данных полей
                this.Validate();
                //закрывает подключение с сервером
                this.database1DataSet3.EndInit();
                //обновляет данные на сервере
                this.персоналTableAdapter.Update(this.database1DataSet3.Персонал);

                MessageBox.Show("Изменения сохранены");
            }
            catch
            {
                MessageBox.Show("Не удалось сохранить изменения");
            }
        }
        //Пациент
        private void button4_Click(object sender, EventArgs e)
        {
            try
            {
                //проверяет введённые в поля данные на соответствие типам данных полей
                this.Validate();
                //закрывает подключение с сервером
                this.database1DataSet4.EndInit();
                //обновляет данные на сервере
                this.пациентTableAdapter.Update(this.database1DataSet4.Пациент);

                MessageBox.Show("Изменения сохранены");
            }
            catch
            {
                MessageBox.Show("Не удалось сохранить изменения");
            }
        }
        //Процедура
        private void button13_Click(object sender, EventArgs e)
        {
            try
            {
                //проверяет введённые в поля данные на соответствие типам данных полей
                this.Validate();
                //закрывает подключение с сервером
                this.database1DataSet5.EndInit();
                //обновляет данные на сервере
                this.процедураTableAdapter.Update(this.database1DataSet5.Процедура);

                MessageBox.Show("Изменения сохранены");
            }
            catch
            {
                MessageBox.Show("Не удалось сохранить изменения");
            }
        }
        //Диагноз
        private void button15_Click(object sender, EventArgs e)
        {
            try
            {
                //проверяет введённые в поля данные на соответствие типам данных полей
                this.Validate();
                //закрывает подключение с сервером
                this.database1DataSet6.EndInit();
                //обновляет данные на сервере
                this.диагнозTableAdapter.Update(this.database1DataSet6.Диагноз);

                MessageBox.Show("Изменения сохранены");
            }
            catch
            {
                MessageBox.Show("Не удалось сохранить изменения");
            }
        }

        /*---------------------------------------------------------------------------------*/
        //Удалить запись
        /*---------------------------------------------------------------------------------*/
        //Отделения
        private void button11_Click(object sender, EventArgs e)
        {
            
            foreach (DataGridViewRow r in dataGridView1.SelectedRows)
            {
                dataGridView1.Rows.Remove(r);
            }
            
        }
        //Сотрудники
        private void button3_Click(object sender, EventArgs e)
        {
            foreach (DataGridViewRow r in dataGridView2.SelectedRows)
            {
                dataGridView2.Rows.Remove(r);
            }
        }
        //Пациент
        private void button12_Click(object sender, EventArgs e)
        {
            foreach (DataGridViewRow r in dataGridView3.SelectedRows)
            {
                dataGridView3.Rows.Remove(r);
            }
        }
        //Процедура
        private void button14_Click(object sender, EventArgs e)
        {
            foreach (DataGridViewRow r in dataGridView4.SelectedRows)
            {
                dataGridView4.Rows.Remove(r);
            }
        }
        //Диагноз
        private void button16_Click(object sender, EventArgs e)
        {
            foreach (DataGridViewRow r in dataGridView5.SelectedRows)
            {
                dataGridView5.Rows.Remove(r);
            }
        }

        /*---------------------------------------------------------------------------------*/
        //Кнопки во вкладке отделение
        /*---------------------------------------------------------------------------------*/

        Form2 f2; 
        //Показать сотрудникоа
        private void button10_Click(object sender, EventArgs e)
        {
            f2 = new Form2();
            f2.Show();

            f2.label1.Text = "Сотрудники данного отделения: ";
            f2.dataGridView1.Rows.Clear();
            f2.dataGridView1.Columns.Clear();
            

            int kod = Convert.ToInt32(textBox6.Text);

            bool have = false; 
            for (int i = 0; i < dataGridView1.Rows.Count; i++)
            {
                if (kod == Convert.ToInt32(dataGridView1[0, i].Value))
                {
                    //Отделение есть 
                    have = true;
                    break;
                }
            }
            if (have == false)
            {
                MessageBox.Show("Такого кода не существует");
                return; 
            }
            int ind = 0;
            int cc = dataGridView2.Rows[1].Cells.Count;
            int rc = dataGridView2.RowCount;
            f2.dataGridView1.ColumnCount = cc;
            //(f2.dataGridView1).Rows[0].HeaderCell.Value = Convert.ToString((dataGridView2).Rows[0].HeaderCell.Value);
                         
            for (int i = 0; i < rc; i++)
            {
                if (Convert.ToInt32(dataGridView2[2,i].Value) == kod)
                {
                    
                    (f2.dataGridView1).Rows.Add();
                    
                    for (int j = 0; j < cc; j++)
                    {
                        (f2.dataGridView1).Rows[ind].Cells[j].Value = Convert.ToString(dataGridView2.Rows[i].Cells[j].Value);
                    }
                    ind++;
                }
            }

            f2.Update();

        }
        //Показать пациентов
        private void button21_Click(object sender, EventArgs e)
        {
            f2 = new Form2();
            f2.Show();

            f2.label1.Text = "Сотрудники данного отделения: ";
            f2.dataGridView1.Rows.Clear();
            f2.dataGridView1.Columns.Clear();


            int kod = Convert.ToInt32(textBox6.Text);
            //Проверка что есть такое отделение 
            bool have = false;
            for (int i = 0; i < dataGridView1.Rows.Count; i++)
            {
                if (kod == Convert.ToInt32(dataGridView1[0, i].Value))
                {
                    //Отделение есть 
                    have = true;
                    break;
                }
            }
            if (have == false)
            {
                MessageBox.Show("Такого кода не существует");
                return;
            }
            int ind = 0;
            int cc = dataGridView3.Rows[1].Cells.Count;
            int rc = dataGridView3.RowCount;
            f2.dataGridView1.ColumnCount = cc;
            (f2.dataGridView1).Rows[0].HeaderCell.Value = Convert.ToString((dataGridView3).Rows[0].HeaderCell.Value);

            for (int i = 0; i < rc; i++)
            {
                if (Convert.ToInt32(dataGridView3[2, i].Value) == kod)
                {

                    (f2.dataGridView1).Rows.Add();

                    for (int j = 0; j < cc; j++)
                    {
                        (f2.dataGridView1).Rows[ind].Cells[j].Value = Convert.ToString(dataGridView3.Rows[i].Cells[j].Value);
                    }
                    ind++;
                }
            }

            f2.Update();
        }

        //Показать пациентов с диагнозом
        private void button17_Click(object sender, EventArgs e)
        {
            f2 = new Form2();
            f2.Show();

            f2.label1.Text = "Пациенты с выбранным диагнозом: ";
            f2.dataGridView1.Rows.Clear();
            f2.dataGridView1.Columns.Clear();


            int kod = Convert.ToInt32(textBox15.Text);
            //Проверка что есть такой код  
            bool have = false;
            for (int i = 0; i < dataGridView5.Rows.Count; i++)
            {
                if (kod == Convert.ToInt32(dataGridView5[0, i].Value))
                {
                    // есть 
                    have = true;
                    break;
                }
            }
            if (have == false)
            {
                MessageBox.Show("Такого кода не существует");
                return;
            }
            int ind = 0;
            int cc = dataGridView3.Rows[1].Cells.Count;
            int rc = dataGridView3.RowCount;
            f2.dataGridView1.ColumnCount = cc;
            (f2.dataGridView1).Rows[0].HeaderCell.Value = Convert.ToString((dataGridView3).Rows[0].HeaderCell.Value);

            for (int i = 0; i < rc; i++)
            {
                if (Convert.ToInt32(dataGridView3[4, i].Value) == kod)
                {

                    (f2.dataGridView1).Rows.Add();

                    for (int j = 0; j < cc; j++)
                    {
                        (f2.dataGridView1).Rows[ind].Cells[j].Value = Convert.ToString(dataGridView3.Rows[i].Cells[j].Value);
                    }
                    ind++;
                }
            }

            f2.Update();
        }
        
    }
}
