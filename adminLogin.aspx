<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" enableEventValidation="False" CodeBehind="adminLogin.aspx.cs" Inherits="seniorProject.adminLogin" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        var app = angular.module('Myapp', []);
        app.controller('Mycontroller', function ($scope) {
            $scope.showPassword = false;
            $scope.toggleShowPassword = function () {
                $scope.showPassword = !$scope.showPassword;
            }
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
     <!-- ======= Breadcrumbs ======= -->
    <section  class="breadcrumbs" >
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2><asp:Localize ID="locAdminLogIn1" meta:resourceKey="locRAdminLogIn1" Text="Admin Login" runat="server"></asp:Localize></h2>
          <ol>
            <li><a href="home.aspx"><asp:Localize ID="locHome" meta:resourceKey="locRHome" Text="Home" runat="server"></asp:Localize></a></li>
            <li><asp:Localize ID="locAdminLogIn2" meta:resourceKey="locRAdminLogIn2" Text="Admin Login" runat="server"></asp:Localize></li>
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
                <img src="assets/img/adminLogo.png" style="height: 150px; width: 150px;" alt="User Icon">
                <h1 class="h2 mt-5"><asp:Localize ID="locAdminLogIn3" meta:resourceKey="locRAdminLogIn3" Text="Welcome, Admin!" runat="server"></asp:Localize></h1>
            </div>
            <!-- Login Form -->
            <div id="loginForm" class="mt-5">
                <p class="small mb-2 text-scarlet"></p>
                <div class="form-group position-relative">
                      <asp:Label ID="lblEmail" runat="server" Text="Email:" meta:resourcekey="lblEmailResource1"></asp:Label>
                    <asp:TextBox ID="txtAdminEmail" class="form-control input-lg rounded-0" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                    <%--<i class="fa fa-user fa-lg position-abslute"></i>--%> <!-- admin icon -->
                </div>
                <br />

                <div class="position-relative" ng-app="Myapp" ng-controller="Mycontroller">
                    <asp:Label ID="lblPassword" runat="server" Text="Password:" meta:resourcekey="lblPasswordResource1"></asp:Label>
                   <asp:TextBox ID="txtAdminPassword" class="form-control input-lg rounded-0" runat="server" placeholder="Password" TextMode="Password" ng-attr-type="{{showPassword ? 'text':'password'}}"></asp:TextBox>
                    <div id="showhidediv" ng-click="toggleShowPassword()" ng-class="{'fa fa-eye':showPassword, 'fa fa-eye-slash':!showPassword}"></div>
                   <%-- <i class="fa fa-lock fa-lg position-abslute"></i>--%> <!-- lock icon -->
                </div>
                <br />
                  <asp:LinkButton ID="lbtnForgotPass" runat="server" OnClick="lbtnForgotPass_Click" meta:resourcekey="lbtnForgotPassResource1">Forgot Password?</asp:LinkButton>
                <div class="text-center my-4">
                    <asp:Button ID="btnLogIn" class="btn btn-warning text-white btn-md btn-block text-uppercase" runat="server" Text="Log In"  OnClick="btnLogIn_Click1" meta:resourcekey="btnLogInResource1"  />
                </div>

               
            </div>
        </div>
    </div>
   </section> <br />
</asp:Content>
