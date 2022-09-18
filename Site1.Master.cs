using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace seniorProject
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                if (Session["role"] == null)
                {
                    linkAdminLogin.Visible = true; // Admin login link button
                    linkAdminLogout.Visible = false; // Admin logout link button
                    lbtnMsg.Visible = false; // Hello user link button

                }

                else if (Session["role"].Equals("admin"))
                {
                    linkAdminLogin.Visible = false; // Admin login link button
                    linkAdminLogout.Visible = true; // Admin logout link button
                    lbtnMsg.Visible = true; // Hello user link button
                    lbtnMsg.Text = "Hello, &nbsp;" + Session["name"].ToString();
                }

                else
                {
                    //
                }
            }
            catch (Exception ex)
            {
                //
            }


        }

        protected void linkAdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminLogin.aspx");
        }

        protected void lbtnMsg_Click(object sender, EventArgs e)
        {
            if (Session["role"].Equals("admin"))
            {
                Response.Redirect("adminProfile.aspx");
            }
            else
            {
               //
            }
        }

        protected void linkAdminLogout_Click(object sender, EventArgs e)
        {
            Session["name"] = null;
            Session["role"] = null;
            linkAdminLogin.Visible = true; // Admin login link button
            linkAdminLogout.Visible = false; // Admin logout link button
            lbtnMsg.Visible = false; // hello Admin link button
            Response.Redirect("home.aspx");
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
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