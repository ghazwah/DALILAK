using seniorProject.App_Code;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace seniorProject
{
    public partial class trainingProgram : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Master.FindControl("linkHome").Visible = false;
            this.Master.FindControl("linkAbout").Visible = false;
            this.Master.FindControl("linkServices").Visible = false;
            this.Master.FindControl("linkPortfolio").Visible = false;
            this.Master.FindControl("linkTeam").Visible = false;
            this.Master.FindControl("linkContact").Visible = false;
            if (!Page.IsPostBack)
            {
                populateGvComments();
            }
            else
            {
                //
            }
            try
            {
                if (Session["role"] == null)
                {
                    gvComments.Columns[0].Visible = false;
                    gvComments.Columns[2].Visible = false;
                    gvComments.Columns[4].Visible = false;
                    btnExportToExcel.Visible = false;
                }

                else if (Session["role"].Equals("admin"))
                {
                    //

                }
            }
            catch (Exception ex)
            {
                //
            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (ValidateEmpty(txtName.Text) || ValidateEmpty(txtEmail.Text) || ValidateEmpty(txtComment.Text))
            {
                lblOutput.Text = "Please fill  all the fields correctly!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                CRUD myCrud = new CRUD();
                string mySql = @" insert into comments (Name , Email, Comment)
                values (@Name, @Email, @Comment)";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@Name ", txtName.Text);
                myPara.Add("@Email", txtEmail.Text);
                myPara.Add("@Comment", txtComment.Text);
                int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
                if (rtn >= 1)
                {
                    lblOutput.Text = "The comment has been added successfully!";
                    lblOutput.ForeColor = System.Drawing.Color.Green;

                }
                else
                {
                    lblOutput.Text = "Pleas try again!";
                    lblOutput.ForeColor = System.Drawing.Color.Red;
                }
                populateGvComments();
                clearMsg();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtName.Text =""; 
            txtEmail.Text ="";
            txtComment.Text = "";
            clearMsg();
        }

        protected void btnDeleteCom_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();

            try
            {
                Button btn = sender as Button;
                GridViewRow grow = btn.NamingContainer as GridViewRow;
                int Id = int.Parse(btn.CommandArgument);
                CRUD myCrud = new CRUD();
                string mySql = @"delete  from  comments where Id=@Id";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@Id", Id);
                int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
                lblOutput.Text = "The comment has been deleted successfully!";
                lblOutput.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblOutput.Text = "Failed to delete!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }

            populateGvComments();




        }

        protected void populateGvComments()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select Id, Name, Email, Comment from comments ";
            using (SqlDataReader dr = myCrud.getDrPassSql(mySql))
            {
                if (dr.HasRows)
                {
                    gvComments.DataSource = dr;
                    gvComments.DataBind();
                }
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            exportManager.ExportGridToExcel(gvComments, "export to Excel");
        }

        protected void clearMsg()
        {
            lblOutput.Text = "";
            txtName.Text = "";
            txtEmail.Text = "";
            txtComment.Text = "";
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