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
    public partial class ChiTietHoaDon : Form
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
        private string mahd;
        public ChiTietHoaDon(string ma)
        {
            InitializeComponent();
            mahd = ma;
        }

        private void ChiTietHoaDon_Load(object sender, EventArgs e)
        {
            string query = "exec Xemchitiethoadon '" + mahd + "'";
            dataGridView1.DataSource = getdata(query);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Hide();
        }
    }
}
