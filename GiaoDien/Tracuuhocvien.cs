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
    public partial class Tracuuhocvien : Form
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
        public Tracuuhocvien()
        {
            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            Tracuuketqua tckq = new Tracuuketqua(txb_mahv.Text,txb_tenhv.Text);
            tckq.ShowDialog();
        }

        private void Tracuuhocvien_Load(object sender, EventArgs e)
        {
            string query = "Select * from HOCVIEN";
            dataGridView1.DataSource = getdata(query);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            string query = "exec Timhocvien '" + textBox1.Text + "'";
            dataGridView1.DataSource = getdata(query);
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int i;
            i = dataGridView1.CurrentRow.Index;
            txb_mahv.Text = dataGridView1.Rows[i].Cells[0].Value.ToString();
            txb_tenhv.Text = dataGridView1.Rows[i].Cells[1].Value.ToString();
            txb_ngaysinh.Text = dataGridView1.Rows[i].Cells[2].Value.ToString();
            txb_dc.Text = dataGridView1.Rows[i].Cells[3].Value.ToString();
            txb_cmnd.Text = dataGridView1.Rows[i].Cells[4].Value.ToString();
            txb_sdt.Text = dataGridView1.Rows[i].Cells[5].Value.ToString();
            txb_gioitinh.Text = dataGridView1.Rows[i].Cells[6].Value.ToString();
        }
    }
}
