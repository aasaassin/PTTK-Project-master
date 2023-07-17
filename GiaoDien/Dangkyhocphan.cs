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
    public partial class Dangkyhocphan : Form
    {
        private int mode;
        private List<string> items = new List<string>();
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
        public Dangkyhocphan(List<string> x,int m)
        {
            InitializeComponent();
            items = x;
            mode = m;
        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            this.Hide();
        }

        private void button1_Click(object sender, EventArgs e) // tìm kiếm theo tên
        {
            Button btn = sender as Button;
            string query = "exec TimHocVien N'" + textBox1.Text + "'";
            dataGridView1.DataSource = getdata(query);
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void Dangkyhocphan_Load(object sender, EventArgs e)
        {
            load_DSHV();
            btn_xoa.Enabled = false;
            btn_lapphieu.Enabled = false;
        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }
        void load_DSHV()
        {
            string query = "Select * from HocVien";
            dataGridView1.DataSource = getdata(query);
        }
        void locktext()
        {
            txb_cmnd.Enabled = false;
            txb_mahv.Enabled = false;
            txb_tenhv.Enabled = false;
            txb_ngaysinh.Enabled = false;
            txb_cmnd.Enabled = false;
            txb_sdt.Enabled = false;
            txb_dc.Enabled = false;
            radioButton1.Enabled = false;
            radioButton2.Enabled = false;
            dateTimePicker1.Enabled = false;
        }
        void unlocktext()
        {
            txb_cmnd.Enabled = true;
            txb_cmnd.Text = "";
            txb_mahv.Enabled = false;
            txb_mahv.Text = "";
            txb_tenhv.Enabled = true;
            txb_tenhv.Text = "";
            txb_ngaysinh.Text = "";
            txb_sdt.Enabled = true;
            txb_sdt.Text = "";
            txb_dc.Enabled = true;
            txb_dc.Text = "";
            radioButton1.Enabled = true;
            radioButton2.Enabled = true;
            dateTimePicker1.Enabled = true;
        }
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int i;
            i = dataGridView1.CurrentRow.Index;
            txb_mahv.Text = dataGridView1.Rows[i].Cells[0].Value.ToString();
            txb_tenhv.Text = dataGridView1.Rows[i].Cells[1].Value.ToString();
            txb_ngaysinh.Text = dataGridView1.Rows[i].Cells[2].Value.ToString();
            txb_sdt.Text = dataGridView1.Rows[i].Cells[5].Value.ToString();
            txb_cmnd.Text = dataGridView1.Rows[i].Cells[4].Value.ToString();
            txb_dc.Text = dataGridView1.Rows[i].Cells[3].Value.ToString();
            string gioitinh = dataGridView1.Rows[i].Cells[6].Value.ToString();
            if (gioitinh == "Nam")
                radioButton1.Checked = true;
            else
                radioButton2.Checked = true;
            btn_xoa.Enabled = true;
            btn_lapphieu.Enabled = true;
            btn_themhv.Enabled = false;
            locktext();
        }

        private void btn_xoa_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            unlocktext();
            btn_xoa.Enabled = false;
            btn_lapphieu.Enabled = false;
            btn_themhv.Enabled = true;
        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {
            
            txb_ngaysinh.Text = dateTimePicker1.Value.ToString("yyyy/MM/dd");
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            if (this.mode == 0) // xử lý đăng ký lớp học phần
            {
                for (int i = 0; i < items.Count; i++)
                {
                    string query = "Exec DangKyHoc '" + txb_mahv.Text + "','" + items[i] + "'";
                    if(!executequery(query))
                        MessageBox.Show("Đăng ký lớp "+items[i]+" không thành công!","Thông báo");
                }
                MessageBox.Show("Hoàn tất", "Thông báo");
            }
            else
                    if (this.mode == 1) // xử lý đăng ký thi chứng chỉ quốc tế
            {
                        for (int i = 0; i < items.Count; i++)
                        {
                            string query = "Exec LapPDT '" + txb_mahv.Text + "','" + items[i] + "'";
                            if (!executequery(query))
                                MessageBox.Show("Kì thi " + items[i] + " học viên này đã đăng ký rồi!", "Thông báo");
                        }
                        MessageBox.Show("Hoàn tất", "Thông báo");
            }

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            if(txb_cmnd.Text.Length==0||txb_dc.Text.Length==0||txb_ngaysinh.Text.Length==0||txb_sdt.Text.Length==0||txb_tenhv.Text.Length==0)
            {
                MessageBox.Show("Vui lòng nhập đầy đủ thông tin","Thông báo");
                return;
            }
            string gioitinh;
            if (radioButton1.Checked == true)
                gioitinh = "Nam";
            else
                gioitinh = "Nữ";
            if (txb_mahv.Text.Length == 0)
            {
                string query = "Exec ThemHocVien N'" + txb_tenhv.Text + "','" + txb_ngaysinh.Text + "',N'" + txb_dc.Text + "','" + txb_cmnd.Text + "','" + txb_sdt.Text + "',N'" + gioitinh + "'";
                if (executequery(query))
                {
                    MessageBox.Show("Thêm học viên mới thành công", "Thông báo");
                    load_DSHV();
                    unlocktext();
                    btn_xoa.Enabled = false;
                    btn_lapphieu.Enabled = false;
                    btn_themhv.Enabled = true;
                }
                else
                {
                    MessageBox.Show("Thêm học viên mới thất bại", "Thông báo");
                    return;
                }
            }
        }

        private void txb_mahv_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
