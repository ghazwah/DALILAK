<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="chatUsers.aspx.cs" Inherits="seniorProject.chatUsers" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
        @media (min-width: 968px) {
            .min-container {
                max-width: 850px;
            }
        }

        .min-container {
            margin: 0 auto;
        }
    </style>

     <!-- ======= Breadcrumbs ======= -->
    <section  class="breadcrumbs" >
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2><asp:Localize ID="locChats1" meta:resourceKey="locRChats" Text="Chats" runat="server"></asp:Localize></h2>
          <ol>
            <li><a href="home.aspx"><asp:Localize ID="locHome" meta:resourceKey="locRHome" Text="Home" runat="server"></asp:Localize></a></li>
            <li><asp:Localize ID="locChats2" meta:resourceKey="locRChats2" Text="Chats" runat="server"></asp:Localize></li>
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
                <img src="assets/img/Chat.png" style="height: 170px; width: 190px;" alt="Icon" />
                <h1 class="h2 mt-5"><asp:Localize ID="locChats3" meta:resourceKey="locRChats3" Text="Welcome, to Chatting!" runat="server"></asp:Localize></h1>
            </div>
            <hr />
            <!-- Chat Form -->
            <div id="ChatForm" class="mt-5">
                <div class="text-center my-4">
                    <asp:Label runat="server" Style="font-size: 20px; color: #FF9933" Text="The best time chat with together on DALILAK!" meta:resourcekey="LabelResource1"></asp:Label>
                </div>
                <div class="text-left my-4">
                    <asp:Label ID="lblOutput" runat="server"></asp:Label>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <asp:Label runat="server" Text="Your name:" meta:resourcekey="LabelResource2"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                        <br />
                        <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate ="txtname" ID="RegularExpressionValidator1" ValidationExpression = "^[\s\S]{2,10}$"
                           runat="server" ForeColor="Red" ErrorMessage="The Minimum is 2 and Maximum is 10 characters required!" meta:resourcekey="RegValExp1"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-4">
                        <asp:Label ID="lbluname" runat="server" ForeColor="#FF9933"></asp:Label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4">
                        <asp:Button ID="brnadd" class="btn btn-sm btn-block text-white btn-warning" Style="width: 150px; height: 40px" runat="server" OnClick="brnadd_Click" Text="Add" meta:resourcekey="brnaddResource1" />
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4">
                        <asp:Label runat="server" Text="DALILAK Chat:" meta:resourcekey="LabelResource3"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <%--<asp:TextBox ID="txtmsg" runat="server" Height="250px" TextMode="MultiLine" Width="472px"></asp:TextBox>--%>
                        <iframe frameborder="no" height="315"  src="messages.aspx" width="515"></iframe>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <asp:Label runat="server" Text="Your message:" meta:resourcekey="LabelResource4"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <asp:TextBox ID="txtsend" runat="server" Height="40px" TextMode="MultiLine" Width="515px"></asp:TextBox>
                        <br />
                       <asp:RegularExpressionValidator Display ="Dynamic" ControlToValidate ="txtsend" ID="RegularExpressionValidator2" ValidationExpression ="^[\s\S]{2,30}$"
                           runat="server" ForeColor="Red" ErrorMessage="The Minimum is 2 and Maximum is 30 characters required!" meta:resourcekey="RegValExp2"></asp:RegularExpressionValidator>

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <asp:Button ID="btnsend" class="btn btn-sm btn-block text-white btn-warning" runat="server" Style="width: 150px; height: 40px" OnClick="btnsend_Click" Text="Send" Width="72px" meta:resourcekey="btnsendResource1" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
