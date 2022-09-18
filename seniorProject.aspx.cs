using seniorProject.App_Code;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Drawing.Printing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;




namespace seniorProject
{
    public partial class seniorProject : System.Web.UI.Page
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
                populateGvDocs();
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
                    FileUpload.Visible = false;
                    btnUpload.Visible = false;
                    txtAdminId.Visible = false;
                    labelAdminId.Visible = false;

                    GridView1.Columns[2].Visible = false;
                    GridView1.Columns[3].Visible = false;
                    GridView1.Columns[4].Visible = false;
                    GridView1.Columns[5].Visible = false;
                    GridView1.Columns[6].Visible = false;
                }

                else if (Session["role"].Equals("admin"))
                {
                 


                }



            }

       

            catch (Exception ex)
            {
                //
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

        protected void populateGvDocs()
        {
            

            CRUD myCrud = new CRUD();
            string mySql = @"select seniorProjectId,name, ContentType, Data,seniorProjectName
            from seniorProject sp inner join  admin ad on sp.adminId = ad.adminId ";
            using (SqlDataReader dr = myCrud.getDrPassSql(mySql))
            {
                if (dr.HasRows)
                {
                    GridView1.DataSource = dr;
                    GridView1.DataBind();
                }
            }
        }

        protected void DownloadFile(object sender, EventArgs e)
        {
            int seniorProjectId = int.Parse((sender as LinkButton).CommandArgument);
            byte[] bytes;
            string fileName, contentType;
           
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "select seniorProjectName, Data, ContentType from seniorProject where seniorProjectId=@seniorProjectId";
                    cmd.Parameters.AddWithValue("@seniorProjectId", seniorProjectId);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        bytes = (byte[])sdr["Data"];
                        contentType = sdr["ContentType"].ToString();
                        fileName = sdr["seniorProjectName"].ToString();
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

            if (ValidateEmpty(txtAdminId.Text))
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
                        lblOutput.Text = "Please PDF or Word!";
                        lblOutput.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        int adminId = int.Parse(txtAdminId.Text);
                        CRUD myCrud = new CRUD();
                        string mySql = @" select name from 
		            admin adm inner join seniorProject sp on adm.adminId = sp.adminId";
                        Dictionary<string, object> myPara = new Dictionary<string, object>();
                        myPara.Add("@adminId", adminId);
                        SqlDataReader dr = myCrud.getDrPassSql(mySql, myPara);
                        InsertDocuments(adminId);
                        FileUpload.SaveAs(Server.MapPath("~/Uploads/" + FileUpload.FileName));
                        lblOutput.Text = "The file has been uploaded successfully!";
                        lblOutput.ForeColor = System.Drawing.Color.Green;
                    }
                }
                else
                {
                    lblOutput.Text = "Please select file to upload!";
                    lblOutput.ForeColor = System.Drawing.Color.Red;
                }
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
                        string mySql = @"  insert into seniorProject(seniorProjectName,ContentType,Data,adminId)
                                        values(@seniorProjectName,@ContentType,@Data,@adminId)";
                        Dictionary<string, object> myPara = new Dictionary<string, object>();
                        myPara.Add("@seniorProjectName", filename);
                        myPara.Add("@ContentType", contentType);
                        myPara.Add("@Data", bytes);
                        myPara.Add("@adminId", adminId);

                        int rtn = DocInsert.InsertUpdateDelete(mySql, myPara);
                        lblOutput.Text = "The file has been uploaded successfully!";
                        lblOutput.ForeColor = System.Drawing.Color.Blue;
                        populateGvDocs();
                    }
                }
            }
        }

     

        protected void OnRowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
           
            populateGvDocs();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
          
            populateGvDocs();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int id = Convert.ToInt32((row.FindControl("lblId") as LinkButton).Text);
                string fileName = (row.FindControl("lblFile") as LinkButton).Text;
                SqlConnection con = new SqlConnection(strcon);
                SqlCommand cmd = new SqlCommand("DELETE FROM [seniorProject] WHERE seniorProjectId = @seniorProjectId", con);
                cmd.Parameters.AddWithValue("@seniorProjectId", id);
                con.Open();
                cmd.ExecuteNonQuery();
                string file = Server.MapPath("~/Files/" + fileName);
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
           
            populateGvDocs();

        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            GridViewRow row = GridView1.Rows[e.RowIndex];
            int seniorProjectId = Convert.ToInt32((row.FindControl("lblEditId") as LinkButton).Text);
            FileUpload FileUpload1 = row.FindControl("fuEditFile") as FileUpload;
            string fileName = string.Empty;
            if (FileUpload1.HasFile)
            {
                fileName = FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath("~/Files/") + fileName);
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
                    string mySql = @"update seniorProject set  seniorProjectName=@seniorProjectName,
                                 ContentType=@ContentType, Data=@Data where seniorProjectId =@seniorProjectId";
                    Dictionary<string, object> myPara = new Dictionary<string, object>();
                    myPara.Add("@seniorProjectId", seniorProjectId);
                    myPara.Add("@seniorProjectName", filename);
                    myPara.Add("@contentType", contentType);
                    myPara.Add("@Data", bytes);
                    int rtn = DocInsert.InsertUpdateDelete(mySql, myPara);
                    GridView1.EditIndex = -1;
                    populateGvDocs();

                    lblOutput.Text = "The file has been updated successfully!";
                    lblOutput.ForeColor = System.Drawing.Color.Green;
                }

            }
        }
    }
   

        protected void clearMsg()
        {
            lblOutput.Text = "";
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




  
