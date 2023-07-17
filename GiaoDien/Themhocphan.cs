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
    public partial class Themhocphan : Form
    {
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter adapter = new SqlDataAdapter();
        SqlConnection connection = new SqlConnection();
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
        public Themhocphan()
        {
            InitializeComponent();
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void Themhocphan_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            if(txb_dongia.Text==""||txb_tenhp.Text==""||txb_mota.Text=="")
            {
                MessageBox.Show("Vui lòng nhập đầy đủ thông tin", "Thông báo");
                return;
            }
            decimal dg = decimal.Parse(txb_dongia.Text);
            string query = "exec ThemHP N'" + txb_tenhp.Text + "','" + dg + "',N'" + txb_mota.Text + "'";
            if (executequery(query))
                MessageBox.Show("Thêm học phần thành công", "Thông báo");
        }
    }
}
