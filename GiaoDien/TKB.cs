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
    public partial class TKB : Form
    {
        string magv, idnv;
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
        public TKB(string id)
        {
            InitializeComponent();
            idnv = id;
        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void TKB_Load(object sender, EventArgs e)
        {
            string query2 = "select * from GiaoVien";
            string query1 = "select * from HocPhan";
            dataGridView1.DataSource = getdata(query1);
            dataGridView2.DataSource = getdata(query2);
            string query3 = "select MAPH from PHONGHOC";
            DataTable dt = getdata(query3);
            foreach (DataRow row in dt.Rows)
                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    comboBox2.Items.Add(row[i].ToString());
                }
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int i;
            i = dataGridView1.CurrentRow.Index;
            txb_mahp.Text = dataGridView1.Rows[i].Cells[0].Value.ToString();
            txb_tenhp.Text = dataGridView1.Rows[i].Cells[1].Value.ToString();
            txb_giatien.Text = dataGridView1.Rows[i].Cells[2].Value.ToString();
            txb_mota.Text = dataGridView1.Rows[i].Cells[3].Value.ToString();
        }

        private void dataGridView2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int i;
            i = dataGridView2.CurrentRow.Index;
            txb_gv.Text = dataGridView2.Rows[i].Cells[1].Value.ToString();
            magv = dataGridView2.Rows[i].Cells[0].Value.ToString();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            string query = "Exec LapTKB '" +txb_malop.Text+"','"+ comboBox2.Text + "','" + magv + "','"+idnv+"','"+txb_mahp.Text+"',"+ Int32.Parse(txb_ss.Text)+",'"+comboBox3.Text+"'";
            if (executequery(query))
                MessageBox.Show("Tạo lớp thành công", "Thông báo");
            else
                MessageBox.Show("Tạo lớp thất bại", "Thông báo");

        }
    }
}
