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
    public partial class Tracuuketqua : Form
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
        private string mahv, tenhv;
        public Tracuuketqua(string ma,string ten)
        {
            InitializeComponent();
            mahv = ma;
            tenhv = ten;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int i;
            i = dataGridView1.CurrentRow.Index;
            txb_tenhp.Text = dataGridView1.Rows[i].Cells[0].Value.ToString();
            txb_diem.Text = dataGridView1.Rows[i].Cells[1].Value.ToString();
            string tt= dataGridView1.Rows[i].Cells[2].Value.ToString();
            if (tt == "R")
                txb_trangthai.Text = "Rớt";
            else
                txb_trangthai.Text = "Đậu";
        }

        private void Tracuuketqua_Load(object sender, EventArgs e)
        {
            txb_mahv.Text = mahv;
            txb_tenhv.Text = tenhv;
            string query = "exec XemKetQuaHV '" + txb_mahv.Text + "'";
            dataGridView1.DataSource = getdata(query);
        }
    }
}
