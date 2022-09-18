<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PrivacyPolicy.aspx.cs" Inherits="seniorProject.PrivacyPolicy" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
      <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2><asp:Localize ID="locPP" meta:resourceKey="locPP" Text="Privacy Policy" runat="server"></asp:Localize> </h2>
        <ol>
             <li><a href="home.aspx"><asp:Localize ID="locHome11" meta:resourceKey="locRHome" Text="Home" runat="server"></asp:Localize></a></li>
        </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
     <br />
    <br />

     <div class="container" data-aos="fade-up">


        <div class="row">
         

          <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content" data-aos="fade-right" data-aos-delay="100">
          
              <br />
               <br />
            <p class="fst-italic">
               <asp:Localize ID="locPP1" meta:resourceKey="locPP1" Text="Dear User and Visitor of the DALILAK Portal, you must abide by the terms and conditions stated on this page.
It is strictly prohibited to make any illegal attempt to breach or circumvent the terms of protection or use 
                the portal for purposes other than those specified for it, or block any of the portal services 
                from authorized users, or any use, preservation, change, harm, or destruction of information,
                or any interference in the portal or 
                its operation, and that any evidence of such acts may expose its owner to a legal issue." runat="server"></asp:Localize> 

            </p>

     
             
           <br />

               <p class="fst-italic">
               <asp:Localize ID="locPP2" meta:resourceKey="locPP2" Text="We use short statistics to make our portal more useful to visitors and users, such as knowing which 
                   information is most important to visitors and users and which is less important, 
                   and for other purposes such as determining the technical specifications of the portal design and providing 
                   system performance and glitches, and these are not shared the information is absolutely outside the scope of the 
                   support team for this portal unless it is requested by one of the competent judicial authorities." runat="server"></asp:Localize>

            </p>

       

          </div>
        </div>

      </div>
 <br />
    <br />
</asp:Content>
