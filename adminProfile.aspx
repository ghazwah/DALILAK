<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminProfile.aspx.cs" Inherits="seniorProject.adminProfile" %>

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
    <section class="breadcrumbs">
        <div class="container">

            <div class="d-flex justify-content-between align-items-center">
                <h2> <asp:Localize ID="locAdminProfile1" meta:resourceKey="locRAdminProfile1" Text="Admin Profile" runat="server"></asp:Localize></h2>
                <ol>
                    <li><a href="home.aspx"><asp:Localize ID="locHome" meta:resourceKey="locRHome" Text="Home" runat="server"></asp:Localize></a></li>
                    <li> <asp:Localize ID="locAdminProfile2" meta:resourceKey="locRAdminProfile2" Text="Admin Profile" runat="server"></asp:Localize></li>
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
                <asp:Label ID="lblOutput" runat="server"></asp:Label>
                <div class="text-center">
                    <!-- Icon -->
                    <img src="assets/img/profile.png" style="height: 120px; width: 120px;" alt="User Icon">
                    <h1 class="h2 mt-2"><asp:Localize ID="locAdminProfile3" meta:resourceKey="locRAdminProfile3" Text="Admin Profile" runat="server"></asp:Localize></h1>
                </div>
                <!-- Forgot Password Form -->
                <div id="loginForm" class="mt-5">
                    <p class="small mb-2 text-scarlet"></p>
                    <div class="position-relative">
                            <asp:Label ID="lblAdminId" runat="server" Text="ID:" meta:resourceKey="lblAdminIdResource1"></asp:Label>
                            <asp:TextBox class="form-control input-lg rounded-0" ID="txtAdminId" runat="server" placeholder="Admin ID" ReadOnly="True"></asp:TextBox>
                        </div>
                     <div class="row">
                        <div class="col-md-6">
                            <asp:Label ID="lblName" runat="server" Text="Name:" meta:resourceKey="lblNameResource1"></asp:Label>
                            <asp:TextBox class="form-control input-lg rounded-0" ID="txtName" runat="server" placeholder="Name"></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegExpVal1" runat="server" ControlToValidate="txtName" ErrorMessage="The name is invalid!"
                                        ForeColor="Red" ValidationExpression="([A-Za-z])+( [A-Za-z]+)*" meta:resourcekey="RegExpVal1Res1"></asp:RegularExpressionValidator>
                                </div>
                        <div class="col-md-6">
                            <asp:Label ID="lblEmail" runat="server" Text="Email:" meta:resourceKey="lblEmailResource1"></asp:Label>
                            <div class="form-group">
                                <asp:TextBox class="form-control input-lg rounded-0" ID="txtEmail" runat="server" placeholder="Email ID" TextMode="Email"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                                 <div class="position-relative">
                                    <asp:Label ID="lblCurrentPass" runat="server" Text="Current Password:" meta:resourceKey="lblCurrentPassResource1"></asp:Label>
                                    <asp:TextBox class="form-control input-lg rounded-0" ID="txtOldPass" runat="server" placeholder="Current Password" ReadOnly="True" TextMode="Password"></asp:TextBox>
                                     </div>
                                      <div class="position-relative" ng-app="Myapp" ng-controller="Mycontroller">
                                        <asp:Label ID="lblNewPass" runat="server" Text="New Password:" meta:resourceKey="lblNewPassResource1"></asp:Label>
                                        <asp:TextBox class="form-control input-lg rounded-0" ID="txtNewPass" runat="server" placeholder="New Password" TextMode="Password" ng-attr-type="{{showPassword ? 'text':'password'}}"></asp:TextBox>
                                          <asp:regularexpressionvalidator id="RegularExpressionValidator" display="Dynamic" errormessage="Password must have at least 8-10 characters </br> with at least one numeric character!" forecolor="Red" validationexpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{8,10})$" controltovalidate="txtNewPass" runat="server"></asp:regularexpressionvalidator>

                                      <div id="showhidediv" ng-click="toggleShowPassword()" ng-class="{'fa fa-eye':showPassword, 'fa fa-eye-slash':!showPassword}"></div>
                                </div>
                            <div class="text-left my-4">
                                <asp:Button class="btn btn-outline-primary" ID="btnUpdatePassword" runat="server" Text="Update Password" OnClick="btnUpdatePassword_Click" meta:resourceKey="btnUpdatePasswordResource1" Height="40" Width="200" />
                                <asp:Label ID="lblAjax" runat="server"></asp:Label>
                            </div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnUpdatePassword" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <div class="text-center my-4">

                        <asp:Button  class="btn btn-md btn-block btn-success" ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" meta:resourceKey="btnUpdateResource1" />
                        <asp:Button class="btn btn-md btn-block btn-danger" ID="btnDelete" runat="server" Text="Delete Account" OnClick="btnDelete_Click" meta:resourceKey="btnDeleteResource1"/>
                    </div>
                    <div class="text-left my-4">
                        <asp:CheckBox ID="ChBoxDelete" runat="server" AutoPostBack="True" Text=" Delete this Account?" meta:resourceKey="ChBoxDeleteResource1" />
                    </div>
                  </div>
                </div>
            </div>
    </section>
    <br />
</asp:Content>
