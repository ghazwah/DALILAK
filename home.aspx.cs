using seniorProject.App_Code;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace seniorProject
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendMessage_Click(object sender, EventArgs e)
        {
            sendEmail();
        }

        protected void sendEmail() {
            {
                string rtn = "";
                string myTo = "";
                if (!string.IsNullOrEmpty(Session["email"] as string))
                {
                    myTo = (Session["email"].ToString());
                }
                else
                {
                    myTo = "dalilakproject@gmail.com";
                }
                string senderEmail = txtSenderEmail.Text;
                string subject = txtSubject.Text;
                string myBody = "";
                senderEmail = txtSenderEmail.Text;
                subject = txtSubject.Text;
                myBody = "";
                myBody += (string.IsNullOrEmpty(Session["email"] as string) ? senderEmail + "\n\n" : "");
                myBody += txtMessage.Text;
                myBody += @"


        Regards,

        Dalilak Family.
        Senior Project For CSE.
        Students at UHB.
        2021-2022.
        Hafr Albatin.
        Kingdom Of Saudi Arabia.";

                try
                {
                    mailMgr myMailmgr = new mailMgr();
                    rtn = myMailmgr.sendEmailViaGmail(myTo, senderEmail, subject, myBody, FileUpload);
                   
                }
                catch (Exception ex)
                {
                   
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                                      "alert", "alert('Email Successful Send');window.location ='home.aspx';", true);
                clearMsg();
            }
           
        }

        protected void clearMsg()
        {
            common.clearControl(txtSenderEmail);
            common.clearControl(txtSubject);
            common.clearControl(txtMessage);

            Session["email"] = null;

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

