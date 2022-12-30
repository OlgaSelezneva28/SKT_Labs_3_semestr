using System;
using System.IO;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Lab6
{
    public partial class Form1 : Form
    {
        Bitmap image;

        public Form1()
        {
            InitializeComponent();

            Random r = new Random();
            this.checkBox1.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));

            this.checkBox2.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));

            this.checkBox3.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));

            //comboBox1.Items.AddRange(Enum.GetNames(typeof(KnownColor)));
            comboBox1.DataSource = typeof(Color).GetProperties().Where(x => x.PropertyType == typeof(Color)).Select(x => x.GetValue(null)).ToList();

            comboBox1.MaxDropDownItems = 10;
            comboBox1.IntegralHeight = false;
            comboBox1.DrawMode = DrawMode.OwnerDrawFixed;
            comboBox1.DropDownStyle = ComboBoxStyle.DropDownList;
            comboBox1.DrawItem += comboBox1_DrawItem;

            //
            domainUpDown1.Items.AddRange(Enum.GetNames(typeof(KnownColor)));

            //
            openFileDialog1.Filter = "Text files(*.txt)|*.txt|All files(*.*)|*.*";
            saveFileDialog1.Filter = "Text files(*.txt)|*.txt|All files(*.*)|*.*";

            //

            listView1.SmallImageList = imageList2;

            //
            trackBar1.Scroll += trackBar1_Scroll;

            //
            dataGridView1.Rows.Clear();
            dataGridView1.Columns.Clear();
            //
            dataGridView1.RowCount = 2;
            dataGridView1.ColumnCount = 4;
            dataGridView1.Rows[0].Cells[0].Value = "Меньше 1";
            dataGridView1.Rows[0].Cells[1].Value = "1-7";
            dataGridView1.Rows[0].Cells[2].Value = "7-15";
            dataGridView1.Rows[0].Cells[3].Value = "От 15 лет";


            for (int i = 0; i < 4; i++)
            {
                dataGridView1.Rows[1].Cells[i].Value = 0;
            }

            //
            dataGridView2.Rows.Clear();
            dataGridView2.Columns.Clear();
            //
            dataGridView2.RowCount = 2;
            dataGridView2.ColumnCount = 7;
            dataGridView2.Rows[0].Cells[0].Value = "Мейн-кун";
            dataGridView2.Rows[0].Cells[1].Value = "Шотландская вислоухая";
            dataGridView2.Rows[0].Cells[2].Value = "Бенгальская кошка";
            dataGridView2.Rows[0].Cells[3].Value = "Сиамская кошка";
            dataGridView2.Rows[0].Cells[4].Value = "Русская голубая";
            dataGridView2.Rows[0].Cells[5].Value = "Сибирская кошка";
            dataGridView2.Rows[0].Cells[6].Value = "Другой вариант";

            for (int i = 0; i < 7; i++)
            {
                dataGridView2.Rows[1].Cells[i].Value = 0;
            }

            //
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {
        }

        private void splitContainer1_Panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Random r = new Random();
            this.button1.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));
            // Добавить прозрачность
            this.button1.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));
            
            //
            this.checkBox1.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));

            this.checkBox2.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));

            this.checkBox3.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));

            String Text = "Вы перекрасили 1 кнопку";
            add_listbox(Text);
        }

        private void splitContainer1_SplitterMoved(object sender, SplitterEventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            Random r = new Random();
            this.button4.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));
            // Добавить прозрачность
            this.button4.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));

            //
            this.checkBox1.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));

            this.checkBox3.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));

            String Text = "Вы перекрасили 4 кнопку";
            add_listbox(Text);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Random r = new Random();
            this.button2.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));
            // Добавить прозрачность
            this.button2.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));

            //
            this.checkBox1.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));

            this.checkBox2.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));

            String Text = "Вы перекрасили 2 кнопку";
            add_listbox(Text);
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Random r = new Random();
            this.button5.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));
            // Добавить прозрачность
            this.button5.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));

            checkBox2.BackColor = button5.BackColor;

            String Text = "Вы перекрасили 5 кнопку";
            add_listbox(Text);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Random r = new Random();
            this.button3.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));
            // Добавить прозрачность
            this.button3.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));

            //this.checkBox1.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));

            this.checkBox2.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));

            this.checkBox3.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));
            String Text = "Вы перекрасили 3 кнопку";
            add_listbox(Text);
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Random r = new Random();
            this.button6.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));
            // Добавить прозрачность
            this.button6.BackColor = Color.FromArgb(r.Next(0, 256), r.Next(0, 256), r.Next(0, 256), r.Next(0, 256));
            String Text = "Вы перекрасили 6 кнопку";
            add_listbox(Text);
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            
        }

        private void button8_Click(object sender, EventArgs e)
        {
            List<CheckBox> LCB = new List<CheckBox>();
            LCB.Add(checkBox1);
            LCB.Add(checkBox2);
            LCB.Add(checkBox3);

            List<Button> LBC = new List<Button>();
            LBC.Add(button1);
            LBC.Add(button2);
            LBC.Add(button3);
            LBC.Add(button4);
            LBC.Add(button5);
            LBC.Add(button6);

            bool sovpal = false;
            
            for (int i = 0; i < LCB.Count(); i++)
            {
                for (int j = 0; j < LBC.Count(); j++)
                {
                    if ((LCB[i].BackColor == LBC[j].BackColor) && (LCB[i].Checked))
                    {
                        sovpal = true;
                    }
                }
            }
            string text = "Ответ на 2 тест: ";
            if (sovpal)
            {
                MessageBox.Show("Есть совпадение цветов");
                text += "Есть совпадение цветов";
            }
            else
            {
                MessageBox.Show("Неверно");
                text += "Неверно";
            }

            add_listbox(text);
        }

        private void button7_Click(object sender, EventArgs e)
        {
            bool yes = false;
            if (button1.BackColor == button4.BackColor)
                yes = true;
            if (button1.BackColor == button5.BackColor)
                yes = true;
            if (button1.BackColor == button6.BackColor)
                yes = true;

            if (button2.BackColor == button4.BackColor)
                yes = true;
            if (button2.BackColor == button5.BackColor)
                yes = true;
            if (button2.BackColor == button6.BackColor)
                yes = true;

            if (button3.BackColor == button4.BackColor)
                yes = true;
            if (button3.BackColor == button5.BackColor)
                yes = true;
            if (button3.BackColor == button6.BackColor)
                yes = true;

            string text = "Ответ на 1 тест: ";
            if (((radioButton1.Checked) && (yes)) || ((radioButton2.Checked) && (!yes)))
            {
                MessageBox.Show("Верно");
                text += "Верно";
            }
            else
            {
                MessageBox.Show("Неверно");
                text += "Неверно";
            }

            add_listbox(text);
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        public void add_listbox(string text)
        {
            int index = listBox1.Items.Count;
            listBox1.Items.Insert(index, text);
        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void button10_Click(object sender, EventArgs e)
        {
            if ((textBox1.Text.ToString() == "") || (textBox2.Text.ToString() == "") || (textBox3.Text.ToString() == ""))
            {
                MessageBox.Show("Введите значение параметров");
                return;
            }
            if (!proverka_cveta(Convert.ToInt16(textBox1.Text), Convert.ToInt16(textBox2.Text), Convert.ToInt16(textBox3.Text)))
            {
                return;
            }
            String Text = "Вы перекрасили 6 кнопку";
            add_listbox(Text);
            button6.BackColor = Color.FromArgb(Convert.ToInt16(textBox1.Text), Convert.ToInt16(textBox2.Text), Convert.ToInt16(textBox3.Text));
        }

        private void button9_Click(object sender, EventArgs e)
        {
            button1.BackColor = Color.FromName(comboBox1.Text);
            String Text = "Вы перекрасили 1 кнопку";
            add_listbox(Text);
        }

        private void comboBox1_DrawItem(object sender, DrawItemEventArgs e)
        {
            e.DrawBackground();
            if (e.Index >= 0)
            {
                var txt = comboBox1.GetItemText(comboBox1.Items[e.Index]);
                var color = (Color)comboBox1.Items[e.Index];
                var r1 = new Rectangle(e.Bounds.Left + 1, e.Bounds.Top + 1,
                    2 * (e.Bounds.Height - 2), e.Bounds.Height - 2);
                var r2 = Rectangle.FromLTRB(r1.Right + 2, e.Bounds.Top,
                    e.Bounds.Right, e.Bounds.Bottom);
                using (var b = new SolidBrush(color))
                    e.Graphics.FillRectangle(b, r1);
                e.Graphics.DrawRectangle(Pens.Black, r1);
                TextRenderer.DrawText(e.Graphics, txt, comboBox1.Font, r2,
                    comboBox1.ForeColor, TextFormatFlags.Left | TextFormatFlags.VerticalCenter);
            }
        }

        public bool proverka_cveta(int r, int g, int b)
        {
            if ((r < 0) || (r > 255))
            {
                MessageBox.Show("Параметр r введен неверно. Проверьте, диапозон от 0 до 255");
                return false;
            }
            if ((g < 0) || (g > 255))
            {
                MessageBox.Show("Параметр g введен неверно. Проверьте, диапозон от 0 до 255");
                return false;
            }
            if ((b < 0) || (b > 255))
            {
                MessageBox.Show("Параметр b введен неверно. Проверьте, диапозон от 0 до 255");
                return false;
            }

            return true;
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label10_Click(object sender, EventArgs e)
        {

        }

        private void button11_Click(object sender, EventArgs e)
        {
            if ((maskedTextBox1.Text.ToString() == "") || (maskedTextBox2.Text.ToString() == "") || (maskedTextBox3.Text.ToString() == ""))
            {
                MessageBox.Show("Введите значение параметров");
                return;
            }
            if (!proverka_cveta(Convert.ToInt16(maskedTextBox1.Text), Convert.ToInt16(maskedTextBox2.Text), Convert.ToInt16(maskedTextBox3.Text)))
            {
                return;
            }
            String Text = "Вы перекрасили 4 кнопку";
            add_listbox(Text);
            button4.BackColor = Color.FromArgb(Convert.ToInt16(maskedTextBox1.Text), Convert.ToInt16(maskedTextBox2.Text), Convert.ToInt16(maskedTextBox3.Text));
        
        }

        private void button12_Click(object sender, EventArgs e)
        {
            if ((numericUpDown1.Text.ToString() == "") || (numericUpDown2.Text.ToString() == "") || (numericUpDown3.Text.ToString() == ""))
            {
                MessageBox.Show("Введите значение параметров");
                return;
            }

            String Text = "Вы перекрасили 5 кнопку";
            add_listbox(Text);
            button5.BackColor = Color.FromArgb(Convert.ToInt16(numericUpDown1.Text), Convert.ToInt16(numericUpDown2.Text), Convert.ToInt16(numericUpDown3.Text));
        
        }

        private void domainUpDown1_SelectedItemChanged(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button13_Click(object sender, EventArgs e)
        {
            button2.BackColor = Color.FromName(domainUpDown1.Text);
            String Text = "Вы перекрасили 2 кнопку";
            add_listbox(Text);
        }

        private void button14_Click(object sender, EventArgs e)
        {
            if (checkedListBox1.GetItemChecked(0) && !checkedListBox1.GetItemChecked(1) && !checkedListBox1.GetItemChecked(2))
            {
                if (checkBox5.Checked)
                {
                    if (!checkBox4.Checked && !checkBox6.Checked)
                    {
                        MessageBox.Show("Верно!");
                        String Text = "Вы верно совместили котика и его цвет";
                        add_listbox(Text);
                        return;
                    }
                    else
                    {
                        MessageBox.Show("Проверьте, что выделена лишь одна запись и одна картинка и повторите попытку");
                        String Text = "Вы выбрали котика и цвет, но что-то пошло не так";
                        add_listbox(Text);
                        return;
                    }
                }
                else
                {
                    MessageBox.Show("Попробуйте еще раз");
                    String Text = "Вы обидели котика";
                    add_listbox(Text);
                    return;
                }
            }

            if (checkedListBox1.GetItemChecked(1) && !checkedListBox1.GetItemChecked(0) && !checkedListBox1.GetItemChecked(2))
            {
                if (checkBox6.Checked)
                {
                    if (!checkBox4.Checked && !checkBox5.Checked)
                    {
                        MessageBox.Show("Верно!");
                        String Text = "Вы верно совместили котика и его цвет";
                        add_listbox(Text);
                        return;
                    }
                    else
                    {
                        MessageBox.Show("Проверьте, что выделена лишь одна запись и одна картинка и повторите попытку");
                        String Text = "Вы выбрали котика и цвет, но что-то пошло не так";
                        add_listbox(Text);
                        return;
                    }
                }
                else
                {
                    MessageBox.Show("Попробуйте еще раз");
                    String Text = "Вы обидели котика";
                    add_listbox(Text);
                    return;
                }
            }

            if ( checkedListBox1.GetItemChecked(2) && !checkedListBox1.GetItemChecked(1) && !checkedListBox1.GetItemChecked(0))
            {
                if (checkBox4.Checked)
                {
                    if (!checkBox5.Checked && !checkBox6.Checked)
                    {
                        MessageBox.Show("Верно!");
                        String Text = "Вы верно совместили котика и его цвет";
                        add_listbox(Text);
                        return;
                    }
                    else
                    {
                        MessageBox.Show("Проверьте, что выделена лишь одна запись и одна картинка и повторите попытку");
                        String Text = "Вы выбрали котика и цвет, но что-то пошло не так";
                        add_listbox(Text);
                        return;
                    }
                }
                else
                {
                    MessageBox.Show("Попробуйте еще раз");
                    String Text = "Вы обидели котика";
                    add_listbox(Text);
                    return;
                }
            }

            MessageBox.Show("Проверьте, что выделена лишь одна запись и одна картинка и повторите попытку");
        }

        private void button15_Click(object sender, EventArgs e)
        {
            string text = "День кошек выбран ";
            string otvet = "8 августа 2022 г.";
            if (dateTimePicker1.Text == otvet)
            {
                MessageBox.Show("верно!");
                text += "верно!";
                String Text = "Поздравляем! Вы знаете когда день кошек!";
                add_listbox(Text);
            }
            else
            {
                MessageBox.Show("неверно");
                text += "неверно";
                String Text = "Вы не знаете, когда день кошек:(";
                add_listbox(Text);
            }

            //add_listbox(text);
        }

        private void очиститьВыводИтоговТестовToolStripMenuItem_Click(object sender, EventArgs e)
        {
            maskedTextBox1.Clear();
            maskedTextBox2.Clear();
            maskedTextBox3.Clear();

            numericUpDown1.ResetText();
            numericUpDown2.ResetText();
            numericUpDown3.ResetText();

            textBox1.Clear();
            textBox2.Clear();
            textBox3.Clear();

        }

        private void toolStripSplitButton1_ButtonClick(object sender, EventArgs e)
        {

        }

        private void очиститьИтогиТестовToolStripMenuItem_Click(object sender, EventArgs e)
        {

            listBox1.Items.Clear();
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            if (saveFileDialog1.ShowDialog() == DialogResult.Cancel)
                return;

            // получаем выбранный файл
            String filename = saveFileDialog1.FileName;

            // сохраняем текст в файл
            string text = "";
            for (int i = 0; i < listBox1.Items.Count; i++)
            {
                text += listBox1.Items[i].ToString();
                text += "\r\n";
            }

                System.IO.File.WriteAllText(filename, text);
        }

        private void button16_Click(object sender, EventArgs e)
        {
            if ((textBox4.Text != "") && (trackBar1.Value.ToString() != "") && (comboBox2.Text.ToString() != "") && (maskedTextBox4.Text.ToString() != ""))
            {
                ListViewItem item = new ListViewItem(new string[] {textBox4.Text, trackBar1.Value.ToString(), comboBox2.GetItemText(comboBox2.SelectedItem), maskedTextBox4.Text.ToString()});

                listView1.Items.Add(item);

                //Возраст 
                int old = trackBar1.Value;

                if (old < 1)
                {
                    int i = Convert.ToInt16(dataGridView1.Rows[1].Cells[0].Value);
                    i++;
                    dataGridView1.Rows[1].Cells[0].Value = i; 
                }
                if ((old >= 1) && (old < 7))
                {
                    int i = Convert.ToInt16(dataGridView1.Rows[1].Cells[1].Value);
                    i++;
                    dataGridView1.Rows[1].Cells[1].Value = i;
                }
                if ((old >= 7) && (old < 15))
                {
                    int i = Convert.ToInt16(dataGridView1.Rows[1].Cells[2].Value);
                    i++;
                    dataGridView1.Rows[1].Cells[2].Value = i;
                }

                if (old >= 15)
                {
                    int i = Convert.ToInt16(dataGridView1.Rows[1].Cells[3].Value);
                    i++;
                    dataGridView1.Rows[1].Cells[3].Value = i;
                }

                //Порода 
                int ind = -1; 
                for (int j = 0; j < dataGridView2.ColumnCount; j++)
                {
                    if (Convert.ToString(dataGridView2.Rows[0].Cells[j].Value) == comboBox2.GetItemText(comboBox2.SelectedItem))
                    {
                        ind = j;
                        break; 
                    }
                }
                int k = Convert.ToInt16(dataGridView2.Rows[1].Cells[ind].Value);
                k++;
                dataGridView2.Rows[1].Cells[ind].Value = k;


                String Text = "Вы добавили запись в таблицу на 3 вкладке";
                add_listbox(Text);
            }
        }

        private void monthCalendar1_DateChanged(object sender, DateRangeEventArgs e)
        {
            
        }

        private void открытьToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void открытьToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            OpenFileDialog dialog = new OpenFileDialog();
            dialog.Filter = "Image files|*.png; *.jpg;*.bmp| All files(*.*)|*.*";
            if (dialog.ShowDialog() == DialogResult.OK)
            {
                image = new Bitmap(dialog.FileName);
                pictureBox1.Image = image;
                pictureBox1.Refresh();
            }

            String Text = "Загружен файл в фильтрах";
            add_listbox(Text);
        }

        private void сохранитьToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SaveFileDialog saveFileDialog1 = new SaveFileDialog();
            saveFileDialog1.Filter = "JPeg Image|*.jpg|Bitmap Image|*.bmp|Gif Image|*.gif";
            saveFileDialog1.Title = "Save an Image File";
            saveFileDialog1.ShowDialog();

            if (saveFileDialog1.FileName != "")
            {
                System.IO.FileStream fs = (System.IO.FileStream)saveFileDialog1.OpenFile();

                switch (saveFileDialog1.FilterIndex)
                {
                    case 1:
                        this.pictureBox1.Image.Save(fs,
                          System.Drawing.Imaging.ImageFormat.Jpeg);
                        break;

                    case 2:
                        this.pictureBox1.Image.Save(fs,
                          System.Drawing.Imaging.ImageFormat.Bmp);
                        break;

                    case 3:
                        this.pictureBox1.Image.Save(fs,
                          System.Drawing.Imaging.ImageFormat.Gif);
                        break;
                }

                fs.Close();
            }
            this.pictureBox1.Click += new System.EventHandler(this.сохранитьToolStripMenuItem_Click);
            String Text = "Файл сохранен";
            add_listbox(Text);
        }

        private void инверсияToolStripMenuItem_Click(object sender, EventArgs e)
        {
            InvertFilter f = new InvertFilter();
            backgroundWorker1.RunWorkerAsync(f);
            String Text = "Применен фильтр инверсия";
            add_listbox(Text);
        }

        private void увеличитьЯркостьToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Filters f5 = new bright();
            backgroundWorker1.RunWorkerAsync(f5);
            String Text = "Применен фильтр увеличить яркость";
            add_listbox(Text);
        }

        private void сепияToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Filters f4 = new Sepia();
            backgroundWorker1.RunWorkerAsync(f4);
            String Text = "Применен фильтр сепия";
            add_listbox(Text);
        }

        private void серыйToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Filters f3 = new GrayScale();
            backgroundWorker1.RunWorkerAsync(f3);
            String Text = "Применен серый фильтр";
            add_listbox(Text);
        }

        private void backgroundWorker1_DoWork(object sender, DoWorkEventArgs e)
        {
            Bitmap newImage = ((Filters)e.Argument).processImage(image, backgroundWorker1);
            if (backgroundWorker1.CancellationPending != true)
            {
                image = newImage;
            }
        }

        private void backgroundWorker1_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            progressBar1.Value = e.ProgressPercentage;
        }

        private void backgroundWorker1_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            if (!e.Cancelled)
            {
                pictureBox1.Image = image;
                pictureBox1.Refresh();
            }
            progressBar1.Value = 0;
        }

        private void коррекцияСОпорнымЦветомToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form1 win = new Form1();
            Color main;
            main = new Color();
            if (win.colorDialog1.ShowDialog() == System.Windows.Forms.DialogResult.OK)
                main = win.colorDialog1.Color;

            Filters f11 = new CorrectionWithAReferenceColor(main);

            backgroundWorker1.RunWorkerAsync(f11);
            String Text = "Применена коррекция изображения с опорным цветом";
            add_listbox(Text);
        }

        private void trackBar1_Scroll(object sender, EventArgs e)
        {
            label21.Text = "Текущее значение: " +  Convert.ToString(trackBar1.Value);
        }

        private void label20_Click(object sender, EventArgs e)
        {

        }

        private void label22_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button17_Click(object sender, EventArgs e)
        {
            //Возраст 
            chart1.Series.Clear();
            chart1.Series.Add("зависимость от возраста");
            chart1.Series[0].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Pie;

            
            int o1 = Convert.ToUInt16(dataGridView1.Rows[1].Cells[0].Value);
            int o17 = Convert.ToUInt16(dataGridView1.Rows[1].Cells[1].Value);
            int o715 = Convert.ToUInt16(dataGridView1.Rows[1].Cells[2].Value);
            int o15 = Convert.ToUInt16(dataGridView1.Rows[1].Cells[3].Value);
            int count = o1 + o15 + o17 + o715;

            if (count <= 0)
            {
                MessageBox.Show("Данных не существует. Создайте запись во вкладке База котиков ");
                String Text = "Не удалось получить диаграмму зависимости котиков от возраста. База котиков пуста";
                add_listbox(Text); 
            }
            else
            {
                chart1.Series[0].Points.AddXY("Меньше 1", o1);
                chart1.Series[0].Points.AddXY("1-7", o17);
                chart1.Series[0].Points.AddXY("7-15", o715);
                chart1.Series[0].Points.AddXY("От 15 лет", o15);

                String Text2 = "Получена диаграмма зависимости котиков от возраста";
                add_listbox(Text2);
            }


            //Порода 
            chart2.Series.Clear();
            chart2.Series.Add("зависимость от породы");
            chart2.Series[0].ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Column;

            
            int o0 = Convert.ToUInt16(dataGridView1.Rows[1].Cells[0].Value);
            int o2 = Convert.ToUInt16(dataGridView1.Rows[1].Cells[1].Value);
            int o3 = Convert.ToUInt16(dataGridView1.Rows[1].Cells[2].Value);
            int o4 = Convert.ToUInt16(dataGridView1.Rows[1].Cells[3].Value);
            int o5 = Convert.ToUInt16(dataGridView1.Rows[1].Cells[3].Value);
            int o6 = Convert.ToUInt16(dataGridView1.Rows[1].Cells[3].Value);
            int o7 = Convert.ToUInt16(dataGridView1.Rows[1].Cells[3].Value);

            if (count <= 0)
            {
                MessageBox.Show("Данных не существует. Создайте запись во вкладке База котиков ");
                String Text = "Не удалось получить диаграмму зависимости котиков от породы. База котиков пуста";
                add_listbox(Text); 
            }
            else
            {
                chart2.Series[0].Points.AddXY("Мейн-кун", o0);
                chart2.Series[0].Points.AddXY("Шотландская вислоухая", o2);
                chart2.Series[0].Points.AddXY("Бенгальская кошка", o3);
                chart2.Series[0].Points.AddXY("Сиамская кошка", o4);
                chart2.Series[0].Points.AddXY("Русская голубая ", o5);
                chart2.Series[0].Points.AddXY("Сибирская кошка ", o6);
                chart2.Series[0].Points.AddXY("Другой вариант", o7);

                String Text2 = "Получена диаграмма зависимости котиков от породы";
                add_listbox(Text2);
            }
        }
    }
}








