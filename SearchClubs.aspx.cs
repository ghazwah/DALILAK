using seniorProject.App_Code;
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
    public partial class SearchClubs : System.Web.UI.Page
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

            populateGvClubs();

            if (!Page.IsPostBack)
            {
              
                getadminDetails();
            }
            else
            {
                //
            }
            try
            {
                if (Session["role"] == null)
                {
                    txtAdminId.Visible = false;
                    labelAdminId.Visible = false;
                    txtClubsId.Visible = false;
                    labelClubsId.Visible = false;
                    txtClubsName.Visible = false;
                    labelClubsName.Visible = false;
                    txtInformation.Visible = false;
                    labelInformation.Visible = false;
                    txtContact.Visible = false;
                    labelContact.Visible = false;
                    txtVision.Visible = false;
                    labelVision.Visible = false;
                    gvClubs.Columns[0].Visible = false;
                    gvClubs.Columns[1].Visible = false;
                    gvClubs.Columns[6].Visible = false;
                    gvClubs.Columns[7].Visible = false;
                    btnInsert.Visible = false;
                    btnUpdate.Visible = false;
                        
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

    protected void populateGvClubs()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select clubsId,adminId,clubsname, information, contact,vision
                                     from clubs";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            gvClubs.DataSource = dr;
            gvClubs.DataBind();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        { 
            try
            {
                Button btn = sender as Button;
                GridViewRow grow = btn.NamingContainer as GridViewRow;
                txtClubsId.Text = (grow.FindControl("lblClubsId") as Label).Text;
                txtAdminId.Text = (grow.FindControl("lblAdminId") as Label).Text;
                txtClubsName.Text = (grow.FindControl("lblClubsName") as Label).Text;
                txtInformation.Text = (grow.FindControl("lblInformation") as Label).Text;
                txtContact.Text = (grow.FindControl("lblContact") as Label).Text;
                txtVision.Text = (grow.FindControl("lblVision") as Label).Text;
            }
            catch
            {
            }
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            GridViewRow grow = btn.NamingContainer as GridViewRow;
            int intClubId = int.Parse((grow.FindControl("lblClubsId") as Label).Text);
            string mySql = @"delete clubs where clubsId = @clubsId";
            Dictionary<string, object> myPara = new Dictionary<string, object>();
            myPara.Add("@clubsId", intClubId);
            CRUD myCrud = new CRUD();
            int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
            if (rtn >= 1)
            { lblOutput.Text = "The club has been deleted successfully!";
              lblOutput.ForeColor = System.Drawing.Color.Green;

            }
            else
            { lblOutput.Text = "Failed  Operation!";
              lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            populateGvClubs();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            if (ValidateEmpty(txtAdminId.Text) || ValidateEmpty(txtClubsName.Text) || ValidateEmpty(txtContact.Text) || ValidateEmpty(txtInformation.Text) || ValidateEmpty(txtVision.Text) )
            {
                lblOutput.Text = "Please fill  all the fields correctly!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                CRUD myCrud = new CRUD();
                string mySql = @"insert  clubs(adminId,clubsname,information,contact,vision)
                        values (@adminId,@clubsname,@information,@contact,@vision)";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@adminId", txtAdminId.Text);
                myPara.Add("@clubsname", txtClubsName.Text);
                myPara.Add("@information", txtInformation.Text);
                myPara.Add("@contact", txtContact.Text);
                myPara.Add("@vision", txtVision.Text);
                int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
                if (rtn >= 1)
                { lblOutput.Text = "The club has been inserted successfully!";
                    lblOutput.ForeColor = System.Drawing.Color.Green;
                }
                else
                { lblOutput.Text = "Failed  Operation!";
                  lblOutput.ForeColor = System.Drawing.Color.Red;
                }
                clearMsg();
            }
            populateGvClubs();
        }

        protected void btnUpdate_Click1(object sender, EventArgs e)
        {
            if (ValidateEmpty(txtAdminId.Text) || ValidateEmpty(txtClubsId.Text) || ValidateEmpty(txtClubsName.Text) || ValidateEmpty(txtContact.Text) || ValidateEmpty(txtInformation.Text) || ValidateEmpty(txtVision.Text))
            {
                lblOutput.Text = "Please fill  all the fields correctly!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                try
                {
                    Button btn = sender as Button;
                    GridViewRow grow = btn.NamingContainer as GridViewRow;
                    int intclubId = int.Parse(txtClubsId.Text);
                    int intadminId = int.Parse(txtAdminId.Text);
                    string strClubsName = txtClubsName.Text;
                    string strInformation = txtInformation.Text;
                    string strContact = txtContact.Text;
                    string strVision = txtVision.Text;
                    CRUD myCrud = new CRUD();
                    string mySql = @"update clubs set adminId=@adminId,clubsname=@clubsname,information=@information,contact=@contact,vision=@vision
                            where clubsId =@clubsId";
                    Dictionary<string, object> myPara = new Dictionary<string, object>();
                    myPara.Add("@clubsId", intclubId);
                    myPara.Add("@adminId", intadminId);
                    myPara.Add("@clubsname", strClubsName);
                    myPara.Add("@information", strInformation);
                    myPara.Add("@contact", strContact);
                    myPara.Add("@vision", strVision);
                    int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
                    if (rtn >= 1)
                    { lblOutput.Text = "The club has been updated successfully!";
                      lblOutput.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    { lblOutput.Text = "Failed  Operation!";
                        lblOutput.ForeColor = System.Drawing.Color.Red;
                    }
                }
                catch
                {
                    //
                }
                clearMsg();
            }
            populateGvClubs();
        }


        void getadminDetails()
        {
            try
            {
                SqlConnection DalilakConStr = new SqlConnection(strcon);
                if (DalilakConStr.State == ConnectionState.Closed)
                {
                    DalilakConStr.Open();
                }
                SqlCommand cmd = new SqlCommand(@"select adminId from admin where email= '" + Session["Email"] + "'", DalilakConStr);
                SqlDataAdapter sqlDa = new SqlDataAdapter(cmd);
                DataTable dtbl = new DataTable();
                sqlDa.Fill(dtbl);
                if (dtbl.Rows.Count > 0)
                {
                    txtAdminId.Text = dtbl.Rows[0]["adminId"].ToString();
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

        protected void clearMsg()
        {
            txtClubsId.Text = "";
            txtClubsName.Text = "";
            txtInformation.Text = "";
            txtContact.Text = "";
            txtVision.Text = "";

        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        protected void btnExportToPdf_Click(object sender, EventArgs e)
        {
            exportManager.ExportToPdf(gvClubs);
        }
        protected void btnExportToExcel_Click(object sender, EventArgs e)
        {
            exportManager.ExportGridToExcel(gvClubs, "export to Excel");
        }
        protected void btnExportToWord_Click(object sender, EventArgs e)
        {
            exportManager.ExportGridToWord(gvClubs, "export to word");
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