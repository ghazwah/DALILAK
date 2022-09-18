<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="studentServices.aspx.cs" Inherits="seniorProject.studentServices" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
        <div class="container">

            <div class="d-flex justify-content-between align-items-center">
                <h2> <asp:Localize ID="locStudentServices" meta:resourceKey="locStudentServices" Text="Student Services" runat="server"></asp:Localize></h2>
                <ol>
                    <li><a href="home.aspx"><asp:Localize ID="locHome" meta:resourceKey="locRHome" Text="Home" runat="server"></asp:Localize></a></li>
                    <li> <asp:Localize ID="locStudentServices1" meta:resourceKey="locStudentServices1" Text="Student Services" runat="server"></asp:Localize></li>
                </ol>
            </div>

        </div>
    </section>

    <!-- End Breadcrumbs -->

    <div class="bg-light pt-5" >
        <section class="container mt-5 bg-white shadow pt-4  pb-2 justify-content-center ">
 
  <h3 class="text-center"><asp:Localize ID="Localize1" meta:resourceKey="locRAdmission" Text="Admission" runat="server"></asp:Localize></h3>

  <div class="row justify-content-center">
<div class="col-md-6  justify-content-center">

  <div class="input-group m-3 selectinput  ">
    <div class="input-group-prepend ">
      <label class="input-group-text" for="inputGroupSelect01">
          <asp:Localize ID="Localize2" meta:resourceKey="locContacntMails" Text="Contacnt Mails" runat="server"></asp:Localize></label>
    </div>
    <select class="custom-select " id="userType">
      <option selected ><asp:Localize ID="Localize3" meta:resourceKey="locChoose" Text="Choose" runat="server"></asp:Localize> </option>
      <option >
        admission@uhb.edu.sa
             </option>
      <%--<option >grad-ar@uhb.edu.sa</option>
      <option >Mokafah@uhb.edu.sa</option>--%>
      <option >uhb-ar@uhb.edu.sa</option>


    </select>
  </div>


</div>

</div>
</section>
<section class="container mt-5 bg-white shadow pt-4  pb-2">
  <h3 class="text-center"><asp:Localize ID="Localize4" meta:resourceKey="locBlackBoard" Text="Black Board" runat="server"></asp:Localize></h3>
<div class="row  p-3 justify-content-center">

<div class="card overflow-hidden m-2 bg-light" style="width: 18rem;">
  <embed src="assets/StudentServicesFiles/HowToAttachTheAssignment.pdf" type="application/pdf" class="overflow-hidden ">
  <div class="card-body"> 
    <a href="assets/StudentServicesFiles/HowToAttachTheAssignment.pdf" target="_blank" class=" text-decoration-none text-dark text-muted"> 
    <p class="card-text"><asp:Localize ID="Localize5" meta:resourceKey="locHowtoUploadAssignment" Text="How to Upload Assignment" runat="server"></asp:Localize></p>

    </a>
  </div>
</div>
<div class="card overflow-hidden m-2 bg-light" style="width: 18rem;">
  <embed src="assets/StudentServicesFiles/HowToUseTheBlackboard.pdf"  >
  <div class="card-body"> 
    <a href="assets/StudentServicesFiles/HowToUseTheBlackboard.pdf" target="_blank" class=" text-decoration-none text-dark text-muted"> 
    <p class="card-text"><asp:Localize ID="Localize6" meta:resourceKey="locHowtoUseBlackBoard" Text="How to Use Black Board" runat="server"></asp:Localize></p>

    </a>
  </div>
</div>


</div>
<hr>

</section>
<section class="container mt-5 bg-white shadow pt-4  pb-2">
  <h3 class="text-center"><asp:Localize ID="Localize7" meta:resourceKey="locStudentInformationSystem" Text="Student Information System " runat="server"></asp:Localize></h3>
<div class="row  p-3 justify-content-center">

<div class="card overflow-hidden m-2 bg-light text-center" style="width: 18rem;">
  <embed src="assets/StudentServicesFiles/InquiryAboutAbsenceAndAttendance.pdf" type="application/pdf" class="overflow-hidden ">
  <div class="card-body"> 
    <a href="assets/StudentServicesFiles/InquiryAboutAbsenceAndAttendance.pdf" target="_blank" class=" text-decoration-none text-dark text-muted"> 
    <p class="card-text"><asp:Localize ID="Localize8" meta:resourceKey="locAttendance" Text="Attendance" runat="server"></asp:Localize></p>

    </a>
  </div>
</div>
<div class="card overflow-hidden m-2" style="width: 18rem;">
  <embed src="assets/StudentServicesFiles/StepsToSubmitACustomizationRequest.pdf" type="application/pdf" class="overflow-hidden ">
  <div class="card-body"> 
    <a href="assets/StudentServicesFiles/StepsToSubmitACustomizationRequest.pdf" target="_blank" class=" text-decoration-none text-dark text-muted"> 
    <p class="card-text"><asp:Localize ID="Localize9" meta:resourceKey="locStepsToSubmitACustomizationRequest" Text="Steps To Submit A Customization Request" runat="server"></asp:Localize></p>

    </a>
  </div>
</div>

<div class="card overflow-hidden m-2" style="width: 18rem;">
  <embed src="assets/StudentServicesFiles/CourseRegistrationMethod.pdf" type="application/pdf" class="overflow-hidden ">
  <div class="card-body"> 
    <a href="assets/StudentServicesFiles/CourseRegistrationMethod.pdf" target="_blank" class=" text-decoration-none text-dark text-muted"> 
    <p class="card-text"><asp:Localize ID="Localize10" meta:resourceKey="locSubjectsRegestration" Text="Subjects Regestration" runat="server"></asp:Localize></p>

    </a>
  </div>
</div>
</div>
<hr>

</section>
<section class="container mt-5 bg-white shadow pt-4  pb-2">
  <h3 class="text-center"><asp:Localize ID="Localize11" meta:resourceKey="locUniversityEmail" Text="University Email" runat="server"></asp:Localize></h3>
<div class="row  p-3 justify-content-center">

<div class="card overflow-hidden m-2 bg-light" style="width: 18rem;">
  <embed src="assets/StudentServicesFiles/HowToActivateTheUniversityEmail.pdf" type="application/pdf" class="overflow-hidden ">
  <div class="card-body"> 
    <a href="assets/StudentServicesFiles/HowToActivateTheUniversityEmail.pdf" target="_blank" class=" text-decoration-none text-dark text-muted"> 
    <p class="card-text"><asp:Localize ID="Localize12" meta:resourceKey="locActivateUnviersityAccount1" Text="Activate Unviersity Account" runat="server"></asp:Localize></p>

    </a>
  </div>
</div>



</div>
<hr>

</section>
<br />
    <br />
    <br />
    <br />
    <br />
    <br />


    </div>
</asp:Content>
