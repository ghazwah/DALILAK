using seniorProject.App_Code;
using System;
using System.Collections.Generic;
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
    public partial class forgotPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.FindControl("linkHome").Visible = false;
            this.Master.FindControl("linkAbout").Visible = false;
            this.Master.FindControl("linkServices").Visible = false;
            this.Master.FindControl("linkPortfolio").Visible = false;
            this.Master.FindControl("linkTeam").Visible = false;
            this.Master.FindControl("linkContact").Visible = false;
        }
        protected void btnSendEmail_Click(object sender, EventArgs e)
        {
            if (ValidateEmpty(txtAdminEmail.Text))
            {
                lblOutput.Text = "Please fill  all the fields correctly!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                try
                {
                    String guid = Guid.NewGuid().ToString();
                    int Pk = 0;
                    string Email = "";
                    CRUD myCrud = new CRUD();
                    string mySql = @"select * from admin where email =@email";
                    Dictionary<string, object> myPara = new Dictionary<string, object>();
                    myPara.Add("@email", txtAdminEmail.Text);

                    SqlDataReader dr = myCrud.getDrPassSqlDic(mySql, myPara);
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            Pk = int.Parse(dr["adminId"].ToString());
                            Email = dr["email"].ToString();
                            // send email 
                            sendEmail(Pk, Email, guid);
                            insertEmailGuid(Pk, Email, guid);
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
        }

        protected void insertEmailGuid(int Id, string Email, string Guid)
        {
            CRUD myCrud = new CRUD();
            string mySql = @"insert into forgotPass (guidId, adminId) values (@guidId, @adminId)";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@guidId", Guid);
            myPara.Add("@adminId", Id);
            int rtn = myCrud.InsertUpdateDeleteViaSqlDic(mySql, myPara);
            if (rtn >= 1)
            {
                lblOutput.Text = "Password reset instructions have been sent.";
                lblOutput.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblOutput.Text = "Failed Operation! Please Try Again";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void sendEmail(int intId, string strEmail, string strGuid)
        {
            try
            {
                String EmailBody = "Hello " + strEmail + ",<br/><br/> Click on the provided link to reset your password. <br/><br/> http://localhost:56830/resetPassword.aspx?adminId=" + strGuid;
                MailMessage PassRecMail = new MailMessage("dalilakproject@gmail.com", strEmail);
                PassRecMail.Body = EmailBody;
                PassRecMail.IsBodyHtml = true;
                PassRecMail.Subject = "Reset Password";
                PassRecMail.Priority = MailPriority.High;
                SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;
                SMTP.UseDefaultCredentials = false;
                SMTP.Credentials = new NetworkCredential()
                {
                    UserName = "dalilakproject@gmail.com",
                    Password = "dalilaK2022D"
                };
                SMTP.EnableSsl = true;
                SMTP.Send(PassRecMail);
                lblOutput.Text = "Password reset instructions have been sent, Check your email to reset your password.";
                lblOutput.ForeColor = System.Drawing.Color.Green;
                txtAdminEmail.Text = "";
            }
            catch (Exception)
            {
                lblOutput.Text = "Failed Operation! Please Try Again";
                lblOutput.ForeColor = System.Drawing.Color.Red;
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