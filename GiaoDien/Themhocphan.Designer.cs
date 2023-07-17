
namespace TrungTamTinHoc
{
    partial class Themhocphan
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.panel1 = new System.Windows.Forms.Panel();
            this.button2 = new System.Windows.Forms.Button();
            this.btn_themhocphan = new System.Windows.Forms.Button();
            this.txb_mota = new System.Windows.Forms.RichTextBox();
            this.txb_dongia = new System.Windows.Forms.TextBox();
            this.txb_tenhp = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.button2);
            this.panel1.Controls.Add(this.btn_themhocphan);
            this.panel1.Controls.Add(this.txb_mota);
            this.panel1.Controls.Add(this.txb_dongia);
            this.panel1.Controls.Add(this.txb_tenhp);
            this.panel1.Controls.Add(this.label4);
            this.panel1.Controls.Add(this.label3);
            this.panel1.Controls.Add(this.label2);
            this.panel1.Location = new System.Drawing.Point(2, 36);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(302, 312);
            this.panel1.TabIndex = 0;
            this.panel1.Paint += new System.Windows.Forms.PaintEventHandler(this.panel1_Paint);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(70, 274);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(70, 23);
            this.button2.TabIndex = 8;
            this.button2.Text = "Quay lại";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // btn_themhocphan
            // 
            this.btn_themhocphan.Location = new System.Drawing.Point(146, 274);
            this.btn_themhocphan.Name = "btn_themhocphan";
            this.btn_themhocphan.Size = new System.Drawing.Size(76, 23);
            this.btn_themhocphan.TabIndex = 7;
            this.btn_themhocphan.Text = "Thêm";
            this.btn_themhocphan.UseVisualStyleBackColor = true;
            this.btn_themhocphan.Click += new System.EventHandler(this.button1_Click);
            // 
            // txb_mota
            // 
            this.txb_mota.Location = new System.Drawing.Point(23, 172);
            this.txb_mota.Name = "txb_mota";
            this.txb_mota.Size = new System.Drawing.Size(253, 96);
            this.txb_mota.TabIndex = 6;
            this.txb_mota.Text = "";
            // 
            // txb_dongia
            // 
            this.txb_dongia.Location = new System.Drawing.Point(48, 113);
            this.txb_dongia.Name = "txb_dongia";
            this.txb_dongia.Size = new System.Drawing.Size(201, 20);
            this.txb_dongia.TabIndex = 4;
            // 
            // txb_tenhp
            // 
            this.txb_tenhp.Location = new System.Drawing.Point(48, 48);
            this.txb_tenhp.Name = "txb_tenhp";
            this.txb_tenhp.Size = new System.Drawing.Size(201, 20);
            this.txb_tenhp.TabIndex = 3;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(20, 151);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(125, 18);
            this.label4.TabIndex = 2;
            this.label4.Text = "Mô tả học phần";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(20, 82);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(66, 18);
            this.label3.TabIndex = 1;
            this.label3.Text = "Đơn giá";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(20, 15);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(110, 18);
            this.label2.TabIndex = 0;
            this.label2.Text = "Tên học phần";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(58, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(193, 24);
            this.label1.TabIndex = 0;
            this.label1.Text = "Thông tin học phần";
            // 
            // Themhocphan
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Info;
            this.ClientSize = new System.Drawing.Size(306, 353);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.panel1);
            this.MaximizeBox = false;
            this.Name = "Themhocphan";
            this.Text = "Themhocphan";
            this.Load += new System.EventHandler(this.Themhocphan_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.RichTextBox txb_mota;
        private System.Windows.Forms.TextBox txb_dongia;
        private System.Windows.Forms.TextBox txb_tenhp;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btn_themhocphan;
        private System.Windows.Forms.Button button2;
    }
}