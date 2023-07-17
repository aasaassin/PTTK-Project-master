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
    public partial class Trangchu : Form
    {
        private string idnv;
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
        public Trangchu(string idnv)
        {
            InitializeComponent();
            this.idnv = idnv;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            if(listBox1.Items.Count==0)
            {
                MessageBox.Show("Vui lòng chọn lớp học đăng ký!", "Thông báo");
                return;
            }
            List<string> items = new List<string>();
            for(int i = 0; i < listBox1.Items.Count; i++)
            {
                items.Add(listBox1.Items[i].ToString());
            }
            Dangkyhocphan dkhp = new Dangkyhocphan(items,0); // mode = 0: đăng ký lớp học phần
            dkhp.ShowDialog();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            Tracuuhocvien tchv = new Tracuuhocvien();
            tchv.ShowDialog();
        }

        private void button9_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            Xulythanhtoan xltt = new Xulythanhtoan();
            xltt.ShowDialog();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            TKB tkb = new TKB(idnv);
            tkb.ShowDialog();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            ChungChiQuocTe ccqt = new ChungChiQuocTe();
            ccqt.ShowDialog();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            Quanlyhocphan qlhp = new Quanlyhocphan();
            qlhp.ShowDialog();
        }

        private void button1_Click(object sender, EventArgs e) // hiển thị danh sách học phần
        { 
            Button btn = sender as Button;
            string query = "exec DanhSachLopHocPhanDK N'" + textBox1.Text + "'";
            dataGridView1.DataSource = getdata(query);
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void Trangchu_Load(object sender, EventArgs e)
        {
            string query = "exec DanhSachLopHocPhan";
            dataGridView1.DataSource = getdata(query);
            btn_xoa.Enabled = false;
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int i;
            i = dataGridView1.CurrentRow.Index;
            txb_mahp.Text = dataGridView1.Rows[i].Cells[0].Value.ToString();
            txb_tenhp.Text = dataGridView1.Rows[i].Cells[2].Value.ToString();
            rtxb_mota.Text = dataGridView1.Rows[i].Cells[5].Value.ToString();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            for (int i = 0; i < listBox1.Items.Count; i++)
                if (listBox1.Items[i].ToString() == txb_mahp.Text)
                {
                    MessageBox.Show("Lớp này đã được chọn", "Thông báo");
                    return;
                }
            listBox1.Items.Add(txb_mahp.Text);
        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
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
