using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace seniorProject
{
    public partial class adminLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["DalilakConStr"].ConnectionString;

        static string prevPage = String.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.FindControl("linkHome").Visible = false;
            this.Master.FindControl("linkAbout").Visible = false;
            this.Master.FindControl("linkServices").Visible = false;
            this.Master.FindControl("linkPortfolio").Visible = false;
            this.Master.FindControl("linkTeam").Visible = false;
            this.Master.FindControl("linkContact").Visible = false;
            if (!IsPostBack)
            {
              
                prevPage = Request.UrlReferrer.ToString();
            }

        }


        protected void btnLogIn_Click1(object sender, EventArgs e)
        {
            try
            {
                if (ValidateEmpty(txtAdminEmail.Text) || ValidateEmpty(txtAdminPassword.Text))
                {
                    lblOutput.Text = "Please fill  all the fields correctly!";
                    lblOutput.ForeColor = System.Drawing.Color.Red;
                }

                else
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();

                    }


                    SqlCommand cmd = new SqlCommand("select * from admin where email='" + txtAdminEmail.Text.Trim() + "' AND password='" + txtAdminPassword.Text.Trim() + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            Session["name"] = dr.GetValue(1).ToString();
                            Session["email"] = dr.GetValue(2).ToString();
                            Session["role"] = "admin";
                        }


                        ScriptManager.RegisterStartupScript(this, this.GetType(),
                            "alert", "alert('Successfully Login, Hello Admin!');window.location = '" + prevPage + "'", true);

                    }
                    else
                    {
                        Response.Write("<script>alert('Invalid Email or Password');</script>");
                    }
                }
               
            }
            catch (Exception ex)
            {

            }
        }

        protected void lbtnForgotPass_Click(object sender, EventArgs e)
        {
            Response.Redirect("forgotPass.aspx");
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
