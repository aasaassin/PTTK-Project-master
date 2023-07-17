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
    
    public partial class Quanlyhocphan : Form
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
        public Quanlyhocphan()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            Themhocphan thp = new Themhocphan();
            thp.ShowDialog();
        }

        private void Quanlyhocphan_Load(object sender, EventArgs e)
        {
            txb_timkiem.Visible = false;
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (comboBox1.Text == "Thống kê Phiếu Dự Thi")
            {
                txb_timkiem.Text = "";
                txb_timkiem.Visible = true;
            }
            else
                txb_timkiem.Visible = false;
        }
        private void btn_thongke_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            string query;
            if(comboBox1.Text=="")
            {
                MessageBox.Show("Vui lòng chọn loại thống kê", "Thông báo");
                return;
            }    
            if(comboBox1.Text=="Thống kê Phiếu Dự Thi")
            {
                if (txb_timkiem.Text == "")
                    query = "Exec ThongKePDT '',1";
                else
                    query = "Exec ThongKePDT N'" + txb_timkiem.Text + "',2";
                dataGridView1.DataSource = getdata(query);
            }
            else
                if(comboBox1.Text== "Thống kê Học viên - Khóa học")
            {
                query = "Exec ThongKeHV_KH";
                dataGridView1.DataSource = getdata(query);
            }
            else
                if(comboBox1.Text== "Thống kê Học viên - Học phần")
            {
                query = "exec ThongKeHP";
                dataGridView1.DataSource = getdata(query);
            }
            else
                if(comboBox1.Text== "Thống kê Học viên - Chứng chỉ")
            {
                query = "exec ThongKeCC";
                dataGridView1.DataSource = getdata(query);
            }    
        }
    }
}
