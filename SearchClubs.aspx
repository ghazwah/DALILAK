<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" EnableEventValidation="false" ValidateRequest="false" CodeBehind="SearchClubs.aspx.cs" Inherits="seniorProject.SearchClubs" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

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
        .auto-style1 {
            position: relative;
            width: 100%;
            -ms-flex: 0 0 33.333333%;
            flex: 0 0 33.333333%;
            max-width: 33.333333%;
            min-height: 1px;
            left: -20px;
            top: -1169px;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
        <div class="container">

            <div class="d-flex justify-content-between align-items-center">
                <h2><asp:Localize ID="Localize2" meta:resourceKey="locRClubs2" Text="Clubs" runat="server"></asp:Localize></h2>
                <ol>
                    <li><a href="home.aspx"><asp:Localize ID="locHome" meta:resourceKey="locRHome" Text="Home" runat="server"></asp:Localize></a></li>
                      <li><a href="clubs.aspx"><asp:Localize ID="Localize4" meta:resourceKey="locClub" Text="Clubs" runat="server"></asp:Localize></a></li>
                    <li><asp:Localize ID="Localize1" meta:resourceKey="locRClubs1" Text="Clubs" runat="server"></asp:Localize></li>

                </ol>
            </div>

        </div>
    </section>
    <!-- End Breadcrumbs -->
    <!-- Tabs Titles -->
    <div class="container min-container py-md-5 mt-4">
        <div class="card-panel p-sm-5 position-relative">
            <div class="text-center">
                <!-- Icon -->
                <img src="assets/img/clubsBrain.png" style="height: 150px; width: 150px;" alt="Icon" />
                <h1 class="h2 mt-5"><asp:Localize ID="Localize3" meta:resourceKey="locRClubs3" Text="Clubs at UHB" runat="server"></asp:Localize></h1>
            </div>
            <hr />
            <!--Clubs Form -->
            <div id="ClubsForm" class="mt-5">
                <div class="text-left my-4">
                    <asp:Label ID="lblOutput" runat="server"></asp:Label>
                </div>

                <asp:GridView ID="gvClubs" runat="server" AutoGenerateColumns="False" DataKeyNames="clubsId"
                    class="table table-striped table-bordered" >
                    <Columns>
                        <asp:TemplateField HeaderText="Clubs Id" InsertVisible="False" SortExpression="clubsId" meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <asp:Label ID="lblClubsId" runat="server" Text='<%# Bind("clubsId") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Admin Id" SortExpression="adminId" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <asp:Label ID="lblAdminId" runat="server" Text='<%# Bind("adminId") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Clubs name" SortExpression="clubsname" meta:resourcekey="TemplateFieldResource3">
                            <ItemTemplate>
                                <asp:Label ID="lblClubsName" runat="server" Text='<%# Bind("clubsname") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Information" SortExpression="information" meta:resourcekey="TemplateFieldResource4">
                            <ItemTemplate>
                                <asp:Label ID="lblInformation" runat="server" Text='<%# Bind("information") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact" SortExpression="contact" meta:resourcekey="TemplateFieldResource5">
                            <ItemTemplate>
                                <asp:Label ID="lblContact" runat="server" Text='<%# Bind("contact") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Vision" SortExpression="vision" meta:resourcekey="TemplateFieldResource6">
                            <ItemTemplate>
                                <asp:Label ID="lblVision" runat="server" Text='<%# Bind("vision") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Edit" meta:resourcekey="TemplateFieldResource7">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" class="btn btn-outline-warning" Text="Edit"
                                    OnClick="btnEdit_Click" meta:resourcekey="btnEditResource1" />
                                   </ItemTemplate>
                        </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Delete" meta:resourcekey="TemplateFieldResource8">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" class="btn btn-outline-danger" Text="X"
                                    OnClientClick="return confirm('Are you sure? want to delete the club.');"
                                    OnClick="btnDelete_Click" meta:resourcekey="btnDeleteResource1" />
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
                <hr />
                <div class="row">
                    <br />
                    <br />
                    <div class="col-md-4">
                        <asp:Button ID="btnExportToExcel" type="submit" class="btn btn-md btn-block btn-outline-primary" runat="server" Text="Excel" OnClick="btnExportToExcel_Click" meta:resourcekey="btnExportToExcelResource1" />
                    </div>
                    <div class="col-md-4">
                        <asp:Button ID="btnExportToWord" type="submit" class="btn btn-md btn-block btn-outline-primary" runat="server" Text="Word" OnClick="btnExportToWord_Click" meta:resourcekey="btnExportToWordResource1" />
                    </div>
                    <div class="col-md-4">
                        <asp:Button ID="btnExportToPdf" type="submit" class="btn btn-md btn-block btn-outline-primary" runat="server" Text="Pdf" OnClick="btnExportToPdf_Click" meta:resourcekey="btnExportToPdfResource1"/>

                    </div>

                </div>
                <hr />
                <div class="row">
                      <div class="col-md-4">
                        <asp:Label ID="labelAdminId" runat="server" Text="Admain ID:" meta:resourcekey="labelAdminIdResource1"></asp:Label>
                        <asp:TextBox ID="txtAdminId" class="form-control input-lg rounded-0" Style="width: 200px; height: 40px" runat="server" ReadOnly="True" ></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:Label ID="labelClubsId" runat="server" Text="Clubs ID:" meta:resourcekey="labelClubsIdResource1"></asp:Label>
                        <asp:TextBox ID="txtClubsId" class="form-control input-lg rounded-0" Style="width: 200px; height: 40px" runat="server" ReadOnly="True"></asp:TextBox>
                    </div>
                    </div>
                     <div class="row">
                    <div class="col-md-4">
                        <asp:Label ID="labelClubsName" runat="server" Text="Clubs Name:" meta:resourcekey="labelClubsNameResource1"></asp:Label>
                        <asp:TextBox ID="txtClubsName" class="form-control input-lg rounded-0" Style="width: 200px; height: 40px" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <asp:Label ID="labelContact" runat="server" Text="Contact:" meta:resourcekey="labelContactResource1"></asp:Label>
                        <asp:TextBox ID="txtContact" class="form-control input-lg rounded-0" Style="width: 200px; height: 40px" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Label ID="labelInformation" runat="server" Text="Information:" meta:resourcekey="labelInformationResource1"></asp:Label>
                        <asp:TextBox ID="txtInformation" class="form-control input-lg rounded-0" Style="width: 900px; height: 100px" runat="server" TextMode="MultiLine" ></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Label ID="labelVision" runat="server" Text="Vision:" meta:resourcekey="labelVisionResource1"></asp:Label>
                        <asp:TextBox ID="txtVision" class="form-control input-lg rounded-0" Style="width: 900px; height: 100px" runat="server" TextMode="MultiLine" ></asp:TextBox>
                    </div>
                </div>

                <br />
                 <div class="row">
                    <div class="col-md-4">
                <asp:Button ID="btnInsert" runat="server" class="btn btn-md btn-block btn-success" Style="width: 150px; height: 40px" Text="Insert" OnClick="btnInsert_Click" meta:resourcekey="btnInsertResource1" />
                        </div>
                          <div class="col-md-4">
                <asp:Button ID="btnUpdate" runat="server" class="btn btn-md btn-block btn-success" Style="width: 150px; height: 40px" Text="Update"  meta:resourcekey="btnUpdateResource1" OnClick="btnUpdate_Click1" />
                        </div>
                </div>
            </div>

            <div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
