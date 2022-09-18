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
    public partial class CSE : System.Web.UI.Page
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
                populateddlCollege();
                populateddlAttachment();
                getadminDetails();
                populateGvLearningResources();
            }
            else
            {
                //
            }

            try
            {

                if (Session["role"] == null)
                {
                    FileUpload.Visible = false;
                    btnUpload.Visible = false;
                    txtAdminId.Visible = false;
                    labelAdminId.Visible = false;
                    ddlCollege.Visible = false;
                    ddlMajor.Visible = false;
                    ddlAttachment.Visible = false;
                    labelAttachment.Visible = false;
                    labelCollege.Visible = false;
                    labelMajor.Visible = false;
                    labelFile.Visible = false;


                    GvLearningResources.Columns[2].Visible = false;
                    GvLearningResources.Columns[6].Visible = false;
                    GvLearningResources.Columns[7].Visible = false;
                    GvLearningResources.Columns[8].Visible = false;
                    GvLearningResources.Columns[9].Visible = false;


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

        protected void populateddlCollege()
        {
            ddlCollege.Items.Add("--Select College--");
            CRUD myCrud = new CRUD();
            string mySql = @"select collegeId, collegename from college";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlCollege.DataValueField = "collegeId";
            ddlCollege.DataTextField = "collegename";
            ddlCollege.DataSource = dr;
            ddlCollege.DataBind();
        }

        protected void ddlCollege_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlMajor.Items.Clear();
            ddlMajor.Items.Add("--Select Major--");
            CRUD myCrud = new CRUD();
            string mySql = @"select majorId, majorname from major where collegeId = " + ddlCollege.SelectedItem.Value;
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlMajor.DataValueField = "majorId";
            ddlMajor.DataTextField = "majorname";
            ddlMajor.DataSource = dr;
            ddlMajor.DataBind();
        }


        protected void populateddlAttachment()
        {
            ddlAttachment.Items.Add("--Select Attachment--");
            CRUD myCrud = new CRUD();
            string mySql = @"select attachmentId, attachment from attachment";
            SqlDataReader dr = myCrud.getDrPassSql(mySql);
            ddlAttachment.DataValueField = "attachmentId";
            ddlAttachment.DataTextField = "attachment";
            ddlAttachment.DataSource = dr;
            ddlAttachment.DataBind();
        }

        protected void populateGvLearningResources()
        {
            CRUD myCrud = new CRUD();
            string mySql = @"select learningResourceId,name, collegename, majorname, attachment, ContentType, Data,learningResourceDoc
            from learningResource lR inner join  admin ad on lR.adminId = ad.adminId
			inner join  college co on lR.collegeId=co.collegeId
			inner join  major ma on lR.majorId=ma.majorId
			inner join  attachment att on lR.attachmentId=att. attachmentId where lR.majorId=1  ";
            using (SqlDataReader dr = myCrud.getDrPassSql(mySql))
            {
                if (dr.HasRows)
                {
                    GvLearningResources.DataSource = dr;
                    GvLearningResources.DataBind();
                }
            }

        }

        protected void DownloadFile(object sender, EventArgs e)
        {
            int learningResourceId = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType;

            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select learningResourceDoc, Data, ContentType from learningResource where learningResourceId=@learningResourceId";
                    cmd.Parameters.AddWithValue("@learningResourceId", learningResourceId);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["Data"];
                        contentType = sdr["ContentType"].ToString();
                        fileName = sdr["learningResourceDoc"].ToString();
                    }
                    con.Close();
                }
            }
            Response.Clear();
            Response.Buffer = true;
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = contentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);
            Response.BinaryWrite(bytes);
            Response.Flush();
            Response.End();
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            bool HasFile = FileUpload.HasFile;

            if (ValidateEmpty(txtAdminId.Text) || (ddlCollege.SelectedValue == "--Select College--") || (ddlAttachment.SelectedValue== "--Select Attachment--") || (ddlMajor.SelectedValue == "--Select Major--"))
            {
                lblOutput.Text = "Please fill  all the fields correctly!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                if (FileUpload.HasFile)
                {
                    String fileExtention = System.IO.Path.GetExtension(FileUpload.FileName);
                    if (fileExtention.ToLower() != ".pdf" && fileExtention.ToLower() != ".docx" && fileExtention.ToLower() != ".doc")
                    {
                        lblOutput.Text = "Please PDF or Word file only!";
                        lblOutput.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        int adminId = int.Parse(txtAdminId.Text);
                        CRUD myCrud = new CRUD();
                        string mySql = @" select name from 
		            admin adm inner join learningResource lR on adm.adminId = lR.adminId";
                        Dictionary<string, object> myPara = new Dictionary<string, object>();
                        myPara.Add("@adminId", adminId);
                        SqlDataReader dr = myCrud.getDrPassSql(mySql, myPara);
                        InsertDocuments(adminId);
                        FileUpload.SaveAs(Server.MapPath("~/LearningResources/" + FileUpload.FileName));
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

        protected void InsertDocuments(int adminId)
        {
            foreach (HttpPostedFile postedFile in FileUpload.PostedFiles)
            {
                string filename = Path.GetFileName(postedFile.FileName);
                string contentType = postedFile.ContentType;
                using (Stream fs = postedFile.InputStream)
                {
                    using (BinaryReader br = new BinaryReader(fs))
                    {
                        byte[] bytes = br.ReadBytes((Int32)fs.Length);
                        CRUD DocInsert = new CRUD();
                        string mySql = @"  insert into learningResource(learningResourceDoc,collegeId, majorId, attachmentId,ContentType,Data,adminId)
                                        values(@learningResourceDoc,@collegeId,@majorId,@attachmentId,@ContentType,@Data,@adminId)";
                        Dictionary<string, object> myPara = new Dictionary<string, object>();
                        myPara.Add("@learningResourceDoc", filename);
                        myPara.Add("@collegeId", ddlCollege.SelectedValue);
                        myPara.Add("@majorId", ddlMajor.SelectedValue);
                        myPara.Add("@attachmentId", ddlAttachment.SelectedValue);
                        myPara.Add("@ContentType", contentType);
                        myPara.Add("@Data", bytes);
                        myPara.Add("@adminId", adminId);

                        int rtn = DocInsert.InsertUpdateDelete(mySql, myPara);
                        lblOutput.Text = "The file has been uploaded successfully!";
                        lblOutput.ForeColor = System.Drawing.Color.Blue;
                        populateGvLearningResources();
                    }
                }
            }
        }

        protected void OnRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GvLearningResources.EditIndex = -1;
            //BindFiles();
            populateGvLearningResources();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GvLearningResources.EditIndex = e.NewEditIndex;
            //BindFiles();
            populateGvLearningResources();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                GridViewRow row = GvLearningResources.Rows[e.RowIndex];
                int id = Convert.ToInt32((row.FindControl("lblId") as LinkButton).Text);
                string fileName = (row.FindControl("lblFile") as LinkButton).Text;
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("DELETE FROM [learningResource] WHERE learningResourceId = @learningResourceId", con);
                cmd.Parameters.AddWithValue("@learningResourceId", id);
                con.Open();
                cmd.ExecuteNonQuery();
                string file = Server.MapPath("~/LearningResources/" + fileName);
                if (fileName != null || fileName != string.Empty)
                {
                    if (File.Exists(file))
                    {
                        File.Delete(file);
                    }
                }

                lblOutput.Text = "The file has been deleted successfully!";
                lblOutput.ForeColor = System.Drawing.Color.Green;
            }

            catch (Exception ex)
            {

                lblOutput.Text = "Failed to delete!";
                lblOutput.ForeColor = System.Drawing.Color.Red;
            }
            //BindFiles();
            populateGvLearningResources();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            GridViewRow row = GvLearningResources.Rows[e.RowIndex];
            int learningResourceId = Convert.ToInt32((row.FindControl("lblEditId") as LinkButton).Text);
            FileUpload FileUpload1 = row.FindControl("fuEditFile") as FileUpload;
            string fileName = string.Empty;
            if (FileUpload1.HasFile)
            {
                fileName = FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath("~/LearningResources/") + fileName);
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
                        string mySql = @"update learningResource set  learningResourceDoc=@learningResourceDoc,
                                 ContentType=@ContentType, Data=@Data where learningResourceId =@learningResourceId";
                        Dictionary<string, object> myPara = new Dictionary<string, object>();
                        myPara.Add("@learningResourceId", learningResourceId);
                        myPara.Add("@learningResourceDoc", filename);
                        myPara.Add("@contentType", contentType);
                        myPara.Add("@Data", bytes);
                        int rtn = DocInsert.InsertUpdateDelete(mySql, myPara);
                        GvLearningResources.EditIndex = -1;
                        populateGvLearningResources();

                        lblOutput.Text = "The file has been updated successfully!";
                        lblOutput.ForeColor = System.Drawing.Color.Green;
                    }

                }
            }
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

        protected void clearMsg()
        {
            ddlCollege.SelectedIndex = 0;
            ddlMajor.SelectedIndex = 0;
            ddlAttachment.SelectedIndex = 0;
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