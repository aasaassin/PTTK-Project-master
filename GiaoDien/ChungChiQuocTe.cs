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

namespace TrungTamTinHoc
{
    
    public partial class ChungChiQuocTe : Form
    {
        List<string> listccqt = new List<string>();
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter adapter = new SqlDataAdapter();
        SqlConnection connection = new SqlConnection();
        DataTable getdata(string query)
        {
            connection = new SqlConnection(Connectstring.constr);
            try
            {
                connection.Open();
                cmd = new SqlCommand(query, connection); // thực hiện câu lệnh truy vấn đến csdl
                cmd.CommandType = CommandType.Text;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd); // lưu dữ liêu lấy được vào đây
                DataTable dt = new DataTable();
                adapter.Fill(dt); // đổ dữ liệu vào table
                connection.Close();
                return dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Error");
                cmd.Dispose();
                connection.Close();
                return null;
            }
        }
        public ChungChiQuocTe()
        {
            InitializeComponent();
        }

        private void ChungChiQuocTe_Load(object sender, EventArgs e)
        {
            string query = "exec ChiTietCCQT";
            dataGridView1.DataSource = getdata(query);
            btn_xoa.Enabled = true;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            if (listBox1.Items.Count == 0)
            {
                MessageBox.Show("Vui lòng chọn chứng chỉ thi!", "Thông báo");
                return;
            }
            List<string> items = new List<string>();
            for (int i = 0; i < listBox1.Items.Count; i++)
            {
                items.Add(listBox1.Items[i].ToString());
            }
            Dangkyhocphan dkhp = new Dangkyhocphan(items, 1); // mode = 1: đăng ký lớp học phần
            dkhp.ShowDialog();
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int i;
            i = dataGridView1.CurrentRow.Index;
            txb_macc.Text = dataGridView1.Rows[i].Cells[0].Value.ToString();
            txb_tencc.Text = dataGridView1.Rows[i].Cells[1].Value.ToString();
            txb_ngaythi.Text = dataGridView1.Rows[i].Cells[2].Value.ToString();
            txb_giothi.Text = dataGridView1.Rows[i].Cells[3].Value.ToString();
            txb_giatien.Text = dataGridView1.Rows[i].Cells[4].Value.ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            for(int i =0;i<listBox1.Items.Count;i++)
                if(listBox1.Items[i].ToString()==txb_macc.Text)
                {
                    MessageBox.Show("Kì thi này đã được chọn", "Thông báo");
                    return;
                }
            listBox1.Items.Add(txb_macc.Text);
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            listBox1.Items.Remove(listBox1.SelectedItem);
            btn_xoa.Enabled = false;
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            btn_xoa.Enabled = true;
        }
    }
}
