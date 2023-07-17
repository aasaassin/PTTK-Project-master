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
    public partial class Xulythanhtoan : Form
    {
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
        bool executequery(string query)
        {
            connection = new SqlConnection(Connectstring.constr);
            try
            {
                connection.Open();
                cmd = new SqlCommand(query, connection);
                cmd.ExecuteNonQuery();
                connection.Close();
                return true;
            }
            catch (Exception ex)
            {
                string error = ex.Message;
                cmd.Dispose();
                connection.Close();
                return false;
            }
        }
        public Xulythanhtoan()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {


        }
        void reload()
        {
            string query = "exec TruyVanHoaDon '','',1";
            dataGridView1.DataSource = getdata(query);
        }
        private void Xulythanhtoan_Load(object sender, EventArgs e)
        {
            reload();
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int i;
            i = dataGridView1.CurrentRow.Index;
            txb_mahv.Text = dataGridView1.Rows[i].Cells[2].Value.ToString();
            txb_tenhv.Text = dataGridView1.Rows[i].Cells[8].Value.ToString();
            txb_mahd.Text = dataGridView1.Rows[i].Cells[0].Value.ToString();
            txb_tongtien.Text = dataGridView1.Rows[i].Cells[5].Value.ToString();
            txb_trangthai.Text = dataGridView1.Rows[i].Cells[7].Value.ToString();
            txb_sl.Text = dataGridView1.Rows[i].Cells[4].Value.ToString();
            txb_ngaylap.Text = dataGridView1.Rows[i].Cells[3].Value.ToString();
            txb_hinhthuc.Text = dataGridView1.Rows[i].Cells[6].Value.ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            string query="";
            if(txb_tim.Text=="")
            {
                if (comboBox1.Text == "Tất cả")
                    query = "exec TruyVanHoaDon '','',1";
                else
                if (comboBox1.Text == "Đã thanh toán")
                    query = "exec TruyVanHoaDon '','DONE',2";
                else
                if (comboBox1.Text == "Chưa thanh toán")
                    query = "exec TruyVanHoaDon '','NONE',2";
            }
            else
            {
                if (comboBox1.Text == "Tất cả")
                    query = "exec TruyVanHoaDon N'" + txb_tim.Text + "','',3";
                else
                if(comboBox1.Text=="Đã thanh toán")
                    query = "exec TruyVanHoaDon N'" + txb_tim.Text + "','DONE',4";
                else
                if (comboBox1.Text == "Chưa thanh toán")
                    query = "exec TruyVanHoaDon N'" + txb_tim.Text + "','NONE',4";
            }
            dataGridView1.DataSource = getdata(query);
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            ChiTietHoaDon cthd = new ChiTietHoaDon(txb_mahd.Text);
            cthd.ShowDialog();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            if (txb_trangthai.Text == "DONE")
                MessageBox.Show("Hóa đơn đã thanh toán rồi. Vui lòng chọn hóa đơn khác!", "Thông báo");
            else
                if (txb_trangthai.Text == "")
                MessageBox.Show("Vui lòng chọn hóa đơn", "Thông báo");
            else
            {
                string query = "exec ThanhToan '" + txb_mahd.Text + "'";
                if (executequery(query))
                    MessageBox.Show("Thanh toán thành công!", "Thông báo");
                else
                    MessageBox.Show("Thanh toán thất bại", "Thông báo");
            }
            reload();
        }
    }
}
