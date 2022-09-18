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
    public partial class chatUsers : System.Web.UI.Page
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

        protected void brnadd_Click(object sender, EventArgs e)
        {
            if (ValidateEmpty(txtname.Text))
            {
                lblOutput.Text = "Please fill the name correctly!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                Session["name"] = txtname.Text;
                lbluname.Text = "Welcome " + txtname.Text;
                txtname.Text = "";
                clearMsg();
            }
            
        }
        protected void btnsend_Click(object sender, EventArgs e)
        {
            if (ValidateEmpty(lbluname.Text))
            {
                lblOutput.Text = "If you would like to chat, please add your name first!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            else if (ValidateEmpty(txtsend.Text))
            {
                lblOutput.Text = "Please fill the message correctly!";
                lblOutput.ForeColor = System.Drawing.Color.Red;

            }
            else
            {

            string name = Session["name"].ToString();
            string message = txtsend.Text;
            string my = name + ":" + message;

            Application["message"] = Application["message"] + my + Environment.NewLine;
            txtsend.Text = "";
                clearMsg();

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

        protected void clearMsg()
        {
            lblOutput.Text = "";
        }
    }
}