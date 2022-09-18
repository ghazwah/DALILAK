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
    public partial class resetPassword : System.Web.UI.Page
    {

        string CS = ConfigurationManager.ConnectionStrings["DalilakConStr"].ConnectionString;
        string GUIDvalue;
        DataTable dt = new DataTable();
        int adminId;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.FindControl("linkHome").Visible = false;
            this.Master.FindControl("linkAbout").Visible = false;
            this.Master.FindControl("linkServices").Visible = false;
            this.Master.FindControl("linkPortfolio").Visible = false;
            this.Master.FindControl("linkTeam").Visible = false;
            this.Master.FindControl("linkContact").Visible = false;
            using (SqlConnection con = new SqlConnection(CS))
            {
                GUIDvalue = Request.QueryString["adminId"];
                if (GUIDvalue != null)
                {
                    SqlCommand cmd = new SqlCommand("select * from forgotPass where guidId='" + GUIDvalue + "'", con);
                    con.Open();
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {
                        adminId = Convert.ToInt32(dt.Rows[0][2]);
                    }
                    else
                    {
                        Response.Write("<script>alert('Your Password Reset Link is Expired or Invalid !');</script>");
                    }
                }
                else
                {
                    Response.Redirect("forgotPass.aspx");
                }
            }
            if (!IsPostBack)
            {
                if (dt.Rows.Count != 0)
                {
                    txtNewPass.Visible = true;
                    txtConfirmPass.Visible = true;
                    btRecPass.Visible = true;
                }
                else
                {
                    Response.Write("<script>alert('Your Password Reset Link is Expired or Invalid !');</script>");
                }
            }
        }

        protected void btRecPass_Click(object sender, EventArgs e)
        {
            if (txtNewPass.Text != "" && txtConfirmPass.Text != "" && txtNewPass.Text == txtConfirmPass.Text)
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("update admin set password='" + txtNewPass.Text + "' where adminId='" + adminId + "'", con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    SqlCommand cmd2 = new SqlCommand("delete from forgotPass where adminId='" + adminId + "'", con);
                    cmd2.ExecuteNonQuery();
                    //Response.Write("<script>alert('The password successfully changed!');</script>");
                    //Server.Transfer("home.aspx");
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                                       "alert", "alert('The password successfully changed!');window.location ='home.aspx';", true);
                
            }

            }
        
            else
            {
                Response.Write("<script>alert('All fields are mandatory!');</script>");
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