using seniorProject.App_Code;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace seniorProject
{
    public partial class adminProfile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["DalilakConStr"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.FindControl("linkHome").Visible = false;
            this.Master.FindControl("linkAbout").Visible = false;
            this.Master.FindControl("linkServices").Visible = false;
            this.Master.FindControl("linkPortfolio").Visible = false;
            this.Master.FindControl("linkTeam").Visible = false;
            this.Master.FindControl("linkContact").Visible = false;
            try
            {
                if (Session["email"].ToString() == "" || Session["email"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("~/adminLogin.aspx");
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        getUserPersonalDetails();
                    }
                    else
                    {
                        //
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("~/adminLogin.aspx");
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (ValidateEmpty(txtName.Text) || ValidateEmpty(txtAdminId.Text) || ValidateEmpty(txtEmail.Text))
            {
                lblOutput.Text = "Please fill  all the fields correctly!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                int PK = int.Parse(txtAdminId.Text);
                string strTraName = txtName.Text;
                string strEmail = txtEmail.Text;
                string mySql = @"update admin set name = @name , email = @email
                                where adminId = @adminId";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@adminId", PK);
                myPara.Add("@name", strTraName);
                myPara.Add("@email", strEmail);
                CRUD myCrud = new CRUD();
                int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
                    if (rtn >= 1)
                    {
                        lblOutput.Text = "Success operation!";
                        lblOutput.ForeColor = System.Drawing.Color.Green;
                        sendEmail();
                    }
                    else
                    {
                        lblOutput.Text = "Failed operation!";
                        lblOutput.ForeColor = System.Drawing.Color.Red;
                    }
            }
        }
        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            if (ValidateEmpty(txtNewPass.Text))
            {
                lblAjax.Text = "Please fill the new password field correctly!";
                lblAjax.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                string mySql = @"update admin set password = @password
                               where adminId = @adminId";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@adminId", txtAdminId.Text);
                myPara.Add("@password", txtNewPass.Text);
                CRUD myCrud = new CRUD();
                int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
                if (rtn >= 1)
                {
                    lblAjax.Text = "Success operation!";
                    lblAjax.ForeColor = System.Drawing.Color.Green;
                    sendEmail();
                }
                else
                {
                    lblAjax.Text = "Failed operation!";
                    lblAjax.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        private bool ValidateEmpty(string empty)
        {
            if (empty == "")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        protected void sendEmail()
        {
            try
            {
                MailMessage ms = new MailMessage();
                ms.From = new MailAddress("dalilakproject@gmail.com");
                ms.To.Add(txtEmail.Text);
                ms.Subject = "DALILAK";
                ms.Body = "Thank you for updating your profile in DALILAK!";
                //
                SmtpClient sc = new SmtpClient("smtp.gmail.com", 587);
                sc.Port = 587;
                sc.Credentials = new NetworkCredential("dalilakproject@gmail.com", "dalilaK2022D");
                sc.EnableSsl = true;
                sc.Send(ms);
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (ChBoxDelete.Checked == true)
            {
                CRUD myCrud = new CRUD();
                string mySql = @"delete admin where adminId = @adminId";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@adminId", int.Parse(txtAdminId.Text));
                int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
                if (rtn >= 1)
                {
                    lblOutput.Text = "Success operation!";
                    lblOutput.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblOutput.Text = "Failed operation!";
                    lblOutput.ForeColor = System.Drawing.Color.Red;
                }
                Session["role"] = "";
                Response.Redirect("~/home.aspx");
            }
            else
            {
                lblOutput.Text = "Checkbox to approve account removal!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
        }
        void getUserPersonalDetails()
        {
            try
            {
                SqlConnection Con = new SqlConnection(strcon);
                if (Con.State == ConnectionState.Closed)
                {
                    Con.Open();
                }
                else
                { //
                }
                SqlCommand cmd = new SqlCommand(@"select adminId, name, email, password
                                                        from admin where email= '" + Session["email"] + "'", Con);
                SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                if (dtbl.Rows.Count > 0)
                {
                    txtAdminId.Text = dtbl.Rows[0]["adminId"].ToString();
                    txtName.Text = dtbl.Rows[0]["name"].ToString();
                    txtOldPass.Text = dtbl.Rows[0]["password"].ToString();
                    txtEmail.Text = dtbl.Rows[0]["email"].ToString();
                }
                else
                {
                    //
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected override void InitializeCulture()
        {
            base.InitializeCulture();
            if (Session["culture"] != null)
            {
                CultureInfo ci = new CultureInfo(Session["culture"].ToString());
                Thread.CurrentThread.CurrentCulture = ci;
                Thread.CurrentThread.CurrentUICulture = ci;
            }
        }
        protected void lbtn_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            switch (btn.ID)
            {
                case ("lbtnEnglish"):
                    Session["culture"] = "en-US";
                    Server.Transfer(Request.Url.PathAndQuery, false);
                    break;
                case ("lbtnArabic"):
                    Session["culture"] = "ar-SA";
                    Server.Transfer(Request.Url.PathAndQuery, false);
                    break;
            }
        }
    }
}