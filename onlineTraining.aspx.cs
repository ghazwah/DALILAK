using seniorProject.App_Code;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace seniorProject
{
    public partial class onlineTraining : System.Web.UI.Page
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
            if (!Page.IsPostBack)
            {
                populateddlTrainingProgramType();
                populateCBLColleges();
                getadminDetails();
                populateGvDocs();
            }
            else
            {
                //
            }
            try
            {

                if (Session["role"] == null)
                {
                    FileUpload1.Visible = false;
                    btnUpload.Visible = false;
                    btnClear.Visible = false;
                    txtAdminId.Visible = false;
                    ddlTrainingProgramType.Visible = false;
                    cblColleges.Visible = false;
                    labelAdminId.Visible = false;
                    labelTrainingProgramType.Visible = false;
                    labelCollages.Visible = false;
                    labelFile.Visible = false;
                    cbSelectAll.Visible = false;
                    btnDeleteAll.Visible = false;
                    gvDocs.Columns[0].Visible = false;
                    gvDocs.Columns[2].Visible = false;
                    gvDocs.Columns[5].Visible = false;
                    gvDocs.Columns[6].Visible = false;
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

        protected void populateddlTrainingProgramType()
        {
            ddlTrainingProgramType.Items.Add("--Select Training--");
            CRUD myCrud = new CRUD();
            string mySql = @"select trainingprogramtypeId, trainingprogramtype from trainingprogramtype";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlTrainingProgramType.DataValueField = "trainingprogramtypeId";
            ddlTrainingProgramType.DataTextField = "trainingprogramtype";
            ddlTrainingProgramType.DataSource = dr;
            ddlTrainingProgramType.DataBind();
        }

        protected void populateCBLColleges()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select collegeId, collegename from college ";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            cblColleges.DataValueField = "collegeId";
            cblColleges.DataTextField = "collegename";
            cblColleges.DataSource = dr;
            cblColleges.DataBind();
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (ValidateEmpty(txtAdminId.Text) || (ddlTrainingProgramType.SelectedValue == "--Select Training--") || ValidateEmpty(cblColleges.SelectedValue))
            {
                lblOutput.Text = "Please fill  all the fields correctly!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                if (FileUpload1.HasFile)
                {
                    String fileExtention = System.IO.Path.GetExtension(FileUpload1.FileName);
                    if (fileExtention.ToLower() != ".pdf" && fileExtention.ToLower() != ".docx" && fileExtention.ToLower() != ".doc" && fileExtention.ToLower() != ".xls" && fileExtention.ToLower() != ".xlsx")
                    {
                        lblOutput.Text = "Please PDF or Word or Excel!";
                        lblOutput.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        int adminId = int.Parse(txtAdminId.Text);
                        CRUD myCrud = new CRUD();
                        string mySql = @" select name from 
		            admin adm inner join trainingprogram trpr on adm.adminId = trpr.adminId";
                        Dictionary<string, object> myPara = new Dictionary<string, object>();
                        myPara.Add("@adminId", adminId);
                        SqlDataReader dr = myCrud.getDrPassSql(mySql, myPara);
                        InsertDocuments(adminId);
                        FileUpload1.SaveAs(Server.MapPath("~/Uploads/" + FileUpload1.FileName));
                        lblOutput.Text = "The file has been uploaded successfully!";
                        lblOutput.ForeColor = System.Drawing.Color.Green;
                    }
                }
                else
                {
                    lblOutput.Text = "Please select file to upload!";
                    lblOutput.ForeColor = System.Drawing.Color.Red;
                }
                clearMsg();
            }
        }

        protected void InsertDocuments(int adminId)
        {
            foreach (HttpPostedFile postedFile in FileUpload1.PostedFiles)
            {
                string filename = Path.GetFileName(postedFile.FileName);
                string contentType = postedFile.ContentType;
                using (Stream fs = postedFile.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        CRUD DocInsert = new CRUD();
                        string mySql = @"insert into trainingprogram(adminId,trainingprogramtypeId,collegeId,documentName,contentType,documentData) 
                                        values(@adminId,@trainingprogramtypeId,@collegeId,@documentName,@contentType,@documentData)";
                        Dictionary<string, object> myPara = new Dictionary<string, object>();
                        myPara.Add("@adminId", adminId);
                        myPara.Add("@trainingprogramtypeId", ddlTrainingProgramType.SelectedValue);
                        string selectCollege = "";
                        for (int i = 0; i < cblColleges.Items.Count; i++)
                        {
                            if (cblColleges.Items[i].Selected)
                            {
                                if (selectCollege == "")
                                {
                                    selectCollege = cblColleges.Items[i].ToString();

                                }
                                else
                                {
                                    selectCollege += "," + cblColleges.Items[i].ToString();
                                }
                            }

                        }
                        myPara.Add("@collegeId", selectCollege);
                        myPara.Add("@documentName", filename);
                        myPara.Add("@contentType", contentType);
                        myPara.Add("@documentData", bytes);
                        int rtn = DocInsert.InsertUpdateDelete(mySql, myPara);
                        lblOutput.Text = "The file has been uploaded successfully!";
                        lblOutput.ForeColor = System.Drawing.Color.Blue;
                        populateGvDocs();
                    }
                }
            }
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            cblColleges.SelectedValue = null;
            ddlTrainingProgramType.SelectedIndex = 0;
            clearMsg();
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

        protected void btnDeleteDoc_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            try
            {
                Button btn = sender as Button;
                GridViewRow grow = btn.NamingContainer as GridViewRow;
                int trainingprogramId = int.Parse(btn.CommandArgument);
                CRUD myCrud = new CRUD();
                string mySql = @"delete  trainingprogram  where trainingprogramId=@trainingprogramId";
                Dictionary<string, object> myPara = new Dictionary<string, object>();
                myPara.Add("@trainingprogramId", trainingprogramId);
                int rtn = myCrud.InsertUpdateDelete(mySql, myPara);
                lblOutput.Text = "The file has been deleted successfully!";
                lblOutput.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {

                lblOutput.Text = "Failed to delete!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            populateGvDocs();
        }

        protected void DownloadFile(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                int trainingprogramId = int.Parse((sender as LinkButton).CommandArgument);
                byte[] bytes;
                string fileName, contentType;
                string constr = CRUD.conStr;
                using (SqlConnection con = new SqlConnection(constr))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = @"  select  documentName,documentData from trainingprogram
                                              where trainingprogramId = @trainingprogramId";
                        cmd.Parameters.AddWithValue("@trainingprogramId", trainingprogramId);
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            if (sdr.HasRows)
                            {
                                sdr.Read();
                                bytes = (byte[])sdr["documentData"];

                                fileName = sdr["documentName"].ToString();   //fileName changed to docName
                            }
                            else
                            {
                                lblOutput.Text = "File not found!";
                                lblOutput.ForeColor = System.Drawing.Color.Red;
                                return;
                            }
                        }
                        con.Close();
                    }
                }
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
                Response.BinaryWrite(bytes);
                Response.Flush();
                Response.End();
            }
        }

        protected void populateGvDocs()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select trainingprogramId,collegeId,name, documentName, dateUploaded
                                     from trainingprogram trpr inner join  admin ad on trpr.adminId=ad.adminId  where trpr.trainingprogramtypeId = 3";
            using (SqlDataReader dr = myCrud.getDrPassSql(mySql))
            {
                if (dr.HasRows)
                {
                    gvDocs.DataSource = dr;
                    gvDocs.DataBind();
                }
            }

        }

        protected void btnDeleteAll_Click(object sender, EventArgs e)
        {
            string trainingprogramId = "";
            foreach (GridViewRow row in gvDocs.Rows)
            {
                if ((row.FindControl("chkSelect") as CheckBox).Checked)
                {
                    trainingprogramId += Convert.ToInt32(gvDocs.DataKeys[row.RowIndex].Value) + ",";
                }
                // need to remove last comma
            }

            if (trainingprogramId.Length >= 1) // to ensure we have a selected docs to be deleted
            {
                using (SqlConnection con = new SqlConnection(@"Data Source = DESKTOP-45E338K\SQLEXP2017; Initial Catalog = Dalilak ; Uid = sa ; pwd = 54321rrRR;"))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE FROM trainingprogram WHERE trainingprogramId in (" + removeLastChar(trainingprogramId) + ")", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }

            }
            populateGvDocs();
        }

        protected void OnRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvDocs.EditIndex = -1;
            populateGvDocs();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDocs.EditIndex = e.NewEditIndex;
            populateGvDocs();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvDocs.Rows[e.RowIndex];
            int trainingprogramId = Convert.ToInt32((row.FindControl("lblEditId") as LinkButton).Text);
            FileUpload FileUpload1 = row.FindControl("fuEditFile") as FileUpload;
            string collegeId = ((row.FindControl("txtEditCollege") as TextBox).Text);
            string fileName = string.Empty;
            if (FileUpload1.HasFile)
            {
                fileName = FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath("~/Uploads/") + fileName);
            }
            foreach (HttpPostedFile postedFile in FileUpload1.PostedFiles)
            {
                string filename = Path.GetFileName(postedFile.FileName);
                string contentType = postedFile.ContentType;
                using (Stream fs = postedFile.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        CRUD DocInsert = new CRUD();
                        string mySql = @"update trainingprogram set  collegeId=@collegeId,  documentName=@documentName,
                                 contentType=@contentType, documentData=@documentData, dateUploaded=@dateUploaded where trainingprogramId =@trainingprogramId";
                        Dictionary<string, object> myPara = new Dictionary<string, object>();
                        myPara.Add("@collegeId", collegeId);
                        myPara.Add("@trainingprogramId", trainingprogramId);
                        myPara.Add("@documentName", filename);
                        myPara.Add("@contentType", contentType);
                        myPara.Add("@documentData", bytes);
                        myPara.Add("@dateUploaded", DateTime.Now);
                        int rtn = DocInsert.InsertUpdateDelete(mySql, myPara);
                        gvDocs.EditIndex = -1;
                        populateGvDocs();
                        lblOutput.Text = "The file has been updated successfully!";
                        lblOutput.ForeColor = System.Drawing.Color.Red;
                    }

                }
            }
        }

        protected string removeLastChar(string myString)
        {
            int intCount = myString.Length;
            if (intCount >= 1)
            {
                myString = myString.Substring(0, intCount - 1);
                return myString;
            }
            else
            {
                return "";
            }
        }

        protected void cbSelectAll_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox cbSelectAll = sender as CheckBox;
            foreach (GridViewRow row in gvDocs.Rows)
            {
                CheckBox cb;
                cb = row.FindControl("chkSelect") as CheckBox;
                if (cbSelectAll.Checked == true)
                {
                    cb.Checked = true;
                }
                else
                if (cbSelectAll.Checked == false)
                {
                    cb.Checked = false;
                }
            }
        }

        protected void clearMsg()
        {
            cblColleges.SelectedValue = null;
            ddlTrainingProgramType.SelectedIndex = 0;
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