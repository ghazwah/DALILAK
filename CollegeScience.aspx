<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CollegeScience.aspx.cs" Inherits="seniorProject.CollegeScience" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <!-- ======= Breadcrumbs ======= -->
    <section  class="breadcrumbs" >
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2><asp:Localize ID="locSP1" meta:resourceKey="locSP1" Text="College of Science" runat="server"></asp:Localize> </h2>
          <ol>
            <li><a href="home.aspx"><asp:Localize ID="locHome4" meta:resourceKey="locHome4" Text="Home" runat="server"></asp:Localize> </a></li>
            <li><a href="colleges.aspx"><asp:Localize ID="locColleges" meta:resourceKey="locRColleges" Text="Colleges" runat="server"></asp:Localize></a></li>
            <li><asp:Localize ID="locSP2" meta:resourceKey="locSP2" Text="College of Science" runat="server"></asp:Localize> </li>
          </ol>
        </div>

      </div>
    </section>
    
    <!-- End Breadcrumbs -->

     <section id="services" class="services">

     <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2><asp:Localize ID="Localize1" meta:resourceKey="locRColleges1" Text="College" runat="server"></asp:Localize> </></h2>
          <p><asp:Localize ID="Localize2" meta:resourceKey="locRColleges2" Text="College of Science" runat="server"></asp:Localize> </></p>
        </div>

         <div class="row">
          <div class="col-lg-4 col-md-6 " data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-dna"></i></div>
              <h4><a href=""><asp:Localize ID="Localize3" meta:resourceKey="locRColleges3" Text="Biology" runat="server"></asp:Localize></a></h4>
              <p><asp:Localize ID="Localize4" meta:resourceKey="locRColleges4" Text="Study plan ,Books & Lectures, Manual Labs and Notes" runat="server"></asp:Localize></p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 " data-aos="zoom-in" data-aos-delay="200">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-magnet"></i></div>
              <h4><a href=""><asp:Localize ID="Localize5" meta:resourceKey="locRColleges5" Text="Physics" runat="server"></asp:Localize></a></h4>
              <p><asp:Localize ID="Localize6" meta:resourceKey="locRColleges6" Text="Study plan ,Books & Lectures, Manual Labs and Notes" runat="server"></asp:Localize></p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="zoom-in" data-aos-delay="300">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-bong"></i></div>
              <h4><a href=""><asp:Localize ID="Localize7" meta:resourceKey="locRColleges7" Text="Chemistry" runat="server"></asp:Localize></a></h4>
              <p><asp:Localize ID="Localize8" meta:resourceKey="locRColleges8" Text="Study plan ,Books & Lectures, Manual Labs and Notes" runat="server"></asp:Localize></p>
            </div>
          </div>

            
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-cube"></i></div>
              <h4><a href=""><asp:Localize ID="Localize9" meta:resourceKey="locRColleges9" Text="Mathematics" runat="server"></asp:Localize>​</a></h4>
              <p><asp:Localize ID="Localize10" meta:resourceKey="locRColleges10" Text="Study plan ,Books & Lectures, Manual Labs and Notes" runat="server"></asp:Localize></p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="200">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-cycling"></i></div>
              <h4><a href=""><asp:Localize ID="Localize11" meta:resourceKey="locRColleges11" Text="Sports Science and Physical Activity" runat="server"></asp:Localize></a></h4>
              <p><asp:Localize ID="Localize12" meta:resourceKey="locRColleges12" Text="Study plan ,Books & Lectures, Manual Labs and Notes" runat="server"></asp:Localize></p>
            </div>
          </div>

          </div>
                </div>

         </section>
</asp:Content>
