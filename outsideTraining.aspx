<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="outsideTraining.aspx.cs" Inherits="seniorProject.outsideTraining" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="//cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <link href="//cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
    <%--   --%>    <%--  --%>
    <style type="text/css">
        .card-panel {
            box-shadow: rgba(0, 0, 0, 0.1) 0 5px 40px, rgba(0, 0, 0, 0.1) 0 5px 10px;
            border-bottom: 10px solid transparent;
            transition: box-shadow 0.25s;
            padding: 20px;
            margin: 0.5rem 0 1rem;
            border-radius: 2px;
            background-color: #fff;
        }

        .min-container .card-panel {
            top: 13px;
            right: 1rem;
        }

        /* Media Queries */
        @media (min-width: 1268px) {
            .min-container {
                max-width: 1150px;
            }
        }

        .min-container {
            margin: 0 auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <!-- ======= Breadcrumbs ======= -->
    <section  class="breadcrumbs" >
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2><asp:Localize ID="Localize2" meta:resourceKey="locRTrainingOutside1" Text="Outside Training" runat="server"></asp:Localize></h2>
          <ol>
            <li><a href="home.aspx"><asp:Localize ID="locHome" meta:resourceKey="locRHome" Text="Home" runat="server"></asp:Localize></a></li>
              <li><a href="trainingProgram.aspx"><asp:Localize ID="locTraining" meta:resourceKey="locRTraining" Text="Training Programs" runat="server"></asp:Localize></a></li>
            <li><asp:Localize ID="locTrainingOutside2" meta:resourceKey="locRTrainingOutside2" Text="Outside Training" runat="server"></asp:Localize></li>
              
          </ol>
        </div>

      </div>
    </section>
    
    <!-- End Breadcrumbs -->

      

    <br />
    <!-- Tabs Titles -->
    <div class="container min-container py-md-5 mt-4">
        <div class="card-panel p-sm-5 position-relative">
            <div class="text-center">
                <!-- Icon -->
                <img src="assets/img/global.png" style="height: 150px; width: 200px;" alt="Icon" />
                <h1 class="h2 mt-5"><asp:Localize ID="locTrainingOutside3" meta:resourceKey="locRTrainingOutside3" Text="Outside Training" runat="server"></asp:Localize></h1>
            </div>
            <hr />
            <!-- Inside Training Form -->
            <div id="insideTrainingForm" class="mt-5">
                <div class="text-left my-4">
                    <asp:Label ID="lblOutput" runat="server" ></asp:Label>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:CheckBox ID="cbSelectAll" runat="server" Text="Select All" AutoPostBack="True" OnCheckedChanged="cbSelectAll_CheckedChanged" meta:resourcekey="cbSelectAllResource1" />
                        <asp:Button ID="btnDeleteAll" runat="server" class="btn btn-outline-danger" Text="Delete All"
                            OnClick="btnDeleteAll_Click"
                            OnClientClick="return confirm('Are you sure? want to delete All Selected files!');" meta:resourcekey="btnDeleteAllResource1" />
                        <br />
                        <br />
                    </div>
                </div>
                <asp:GridView ID="gvDocs" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="OnRowCancelingEdit"
                    OnRowEditing="OnRowEditing" OnRowUpdating="OnRowUpdating" DataKeyNames="trainingprogramId"
                    EmptyDataText="No files were found!"
                    ShowHeaderWhenEmpty="True"
                    PageSize="3" HorizontalAlign="Center" meta:resourcekey="gvDocsResource1">
                    <Columns>
                        <asp:TemplateField HeaderText="Training Program Id " meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server" Text='<%# Bind("trainingprogramId") %>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="lblEditId" Text='<%# Eval("trainingprogramId") %>' runat="server"></asp:LinkButton>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Colleges" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <asp:Label ID="lblcolleges" runat="server" Text='<%# Bind("collegeId") %>' ></asp:Label>
                            </ItemTemplate>
                             <EditItemTemplate>
                            <asp:TextBox ID="txtEditCollege" runat="server" Text='<%# Bind("collegeId") %>' ></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvEditCollege" ErrorMessage="Required!" ControlToValidate="txtEditCollege"
                                    runat="server" ForeColor="Red" Display="Dynamic" meta:resourcekey="rfvEditCollegeResource1" />
                                &nbsp;<asp:Label ID="lblEditCollege" runat="server" meta:resourcekey="lblEditCollegeResource1" />
                        </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Admin" meta:resourcekey="TemplateFieldResource3">
                            <ItemTemplate>
                                <asp:Label ID="lblAdminname" runat="server" Text='<%# Bind("name") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Files" meta:resourcekey="TemplateFieldResource4">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownload" runat="server" OnClick="DownloadFile"
                                    CommandArgument='<%# Bind("trainingprogramId") %>' Text='<%# Eval("documentName") %>'></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="left"></ItemStyle>
                            <EditItemTemplate>
                                <asp:FileUpload ID="fuEditFile" runat="server" meta:resourcekey="fuEditFileResource1" />
                                <asp:RequiredFieldValidator ID="rfvEditFile" ErrorMessage="Required!" ControlToValidate="fuEditFile"
                                    runat="server" ForeColor="Red" Display="Dynamic" meta:resourcekey="rfvEditFileResource1" />
                                <asp:RegularExpressionValidator ID="revEditFile" ValidationExpression="^.*\.(pdf|PDF|doc|docx|xls|xlsx)$"
                                    ControlToValidate="fuEditFile" runat="server" ForeColor="Red" ErrorMessage="Please PDF or Word or Excel!"
                                    Display="Dynamic" meta:resourcekey="revEditFileResource1" />
                                &nbsp;<asp:Label ID="lblEditFile" runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date Uploaded " meta:resourcekey="TemplateFieldResource5">
                            <ItemTemplate>
                                <asp:Label ID="lblDateUploaded" runat="server" Text='<%# Bind("dateUploaded") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Edit" meta:resourcekey="TemplateFieldResource6">
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
                        <asp:TemplateField HeaderText="Delete" ItemStyle-Width="110px" meta:resourcekey="TemplateFieldResource7">
                            <ItemTemplate>
                                <asp:Button ID="btnDeleteDoc" class="btn btn-outline-danger" runat="server" Text="X"
                                    OnClientClick="return confirm('Are you sure you want to delete this file?');"
                                    OnClick="btnDeleteDoc_Click" CommandArgument='<%# Bind("trainingprogramId") %>'  />
                            </ItemTemplate>
                            <ItemStyle Width="110px"></ItemStyle>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <input type="hidden" runat="server" id="hidtrainingprogramtypeId" />
                <input type="hidden" runat="server" id="hdnRefNo" />
                <asp:HiddenField ID="hiddentrainingprogramtypeId" runat="server" />
                <hr />
                <div class="row">
                    <div class="col-md-4">
                        <asp:Label ID="labelAdminId" runat="server" Text="Admain ID:" meta:resourcekey="labelAdminIdResource1"></asp:Label>
                        <asp:TextBox ID="txtAdminId" class="form-control input-lg rounded-0" Style="width: 200px; height: 40px" runat="server" ReadOnly="True"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:Label ID="labelTrainingProgramType" runat="server" Text="Training Program Type:" meta:resourcekey="labelTrainingProgramTypeResource1"></asp:Label>
                        <asp:DropDownList ID="ddlTrainingProgramType" class="btn btn-light dropdown-toggle dropdown-toggle-split" Style="width: 200px; height: 40px;" AppendDataBoundItems="True" runat="server">
                          
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-4">
                        <asp:Label ID="labelCollages" runat="server" Text="Collages:" meta:resourcekey="labelCollagesResource1"></asp:Label>
                        <asp:CheckBoxList ID="cblColleges" runat="server">
                        </asp:CheckBoxList>
                    </div>
                </div>
                <div class="text-left my-4">
                    <asp:Label ID="labelFile" runat="server" Text="File:" meta:resourcekey="labelFileResource1"></asp:Label>
                    <br />
                    <asp:FileUpload ID="FileUpload1" runat="server"  />
                    <br />
                    <br />
                    <asp:Button ID="btnUpload" class="btn btn-md btn-block btn-success" runat="server" Style="width: 150px; height: 40px" Text="Submit" OnClick="btnUpload_Click" meta:resourcekey="btnUploadResource1" />
                    <br />
                    <br />
                    <asp:Button ID="btnClear" class="btn btn-md btn-block btn-outline-warning" Style="width: 150px; height: 40px" runat="server" Text="Clear All" OnClick="btnClear_Click" meta:resourcekey="btnClearResource1" />
                </div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
