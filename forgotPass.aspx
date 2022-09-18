<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="forgotPass.aspx.cs" Inherits="seniorProject.forgotPass" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
        @media (min-width: 800px) {
            .min-container {
                max-width: 700px;
            }
        }

        .min-container {
            margin: 0 auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
        <div class="container">

            <div class="d-flex justify-content-between align-items-center">
                <h2><asp:Localize ID="locForgorPassword1" meta:resourceKey="locRForgorPassword1" Text="Forgot Password" runat="server"></asp:Localize></h2>
                <ol>
                    <li><a href="home.aspx"><asp:Localize ID="locHome" meta:resourceKey="locRHome" Text="Home" runat="server"></asp:Localize></a></li>
                    <li><asp:Localize ID="locForgorPassword2" meta:resourceKey="locRForgorPassword2" Text="Forgot Password" runat="server"></asp:Localize></li>
                </ol>
            </div>

        </div>
    </section>

    <!-- End Breadcrumbs -->

    <br />
    <!-- Tabs Titles -->
    <section id="AdminLogin" class="AdminLogin">
        <div class="container min-container py-md-2 mt-1">
            <div class="card-panel p-sm-5 position-relative">
                <div class="row">
                    <div class="col">
                        <asp:Label ID="lblOutput" runat="server"></asp:Label>
                    </div>
                </div>
                <div class="text-center">
                    <!-- Icon -->
                    <img src="assets/img/email.png" style="height: 150px; width: 150px;" alt="User Icon">
                    <h1 class="h2 mt-5"><asp:Localize ID="locForgorPassword3" meta:resourceKey="locRForgorPassword3" Text="Forgot Password" runat="server"></asp:Localize></h1>
                </div>
                <!-- Forgot Password Form -->
                <div id="loginForm" class="mt-5">
                    <p class="small mb-2 text-scarlet"></p>
                    <div class="form-group position-relative">
                        <h6><asp:Localize ID="Localize2" text="*Enter the email address associated with your account and we will send you instructions for resetting your password." runat="server" meta:resourcekey="Localize2Resource1"></asp:Localize></h6>
                        <br />
                        <asp:Label ID="lblEmail" runat="server" Text="Email:" meta:resourcekey="lblEmailResource1"></asp:Label>
                        <asp:TextBox ID="txtAdminEmail" class="form-control input-lg rounded-0" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                        <br />
                        <br />
                        <div class="text-center my-4">
                            <asp:Button ID="btnResetPassword" class="btn btn-warning text-white btn-md btn-block text-uppercase" runat="server" Text="Reset password" OnClick="btnSendEmail_Click" meta:resourcekey="btnResetPasswordResource1" />
                        </div>
                    </div>
                </div>
            </div>
          </div>
    </section>
    <br />
</asp:Content>
