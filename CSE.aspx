<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CSE.aspx.cs" Inherits="seniorProject.CSE" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="//cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <link href="//cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
    <%--   --%>    <%--  --%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
        <div class="container">

            <div class="d-flex justify-content-between align-items-center">
                <h2>
                    <asp:Localize ID="locSP1" Text="Computer Science and Engineering" runat="server" meta:resourcekey="locSP1Resource1"></asp:Localize>
                </h2>
                <ol>
                    <li><a href="home.aspx">
                        <asp:Localize ID="locHome4" Text="Home" runat="server" meta:resourcekey="locHome4Resource1"></asp:Localize>
                    </a></li>
                    <li><a href="colleges.aspx">
                        <asp:Localize ID="locColleges" Text="Colleges" runat="server" meta:resourcekey="locCollegesResource1"></asp:Localize></a></li>
                    <li><a href="collegeCSE.aspx">
                        <asp:Localize ID="Localize1" Text="College of CSE" runat="server" meta:resourcekey="Localize1Resource1"></asp:Localize></a></li>
                    <li>
                        <asp:Localize ID="locSP2" Text="CSE" runat="server" meta:resourcekey="locSP2Resource1"></asp:Localize>
                    </li>
                            <li><a href="StudyPlans/CSE.pdf" target="_blank">
                        <asp:Localize ID="Localize2" Text="Study Plan" runat="server" meta:resourcekey="Localize2Resource1"></asp:Localize></a></li>

                </ol>
            </div>

        </div>
    </section>

    <!-- End Breadcrumbs -->
    <br />
    <div class="container">

            <div class="text-center">
                <h1 class="h2 mt-5"><asp:Localize ID="locCSE3" meta:resourceKey="locRCSE3" Text="Computer Science and Engineering" runat="server"></asp:Localize></h1>
            </div>
            <hr />
                <div class="text-left my-4">
                    <asp:Label ID="lblOutput" runat="server" meta:resourcekey="lblOutputResource1"></asp:Label>
                </div>
                <br />
                <div class="row">
                    <div class="col">
                        <asp:GridView ID="GvLearningResources" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="OnRowCancelingEdit" OnRowDeleting="OnRowDeleting"
                            OnRowEditing="OnRowEditing" OnRowUpdating="OnRowUpdating" DataKeyNames="learningResourceId"
                            EmptyDataText="No files were found!" ShowHeaderWhenEmpty="True"
                            PageSize="3" HorizontalAlign="Center"
                            BorderWidth="3px" CellPadding="4" GridLines="Horizontal" meta:resourcekey="GvLearningResourcesResource1">
                            <Columns>

                                <asp:TemplateField HeaderText="Files" meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:Label ID="fileName" runat="server" Text='<%# Bind("learningResourceDoc") %>' meta:resourcekey="fileNameResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Download" meta:resourcekey="TemplateFieldResource2">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkDownload" runat="server" OnClick="DownloadFile"
                                            CommandArgument='<%# Bind("learningResourceId") %>' Text="Download" meta:resourcekey="lnkDownloadResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="left"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Admin" meta:resourcekey="TemplateFieldResource3">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAdminname" runat="server" Text='<%# Bind("name") %>' meta:resourcekey="lblAdminnameResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="College" meta:resourcekey="TemplateFieldResource4">
                                    <ItemTemplate>
                                        <asp:Label ID="lblCollegename" runat="server" Text='<%# Bind("collegename") %>' meta:resourcekey="lblCollegenameResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Major" meta:resourcekey="TemplateFieldResource5">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMajorname" runat="server" Text='<%# Bind("majorname") %>' meta:resourcekey="lblMajornameResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Attachment" meta:resourcekey="TemplateFieldResource6">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAttachmentname" runat="server" Text='<%# Bind("attachment") %>' meta:resourcekey="lblAttachmentnameResource1"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="ID" meta:resourcekey="TemplateFieldResource7">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lblId" Text='<%# Eval("learningResourceId") %>' runat="server" meta:resourcekey="lblIdResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="left"></ItemStyle>


                                    <EditItemTemplate>
                                        <asp:LinkButton ID="lblEditId" Text='<%# Eval("learningResourceId") %>' runat="server" meta:resourcekey="lblEditIdResource1"></asp:LinkButton>
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField ShowHeader="False"  HeaderText="Edit" meta:resourcekey="TemplateFieldResource8">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lblFile" runat="server" meta:resourcekey="lblFileResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:FileUpload ID="fuEditFile" runat="server" meta:resourcekey="fuEditFileResource1" />

                                        <asp:RegularExpressionValidator ID="revEditFile" ValidationExpression="^.*\.(pdf|PDF|doc|docx)$"
                                            ControlToValidate="fuEditFile" runat="server" ForeColor="Red" ErrorMessage="Please PDF or Word file only!."
                                            Display="Dynamic" meta:resourcekey="revEditFileResource1" />
                                        &nbsp;<asp:Label ID="lblEditFile" runat="server" meta:resourcekey="lblEditFileResource1" />
                                    </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField ShowHeader="False"  HeaderText="Action" meta:resourcekey="TemplateFieldResource9">
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

                                <asp:TemplateField ShowHeader="False" meta:resourcekey="TemplateFieldResource10">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbDelete" runat="server" CausesValidation="False"
                                            CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this file?');" meta:resourcekey="lbDeleteResource1"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                        <hr />

                        <asp:Label ID="labelFile" runat="server" Text="File:" meta:resourcekey="labelFileResource1"></asp:Label>
                        <asp:FileUpload ID="FileUpload" runat="server" meta:resourcekey="FileUploadResource1" />

                        <asp:RegularExpressionValidator ID="revFileUpload" ValidationExpression="^.*\.(pdf|PDF|doc|docx)$"
                            ControlToValidate="FileUpload" runat="server" ForeColor="Red" ErrorMessage=" Please PDF or Word file only!"
                            Display="Dynamic" meta:resourcekey="revFileUploadResource1" />


                        <br />
                        <br />
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label ID="labelAdminId" runat="server" Text="Admain ID:" meta:resourcekey="labelAdminIdResource1"></asp:Label>
                                <asp:TextBox ID="txtAdminId" class="form-control input-lg rounded-0" Style="width: 200px; height: 40px" runat="server" ReadOnly="True" meta:resourcekey="txtAdminIdResource1"></asp:TextBox>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="labelCollege" runat="server" Text="College:" meta:resourcekey="labelCollegeResource1"></asp:Label>
                                <br />
                                <asp:DropDownList ID="ddlCollege" class="btn btn-light dropdown-toggle dropdown-toggle-split" Style="width: 200px; height: 40px;" AutoPostBack="True"  onselectedindexchanged="ddlCollege_SelectedIndexChanged"  AppendDataBoundItems="True" runat="server" meta:resourcekey="ddlCollegeResource1">
                           
                                </asp:DropDownList>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-4">
                                <asp:Label ID="labelMajor" runat="server" Text="Major:" meta:resourcekey="labelMajorResource1"></asp:Label>
                                <br />
                                <asp:DropDownList ID="ddlMajor" class="btn btn-light dropdown-toggle dropdown-toggle-split" Style="width: 200px; height: 40px;"  AppendDataBoundItems="True" runat="server" meta:resourcekey="ddlMajorResource1">
                                
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="labelAttachment" runat="server" Text="Attachment:" meta:resourcekey="labelAttachmentResource1"></asp:Label>
                                <br />
                                <asp:DropDownList ID="ddlAttachment" class="btn btn-light dropdown-toggle dropdown-toggle-split" Style="width: 200px; height: 40px;" AppendDataBoundItems="True" runat="server" meta:resourcekey="ddlAttachmentResource1">
                                    
                                </asp:DropDownList>
                            </div>
                        </div>
                        <br />
                        <asp:Button ID="btnUpload" runat="server" Text="Upload" class="btn btn-outline-warning" OnClick="btnUpload_Click" meta:resourcekey="btnUploadResource1" />


                    </div>
                </div>
            </div>
        <br />
    <br />
    <br />
    <br />
</asp:Content>
