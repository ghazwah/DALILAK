<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"  enableEventValidation="false" CodeBehind="seniorProject.aspx.cs" Inherits="seniorProject.seniorProject" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>




<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <script src="//cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <link href="//cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <!-- ======= Breadcrumbs ======= -->
    <section  class="breadcrumbs" >
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2><asp:Localize ID="locSP1" meta:resourceKey="locSP1" Text="Senior Projects" runat="server"></asp:Localize> </h2>
          <ol>
            <li><a href="home.aspx"><asp:Localize ID="locHome4" meta:resourceKey="locHome4" Text="Home" runat="server"></asp:Localize> </a></li>
            <li><asp:Localize ID="locSP2" meta:resourceKey="locSP2" Text="Senior Projects" runat="server"></asp:Localize> </li>
          </ol>
        </div>

      </div>
    </section>
    
    <!-- End Breadcrumbs -->

      

    <br />
     

    <div class="container">
       
             

          
         <div class="row">
         <asp:Label ID="lblOutput" runat="server" meta:resourcekey="lblOutputResource1"></asp:Label>
             </div>

                <asp:FileUpload ID="FileUpload" runat="server" meta:resourcekey="FileUploadResource1" />

                

                <asp:RegularExpressionValidator ID="revFileUpload" ValidationExpression="^.*\.(pdf|PDF)$"
                    ControlToValidate="FileUpload" runat="server" ForeColor="Red" ErrorMessage="Please select only pdf file."
                    Display="Dynamic" meta:resourcekey="revFileUploadResource1" />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" class="btn btn-outline-warning" OnClick="btnUpload_Click" meta:resourcekey="btnUploadResource1" />
 
       
    
        
        <br />

         <div class="row">
                    <div class="col-md-4">
                        <asp:Label ID="labelAdminId" runat="server" Text="Admain ID:" meta:resourcekey="labelAdminIdResource1"></asp:Label>
                        <asp:TextBox ID="txtAdminId" class="form-control input-lg rounded-0" Style="width: 200px; height: 40px" runat="server" ReadOnly="True" meta:resourcekey="txtAdminIdResource1"></asp:TextBox>
                        </div></div>
          <hr />
        <br />
        <br />
        <br />
        <div class="row">
            <div class="col">


               

                <asp:GridView ID="GridView1"  class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="OnRowCancelingEdit" OnRowDeleting="OnRowDeleting"
                    OnRowEditing="OnRowEditing" OnRowUpdating="OnRowUpdating" DataKeyNames="seniorProjectId"
                    EmptyDataText="No files were found!" ShowHeaderWhenEmpty="True"
                    PageSize="3" HorizontalAlign="Center" BackColor="White" BorderColor="#FFC451" BorderStyle="Double" 
                    CssClass="table" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" meta:resourcekey="GridView1Resource1" 
                    >
                    <Columns>




                        <asp:TemplateField HeaderText="Senior Project Name" meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <asp:Label ID="seniorProjectName" runat="server" Text='<%# Bind("seniorProjectName") %>' meta:resourcekey="seniorProjectNameResource1"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Download" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownload" runat="server" OnClick="DownloadFile"
                                    CommandArgument='<%# Bind("seniorProjectId") %>' Text="Download" meta:resourcekey="lnkDownloadResource1"></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="left"></ItemStyle>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Admin" meta:resourcekey="TemplateFieldResource3">
                            <ItemTemplate>
                                <asp:Label ID="lblAdminname" runat="server" Text='<%# Bind("name") %>' meta:resourcekey="lblAdminnameResource1"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                     


                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="ID" meta:resourcekey="TemplateFieldResource4">
                            <ItemTemplate>
                                <asp:LinkButton ID="lblId" Text='<%# Eval("seniorProjectId") %>' runat="server" meta:resourcekey="lblIdResource1"></asp:LinkButton>
                            </ItemTemplate>
                             <ItemStyle HorizontalAlign="left"></ItemStyle>
                             

                            <EditItemTemplate>
                                <asp:LinkButton ID="lblEditId" Text='<%# Eval("seniorProjectId") %>' runat="server" meta:resourcekey="lblEditIdResource1"></asp:LinkButton>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField ShowHeader="False" meta:resourcekey="TemplateFieldResource5">
                            <ItemTemplate>
                                <asp:LinkButton ID="lblFile" runat="server" meta:resourcekey="lblFileResource1"></asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:FileUpload ID="fuEditFile" runat="server" meta:resourcekey="fuEditFileResource1" />
                               
                                <asp:RegularExpressionValidator ID="revEditFile" ValidationExpression="^.*\.(pdf|PDF)$"
                                    ControlToValidate="fuEditFile" runat="server" ForeColor="Red" ErrorMessage="Please select only pdf file."
                                    Display="Dynamic" meta:resourcekey="revEditFileResource1" />
                                &nbsp;<asp:Label ID="lblEditFile" runat="server" meta:resourcekey="lblEditFileResource1" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField ShowHeader="False" meta:resourcekey="TemplateFieldResource6">
                            <EditItemTemplate>
                                <asp:LinkButton ID="lbUpdate" runat="server"
                                    CommandName="Update" Text="Update" meta:resourcekey="lbUpdateResource1"></asp:LinkButton>
                                <asp:LinkButton ID="lbCancel" runat="server" CausesValidation="False"
                                    CommandName="Cancel" Text="Cancel" meta:resourcekey="lbCancelResource1"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="lbEdit" runat="server" CausesValidation="False"
                                    CommandName="Edit" Text="Edit" meta:resourcekey="lbEditResource1"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField ShowHeader="False" meta:resourcekey="TemplateFieldResource7">
                              <ItemTemplate>
                                <asp:LinkButton ID="lbDelete" runat="server" CausesValidation="False"
                                    CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this file?');" meta:resourcekey="lbDeleteResource1"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
           
                    
                    </div>
        </div>
    </div>





    <br />
    <br />
    <br />

    <br />
    <br />
    <br />
</asp:Content>
