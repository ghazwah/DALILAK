<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="trainingProgram.aspx.cs" Inherits="seniorProject.trainingProgram" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

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
          <h2><asp:Localize ID="locTraining1" meta:resourceKey="locRTraining1" Text="Training Programs" runat="server"></asp:Localize></h2>
          <ol>
            <li><a href="home.aspx"><asp:Localize ID="locHome" meta:resourceKey="locRHome" Text="Home" runat="server"></asp:Localize></a></li>
            <li><asp:Localize ID="locTraining2" meta:resourceKey="locRTraining2" Text="Training Programs" runat="server"></asp:Localize></li>
              <li><a href="#comments"><asp:Localize ID="LocalizeComments" meta:resourceKey="locRComments1" Text="Comments" runat="server"></asp:Localize></a></li>
          </ol>
        </div>

      </div>
    </section>
    
    <!-- End Breadcrumbs -->

      

    <br />

    <section id="services" class="services">
        <div class="container" data-aos="fade-up">
            <div class="section-title">
                <h2><asp:Localize ID="locTraining3" meta:resourceKey="locRTraining3" Text="Training Programs" runat="server"></asp:Localize></h2>
                <p><asp:Localize ID="locTraining4" meta:resourceKey="locRTraining4" Text="Check our Training Programs" runat="server"></asp:Localize></p>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
                    <div class="icon-box">
                        <div class="icon"><i class="bx bx-map-pin"></i></div>
                        <h4><a href="insideTraining.aspx"><asp:Localize ID="Localize1" meta:resourceKey="locRTraining5" Text="Inside Training" runat="server"></asp:Localize> </a></h4>
                        <p><asp:Localize ID="Localize2" meta:resourceKey="locRTraining6" Text="Inside Training is training that takes place inside the city of Hafr Al Batin." runat="server"></asp:Localize></p>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in" data-aos-delay="200">
                    <div class="icon-box">
                        <div class="icon"><i class="bx bx-globe"></i></div>
                        <h4><a href="outsideTraining.aspx"><asp:Localize ID="Localize3" meta:resourceKey="locRTraining7" Text="Outside Training" runat="server"></asp:Localize></a></h4>
                        <p><asp:Localize ID="Localize4" meta:resourceKey="locRTraining8" Text="Outside Training is training that takes place outside the city of Hafr Al Batin." runat="server"></asp:Localize></p>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="zoom-in" data-aos-delay="300" style="left: 0px; top: 0px">
                    <div class="icon-box">
                        <div class="icon"><i class="bx bx-network-chart"></i></div>
                        <h4><a href="onlineTraining.aspx"><asp:Localize ID="Localize5" meta:resourceKey="locRTraining9" Text="Online Training" runat="server"></asp:Localize></a></h4>
                        <p><asp:Localize ID="Localize6" meta:resourceKey="locRTraining10" Text="Online learning is training that takes place over the internet." runat="server"></asp:Localize></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Services Section -->


    <!-- Tabs Titles -->
    <section id="comments" class="comments">
    <div class="container min-container py-md-5 mt-4">
        <div class="card-panel p-sm-5 position-relative">
            <div class="text-center">
                <!-- Icon -->
                <img src="assets/img/Comment.png" style="height: 200px; width: 200px;" alt="Icon" />
                <h1 class="h2 mt-5"><asp:Localize ID="Localize7" meta:resourceKey="locRComments2" Text="Comments for the training program" runat="server"></asp:Localize></h1>
            </div>
            <hr />
            <!--Training Program Comments Form -->
            <div id="TrainingCommentsForm" class="mt-5">
                <div class="text-left my-4">
                    <asp:Label ID="lblOutput" runat="server" ></asp:Label>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <asp:Label ID="labelName" runat="server" Text="Your name:" meta:resourcekey="labelNameResource1"></asp:Label>
                        <asp:TextBox ID="txtName" class="form-control input-lg rounded-0" Style="width: 200px; height: 40px" runat="server"  ></asp:TextBox>
                         <asp:RegularExpressionValidator Display ="Dynamic" ControlToValidate ="txtName" ID="RegularExpressionValidator1" ValidationExpression ="^[\s\S]{2,10}$"
                           runat="server" ForeColor="Red" ErrorMessage="The Minimum is 2 and Maximum is 10 characters required!" meta:resourcekey="RegValExp1"></asp:RegularExpressionValidator>
 <br />

                    </div>
                    <div class="col-md-4">
                        <asp:Label ID="labelEmail" runat="server" Text="Your Email:" meta:resourcekey="labelEmailResource1"></asp:Label>
                        <asp:TextBox ID="txtEmail" class="form-control input-lg rounded-0" Style="width: 200px; height: 40px" runat="server" TextMode="Email"  ></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <asp:Label ID="labelComment" runat="server" Text="Your Comment:" meta:resourcekey="labelCommentResource1"></asp:Label>
                        <asp:TextBox ID="txtComment" class="form-control input-lg rounded-0" Style="width: 384px; height: 40px" runat="server" Rows="5" TextMode="MultiLine"  ></asp:TextBox>
                         <asp:RegularExpressionValidator Display ="Dynamic" ControlToValidate ="txtComment" ID="RegularExpressionValidator2" ValidationExpression ="^[\s\S]{2,100}$"
                           runat="server" ForeColor="Red" ErrorMessage="The Minimum is 2 and Maximum is 100 characters required!" meta:resourcekey="RegValExp2"></asp:RegularExpressionValidator>

                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4">
                        <asp:Button ID="btnAdd" class="btn btn-md btn-block btn-success" runat="server" Style="width: 150px; height: 40px" Text="Add" OnClick="btnAdd_Click" meta:resourcekey="btnAddResource1" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4">
                        <asp:Button ID="btnClear" class="btn btn-md btn-block btn-outline-warning" Style="width: 150px; height: 40px" runat="server" Text="Clear All" OnClick="btnClear_Click" meta:resourcekey="btnClearResource1" />
                    </div>
                </div>
                <br />
                 <div class="row">
                    <div class="col-md-4">
                         <asp:Button runat="server" ID="btnExportToExcel" class="btn btn-md btn-block btn-outline-primary"  Text="Export To Excel" OnClick="btnExportToExcel_Click" meta:resourcekey="btnExportToExcelResource1"/>

                    </div>
                </div>
                <hr />
                <asp:GridView ID="gvComments" class="table table-striped table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
                    ShowHeaderWhenEmpty="True"
                    PageSize="3" HorizontalAlign="Center" meta:resourcekey="gvCommentsResource1" >
                    <Columns>
                        <asp:TemplateField HeaderText="Id:" meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <asp:Label ID="lblId" runat="server" Text='<%# Bind("Id") %>'  ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name:" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <asp:Label ID="lblUserName" runat="server" Text='<%# Bind("Name") %>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Email:" meta:resourcekey="TemplateFieldResource3">
                            <ItemTemplate>
                                <asp:Label ID="lblUserEmail" runat="server" Text='<%# Bind("Email") %>'  ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Comments:" meta:resourcekey="TemplateFieldResource4">
                            <ItemTemplate>
                                <asp:Label ID="lblComments" runat="server" Text='<%# Bind("Comment") %>'  ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete" ItemStyle-Width="110px" meta:resourcekey="TemplateFieldResource5">
                            <ItemTemplate>
                                <asp:Button ID="btnDeleteCom" class="btn btn-outline-danger" runat="server" Text="X"
                                    OnClientClick="return confirm('Are you sure you want to delete this comment?');"
                                    OnClick="btnDeleteCom_Click" CommandArgument='<%# Bind("Id") %>'  />
                            </ItemTemplate>
                            <ItemStyle Width="110px"></ItemStyle>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
          </section>
    <br />
</asp:Content>