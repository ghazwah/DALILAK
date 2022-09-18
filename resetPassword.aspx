<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="resetPassword.aspx.cs" Inherits="seniorProject.resetPassword" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
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
          <h2><asp:Localize ID="locResetPassword1" meta:resourceKey="locRResetPassword1" Text="Reset Password" runat="server"></asp:Localize></h2>
          <ol>
            <li><a href="home.aspx"><asp:Localize ID="locHome" meta:resourceKey="locRHome" Text="Home" runat="server"></asp:Localize></a></li>
            <li><asp:Localize ID="locResetPassword2" meta:resourceKey="locRResetPassword2" Text="Reset Password" runat="server"></asp:Localize></li>
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
            <div class="text-center">
                <!-- Icon -->
                <img src="assets/img/password.png" style="height: 150px; width: 150px;" alt="User Icon">
                <h1 class="h2 mt-5"><asp:Localize ID="locResetPassword3" meta:resourceKey="locRResetPassword3" Text="Reset Password" runat="server"></asp:Localize></h1>
            </div>
            <!-- Forgot Password Form -->
            <div id="loginForm" class="mt-5">
                <p class="small mb-2 text-scarlet"></p>
                <div class="position-relative" ng-app="Myapp" ng-controller="Mycontroller">
                     <asp:Label ID="lblNewPassword" runat="server" Text="New Password:" meta:resourcekey="lblNewPasswordResource1"></asp:Label>
                     <asp:TextBox  ID="txtNewPass" class="form-control input-lg rounded-0" runat="server" placeholder="New Password" TextMode="Password"  ng-attr-type="{{showPassword ? 'text':'password'}}" ></asp:TextBox>
                            <asp:regularexpressionvalidator id="RegularExpressionValidator" display="Dynamic" errormessage="Password must have at least 8-10 characters </br> with at least one numeric character!" forecolor="Red" validationexpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" controltovalidate="txtNewPass" runat="server">
</asp:regularexpressionvalidator>
                    <br />
                     <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password:" meta:resourcekey="lblConfirmPasswordResource1"></asp:Label>
                    <asp:TextBox ID="txtConfirmPass" class="form-control input-lg rounded-0" runat="server" placeholder="Confirm Password" TextMode="Password"  ng-attr-type="{{showPassword ? 'text':'password'}}"  > </asp:TextBox>
                               <asp:regularexpressionvalidator id="RegularExpressionValidator1" display="Dynamic" errormessage="Password must have at least 8-10 characters </br> with at least one numeric character!" forecolor="Red" validationexpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" controltovalidate="txtConfirmPass" runat="server">
</asp:regularexpressionvalidator>

                    
                    <div id="showhidediv" ng-click="toggleShowPassword()" ng-class="{'fa fa-eye':showPassword, 'fa fa-eye-slash':!showPassword}"></div>
                         </div>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="txtNewPass" ControlToValidate="txtConfirmPass" forecolor="Red"  ErrorMessage="Those passwords did not match! Try again."></asp:CompareValidator>

                <div class="text-center my-4">
                    <asp:Button ID="btRecPass"  class="btn btn-info text-white btn-md btn-block text-uppercase" runat="server" Text="Send" OnClick="btRecPass_Click" meta:resourcekey="btRecPassResource1"  />
                </div>
               
            </div>
        </div>
    </div>
   </section> <br />
</asp:Content>