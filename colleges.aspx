<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="colleges.aspx.cs" Inherits="seniorProject.colleges" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       <!-- ======= Breadcrumbs ======= -->
    <section  class="breadcrumbs" >
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>Colleges </h2>
          <ol>
            <li><a href="home.aspx"><asp:Localize ID="lochHome" meta:resourceKey="locRHome" Text="Home" runat="server"></asp:Localize></a></li>
            <li><asp:Localize ID="Localize1" meta:resourceKey="locRCollege" Text="Colleges" runat="server"></asp:Localize></li>
          </ol>
        </div>
      </div>
    </section>
    
    <!-- End Breadcrumbs -->

 
 <section id="services" class="services">

     <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2><asp:Localize ID="Localize2" meta:resourceKey="locRCollege2" Text="Colleges" runat="server"></asp:Localize></h2>
          <p><asp:Localize ID="Localize3" meta:resourceKey="locRCollege3" Text="Check our Colleges" runat="server"></asp:Localize></p>
        </div>

        <div class="row">
          <div class="col-lg-4 col-md-6 " data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-ruler"></i></div>
              <h4><a href="collegeENG.aspx"><asp:Localize ID="Localize4" meta:resourceKey="locRCollege4" Text="College of Engineering" runat="server"></asp:Localize></a></h4>
              <p><asp:Localize ID="Localize5" meta:resourceKey="locRCollege5" Text="Electrical Engineering (EE), Mechanical Engineering (ME), Civil Engineering (CE), Chemical Engineering (CHE), and Interior Design Engineering (IDE)" 
                  runat="server"></asp:Localize>
              </p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 " data-aos="zoom-in" data-aos-delay="200">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-code-block"></i></div>
              <h4><a href="collegeCSE.aspx"><asp:Localize ID="Localize6" meta:resourceKey="locRCollege6" Text="College of Computer Science and Engineering" runat="server"></asp:Localize></a></h4>
              <p><asp:Localize ID="Localize7" meta:resourceKey="locRCollege7" Text=" Computer Science and Engineering (CSE) , Software Engineering (SWE) , Data Science (DSC) , Cyber Security (CYB)" runat="server"></asp:Localize>

              </p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="zoom-in" data-aos-delay="300">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-atom"></i></div>
              <h4><a href="CollegeScience.aspx"><asp:Localize ID="Localize8" meta:resourceKey="locRCollege8" Text="College of Science" runat="server"></asp:Localize></a></h4>
              <p><asp:Localize ID="Localize12" meta:resourceKey="locRCollege12" Text="Biology, Physics, Chemistry, Mathematics, Sports Science and Physical Activity" runat="server"></asp:Localize>

              </p>
            </div>
          </div>

            
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-test-tube"></i></div>
              <h4><a href="CollegeMedicalSciences.aspx"><asp:Localize ID="Localize9" meta:resourceKey="locRCollege9" Text="College of Applied Medical Sciences" runat="server"></asp:Localize></a></h4>
              <p><asp:Localize ID="Localize13" meta:resourceKey="locRCollege13" Text="Nursing Program,  Clinical Laboratory Science Program, Clinical Nutrition Program, Health Information Management and Technology Program" runat="server"></asp:Localize></p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="200">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-capsule"></i></div>
              <h4><a href="CollegePharmacy.aspx"><asp:Localize ID="Localize10" meta:resourceKey="locRCollege10" Text="College of Pharmacy" runat="server"></asp:Localize></a></h4>
              <p><asp:Localize ID="Localize14" meta:resourceKey="locRCollege14" Text="Pharmaceutics, Pharmaceutical Chemistry, Pharmacy Practice" runat="server"></asp:Localize></p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="300">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-briefcase"></i></div>
              <h4><a href="CollegeBusinessAdministration.aspx"><asp:Localize ID="Localize11" meta:resourceKey="locRCollege11" Text="College of Business Administration" runat="server"></asp:Localize></a></h4>
              <p><asp:Localize ID="Localize15" meta:resourceKey="locRCollege15" Text="Business Administration (Business Administration Major, Financial Management Major and Marketing Major), Management Information Systems, Accounting and Law " runat="server"></asp:Localize></p>
            </div>
          </div>
                </div>

        </div>

</section>

</asp:Content>
