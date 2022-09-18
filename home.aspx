<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" enableEventValidation="false" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="seniorProject.home" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var vsid = "kc24361cc742c9b";
        (function () {
            var vsjs = document.createElement('script'); vsjs.type = 'text/javascript'; vsjs.async = true; vsjs.setAttribute('defer', 'defer');
            vsjs.src = 'https://www.leadchatbot.com/vsa/chat.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(vsjs, s);
        })();
    </script>
    <style type="text/css">
        .auto-style1 {
            left: 15px;
            top: -501px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
       <div class="row">

    <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center justify-content-center ">
    <div class="container" data-aos="fade-up">

      <div class="row justify-content-center" data-aos="fade-up" data-aos-delay="150">
           <div class="centerLogo">
            <img src="assets/img/logo3.png" class="img-fluid"  width="700" height="900" >
          </div> </div>

          <div class="row justify-content-center" data-aos="fade-up" data-aos-delay="150">
        <div class="col-xl-6 col-lg-8">
          <h2><asp:Localize ID="locHero" meta:resourceKey="locHero" Text="Your guide during your university career at the UHB" runat="server"></asp:Localize><span>.</span></h2>
          <h2><asp:Localize ID="locHero1" meta:resourceKey="locHero1" Text="We are a team of engineering and computer science students" runat="server"></asp:Localize></h2>
        </div>
      </div>

         <div class="row gy-4 mt-5 justify-content-center" data-aos="zoom-in" data-aos-delay="250">
      <div class="col-xl-2 col-md-4">
          <div class="icon-box">
            <i class="ri-store-line"></i>
            <h3><a href="https://sis.uhb.edu.sa/hcs9prd/signon.html" target="_blank">SIS</a></h3>
          </div>
        </div>

        <div class="col-xl-2 col-md-4">
          <div class="icon-box">
            <i class="ri-bar-chart-box-line"></i>
            <h3><a href="https://lms.uhb.edu.sa/" target="_blank">BB</a></h3>
          </div>
        </div>

       <div class="col-xl-2 col-md-4">
          <div class="icon-box">
            <i class="ri-store-line"></i>
            <h3><a href="https://www.uhb.edu.sa/Pages/Home.aspx" target="_blank">UHB</a></h3>
          </div>
        </div>

       
      </div>

    </div>
  </section><!-- End Hero -->

           <br />

  <main id="main">
     
      <br />
      
            <!-- ======= banner ======= -->
      <div class="main-carousel">
          <div class="cell">
              <img src="assets/img/banner/1.jpg" width="400" height="500" /></div>
          <div class="cell">
              <img src="assets/img/banner/2.jpeg" width="400" height="500" /></div>
          <div class="cell">
              <img src="assets/img/banner/3.jpg" width="400" height="500" /></div>
          <div class="cell">
              <img src="assets/img/banner/4.jpeg" width="400" height="500" /></div>
          <div class="cell">
              <img src="assets/img/banner/5.jpeg" width="400" height="500" /></div>
          <div class="cell">
              <img src="assets/img/banner/6.jpg" width="400" height="500" /></div>
          <div class="cell">
              <img src="assets/img/banner/7.jpg" width="400" height="500" /></div>
      </div>

      <!-- ======= end banner ======= -->
      <br />

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="row">
          <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left" data-aos-delay="100">
            <img src="assets/img/uhbbb.png" class="img-fluid" alt="">
          </div>

            <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content" data-aos="fade-right" data-aos-delay="100">
            <h3><asp:Localize ID="locAboutUs" meta:resourceKey="locAboutUs" Text="About Us." runat="server"></asp:Localize></h3>
                <br />
          <div class="col-lg-9 pt-4 pt-lg-0 order-2 order-lg-1 content" data-aos="fade-right" data-aos-delay="100">
            <h4><asp:Localize ID="locAboutUs1" meta:resourceKey="locAboutUs1" Text="DALILAK aims to be a beacon for students of Hafr Al-Batin University." runat="server"></asp:Localize></h4>
              <br />
               <br />
            <p class="fst-italic"><asp:Localize ID="locAboutUs2" meta:resourceKey="locAboutUs2" Text="In terms of saving students’ time and developing knowledge and skills by providing everything they need during their academic 
                career in terms of books and lectures, and informing them of everything new at the university in
                terms of competitions and events held by the university through the advertising board. 
                And to facilitate the use of SIS and BB, and also for training students, we provide them with the names of the places
                they need for training and ways to communicate with them, so DALILAK is the short way for university students." runat="server"></asp:Localize>
         
            </p>

        
         
          </div>
        </div>

      </div>
    </section><!-- End About Section -->

    <!-- ======= Clients Section ======= -->
    <section id="clients" class="clients">
      <div class="container" data-aos="zoom-in">

        <div class="clients-slider swiper">
          <div class="swiper-wrapper align-items-center">
           
        </div>
</div>
      </div>
    </section>
      <!-- End Clients Section -->

    <!-- ======= Features Section ======= -->
    <section id="features" class="features">
      <div class="container" data-aos="fade-up">

        <div class="row">
          <div class="image col-lg-6" style='background-image: url("assets/img/features.jpg");' data-aos="fade-right"></div>
          <div class="col-lg-6" data-aos="fade-left" data-aos-delay="100">
            <div class="icon-box mt-5 mt-lg-0" data-aos="zoom-in" data-aos-delay="150">
              <i class="bx bx-check-double"></i>
              <h4><asp:Localize ID="locAboutUs3" meta:resourceKey="locAboutUs3" Text="Save a lot of time and energy for the students at UHB" runat="server"></asp:Localize></h4>
        
            </div>
            <div class="icon-box mt-5" data-aos="zoom-in" data-aos-delay="150">
              <i class="bx bx-check-double"></i>
              <h4><asp:Localize ID="locAboutUs4" meta:resourceKey="locAboutUs4" Text="Provide important opportunities for students to explore ideas and knowledge collaborate." runat="server"></asp:Localize></h4>
     
            </div>
            <div class="icon-box mt-5" data-aos="zoom-in" data-aos-delay="150">
              <i class="bx bx-check-double"></i>
              <h4><asp:Localize ID="locAboutUs5" meta:resourceKey="locAboutUs5" Text="Save their time, develop knowledge and skills." runat="server"></asp:Localize></h4>

            </div>
            <div class="icon-box mt-5" data-aos="zoom-in" data-aos-delay="150">
              <i class="bx bx-check-double"></i>
              <h4><asp:Localize ID="locAboutUs6" meta:resourceKey="locAboutUs6" Text="Students can browse more learning resources." runat="server"></asp:Localize></h4>
        
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Features Section -->

    <!-- ======= Services Section ======= -->
    <section id="services" class="services">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2><asp:Localize ID="locServ" meta:resourceKey="locServ" Text="Services" runat="server"></asp:Localize></h2>
          <p><asp:Localize ID="locServ1" meta:resourceKey="locServ1" Text="Check our Services." runat="server"></asp:Localize></p>
        </div>

        <div class="row">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-arch"></i></div>
              <h4><a href="colleges.aspx"> <asp:Localize ID="locColleges" meta:resourceKey="locColleges" Text="Colleges" runat="server"></asp:Localize> </a></h4>
              <p> <asp:Localize ID="locColleges1" meta:resourceKey="locColleges1" Text="All colleges of the University of Hafr Al-Batin and specializations (Majors)" runat="server"></asp:Localize></p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0" data-aos="zoom-in" data-aos-delay="200">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-group"></i></div>
              <h4><a href="clubs.aspx"><asp:Localize ID="locClubs" meta:resourceKey="locClubs" Text="Clubs" runat="server"></asp:Localize></a></h4>
              <p><asp:Localize ID="locClubs1" meta:resourceKey="locClubs1" Text="All the clubs provided by the university and how to participate with them" runat="server"></asp:Localize></p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0" data-aos="zoom-in" data-aos-delay="300">
            <div class="icon-box">
              <div class="icon"><i class='bx bxs-cog'></i></div>
              <h4><a href="studentServices.aspx"><asp:Localize ID="locSS" meta:resourceKey="locSS" Text="Students Services" runat="server"></asp:Localize></a></h4>
              <p><asp:Localize ID="locSS1" meta:resourceKey="locSS1" Text="Student services are the services that the student needs during his studies at the university that allow him to know the services of the university" runat="server"></asp:Localize></p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="100">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-street-view"></i></div>
              <h4><a href="trainingProgram.aspx"><asp:Localize ID="locTP" meta:resourceKey="locTP" Text="Trainig Programs" runat="server"></asp:Localize></a></h4>
              <p><asp:Localize ID="locTP1" meta:resourceKey="locTP1" Text="Places and forms that students need in training programs" runat="server"></asp:Localize></p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="200">
            <div class="icon-box">
              <div class="icon"><i class='bx bxs-graduation'></i></div>
              <h4><a href="seniorProject.aspx"><asp:Localize ID="locSP" meta:resourceKey="locSP" Text="Senior Projects" runat="server"></asp:Localize></a></h4>
              <p><asp:Localize ID="locSP1" meta:resourceKey="locSP1" Text="All graduation projects completed by graduating students from the University of Hafr Al-Batin" runat="server"></asp:Localize></p>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4" data-aos="zoom-in" data-aos-delay="300">
            <div class="icon-box">
              <div class="icon"><i class="bx bx-chat"></i></div>
              <h4><a href="chatUsers.aspx"><asp:Localize ID="locChats" meta:resourceKey="locChats" Text="Chats" runat="server"></asp:Localize></a></h4>
              <p><asp:Localize ID="locChats1" meta:resourceKey="locChats1" Text="Chatting and exchanging information with other users" runat="server"></asp:Localize></p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Services Section -->

    <!-- ======= Cta Section ======= -->
    <section id="cta" class="cta">
      <div class="container" data-aos="zoom-in">

        <div class="text-center">
          <h3><asp:Localize ID="locContactUs1" meta:resourceKey="locContactUs1" Text="Contact Us" runat="server"></asp:Localize> </h3>
          <p> <asp:Localize ID="locContactUs2" meta:resourceKey="locContactUs2" Text="If you have any questions please tell us ." runat="server"></asp:Localize></p>
          <a class="cta-btn"  href="#contact" ><asp:Localize ID="locContactUs3" meta:resourceKey="locContactUs3" Text="Contact Us" runat="server"></asp:Localize></a>
        </div>

      </div>
    </section><!-- End Cta Section -->

    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2><asp:Localize ID="LocPortfolio" meta:resourceKey="locPortfolio" Text="Portfolio" runat="server"></asp:Localize></h2>
          <p><asp:Localize ID="locPortfolio1" meta:resourceKey="locPortfolio1" Text="Check our Portfolio" runat="server"></asp:Localize></p>
        </div>

        <div class="row" data-aos="fade-up" data-aos-delay="100">
          <div class="col-lg-12 d-flex justify-content-center">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active"><asp:Localize ID="LocAll" meta:resourceKey="locAll" Text="All" runat="server"></asp:Localize></li>
              <li data-filter=".filter-males"><asp:Localize ID="LocMales" meta:resourceKey="locMales" Text="Males" runat="server"></asp:Localize> </li>
              <li data-filter=".filter-females"><asp:Localize ID="LocFemales" meta:resourceKey="locFemales" Text="Females" runat="server"></asp:Localize></li>
             
            </ul>
          </div>
        </div>

        <div class="row portfolio-container" data-aos="fade-up" data-aos-delay="200">

          <div class="col-lg-4 col-md-6 portfolio-item filter-males">
            <div class="portfolio-wrap">
              <img src="assets/img/portfolio/1.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
            <%--    <h4>App 1</h4>
                <p>App</p>--%>
                <div class="portfolio-links">
                  <a href="assets/img/portfolio/1.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" ><i class="bx bx-plus"></i></a>
                 
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-males">
            <div class="portfolio-wrap">
              <img src="assets/img/portfolio/2.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <%--<h4>Web 3</h4>
                <p>Web</p>--%>
                <div class="portfolio-links">
                  <a href="assets/img/portfolio/2.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" ><i class="bx bx-plus"></i></a>
                
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-females">
            <div class="portfolio-wrap">
              <img src="assets/img/portfolio/3.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <%--<h4>App 2</h4>
                <p>App</p>--%>
                <div class="portfolio-links">
                  <a href="assets/img/portfolio/3.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" ><i class="bx bx-plus"></i></a>
                
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-males">
            <div class="portfolio-wrap">
              <img src="assets/img/portfolio/4.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
               <%-- <h4>Card 2</h4>
                <p>Card</p>--%>
                <div class="portfolio-links">
                  <a href="assets/img/portfolio/4.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" ><i class="bx bx-plus"></i></a>
                
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-males">
            <div class="portfolio-wrap">
              <img src="assets/img/portfolio/5.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
              <%--  <h4>Web 2</h4>
                <p>Web</p>--%>
                <div class="portfolio-links">
                  <a href="assets/img/portfolio/5.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" ><i class="bx bx-plus"></i></a>
                
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-males">
            <div class="portfolio-wrap">
              <img src="assets/img/portfolio/6.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
            <%--    <h4>App 3</h4>
                <p>App</p>--%>
                <div class="portfolio-links">
                  <a href="assets/img/portfolio/6.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" ><i class="bx bx-plus"></i></a>
                 
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-females">
            <div class="portfolio-wrap">
              <img src="assets/img/portfolio/7.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
              <%--  <h4>Card 1</h4>
                <p>Card</p>--%>
                <div class="portfolio-links">
                  <a href="assets/img/portfolio/7.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" ><i class="bx bx-plus"></i></a>
                
                </div>
              </div>
            </div>
          </div>

       <div class="col-lg-4 col-md-6 portfolio-item filter-males">
            <div class="portfolio-wrap">
              <img src="assets/img/portfolio/8.jpg" class="img-fluid" alt="">
              <div class="portfolio-info">
                <%--<h4>Card 1</h4>
                <p>Card</p>--%>
                <div class="portfolio-links">
                  <a href="assets/img/portfolio/8.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox" ><i class="bx bx-plus"></i></a>
                
                </div>
              </div>
            </div>
          </div>


        </div>

      </div>
    </section>
    
    <!-- End Portfolio Section -->

      <!-- ======= Cta Section ======= -->
    <section id="cta1" class="cta1">
      <div class="container" data-aos="zoom-in">

        <div class="text-center">
          <h3><asp:Localize ID="locDalilak1" meta:resourceKey="locDalilak1" Text="Dalilak" runat="server"></asp:Localize> </h3>
          <p> <asp:Localize ID="locDalilak2" meta:resourceKey="locDalilak2" Text="we are here for you" runat="server"></asp:Localize> </p>
         
        </div>

      </div>
    </section>
      
      <!-- End Cta Section -->

    <!-- ======= Team Section ======= -->
    <section id="team" class="team">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2><asp:Localize ID="locTeam" meta:resourceKey="locTeam" Text="Team" runat="server"></asp:Localize></h2>
          <p><asp:Localize ID="locTeam1" meta:resourceKey="locTeam1" Text="Check our Team" runat="server"></asp:Localize></p>
        </div>

        <div class="row">

          <div class="col-sm-3 col-md-2 d-flex align-items-stretch">
            <div class="member" data-aos="fade-up" data-aos-delay="100">
              <div class="member-img">
                <img src="assets/img/team/no-image.png" class="img-fluid" alt="">
                 
                <div class="social">
        
                  <a href="https://www.linkedin.com/in/ghazwah/" target="_blank"><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4><asp:Localize ID="Ghazwah" meta:resourceKey="Ghazwah" Text="Ghazwah" runat="server"></asp:Localize></h4>
                <span>CSE</span>
              </div>
            </div>
          </div>

          <div class="col-sm-3 col-md-2 d-flex align-items-stretch">
            <div class="member" data-aos="fade-up" data-aos-delay="200">
              <div class="member-img">
                <img src="assets/img/team/no-image.png" class="img-fluid" alt="">
                <div class="social">
                  <a href="https://www.linkedin.com/in/raneem-saud-513587182/" target="_blank"><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4><asp:Localize ID="Raneem" meta:resourceKey="Raneem" Text="Raneem" runat="server"></asp:Localize></h4>
                <span>CSE</span>
              </div>
            </div>
          </div>

          <div class="col-sm-3 col-md-2 d-flex align-items-stretch">
            <div class="member" data-aos="fade-up" data-aos-delay="300">
              <div class="member-img">
                <img src="assets/img/team/no-image.png" class="img-fluid" alt="">
                <div class="social">
                  <a href="https://www.linkedin.com/in/mayyasah-alsuhaymi-809656240" target="_blank"><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4><asp:Localize ID="Myassa" meta:resourceKey="Myassa" Text="Myassa" runat="server"></asp:Localize></h4>
                <span>CSE</span>
              </div>
            </div>
          </div>

          <div class="col-sm-3 col-md-2 d-flex align-items-stretch">
            <div class="member" data-aos="fade-up" data-aos-delay="400">
              <div class="member-img">
                <img src="assets/img/team/no-image.png" class="img-fluid" alt="">
                <div class="social">
                  <a href="https://www.linkedin.com/in/fay-fahad-614553240" target="_blank"><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4><asp:Localize ID="Fay" meta:resourceKey="Fay" Text="Fay" runat="server"></asp:Localize></h4>
                <span>CSE</span>
              </div>
            </div>
          </div>

            <div class="col-sm-3 col-md-2 d-flex align-items-stretch">
            <div class="member" data-aos="fade-up" data-aos-delay="400">
              <div class="member-img">
                <img src="assets/img/team/no-image.png" class="img-fluid" alt="">
                <div class="social">
                  <a href="https://www.linkedin.com/in/nouf-alasi-582353183" target="_blank"><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
              <div class="member-info">
                <h4><asp:Localize ID="Nouf" meta:resourceKey="Nouf" Text="Nouf" runat="server"></asp:Localize></h4>
                <span>CSE</span>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Team Section -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2><asp:Localize ID="locContact4" meta:resourceKey="locContact4" Text="Contact" runat="server"></asp:Localize></h2>
          <p><asp:Localize ID="locContact5" meta:resourceKey="locContact5" Text="Contact Us" runat="server"></asp:Localize></p>
        </div>

        <div>
          

            <iframe  style="border:0; width: 100%; height: 270px;"
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3514.8723128698143!2d45.94838618478599!3d28.241555008418835!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3fd72328d7539f39%3A0x1bac57ac90115d3!2z2KzYp9mF2LnYqSDYrdmB2LEg2KfZhNio2KfYt9mG!5e0!3m2!1sar!2ssa!4v1651009617112!5m2!1sar!2ssa"
                frameborder="0" allowfullscreen ></iframe>
        </div>

        <div class="row mt-5">

          <div class="col-lg-4">
            <div class="info">
              <div class="address">
                <i class="bi bi-geo-alt"></i>
                <h4><asp:Localize ID="locLocation" meta:resourceKey="locLocation" Text="Location:" runat="server"></asp:Localize></h4>
                <p><asp:Localize ID="locHB" meta:resourceKey="locHB" Text="Hafer Albatin " runat="server"></asp:Localize></p>
              </div>

              <div class="email">
                <i class="bi bi-envelope"></i>
                <h4><asp:Localize ID="locEmail" meta:resourceKey="locEmail" Text="Email:" runat="server"></asp:Localize></h4>
                <p>info@example.com</p>
              </div>

            
            </div>

          </div>

          <div class="col-lg-8 mt-5 mt-lg-0">

            <form action="forms/contact.php" method="post" role="form" class="php-email-form">
           
               
               
                <div class="form-group mt-3">
                     <asp:TextBox ID="txtSenderEmail" CssClass="form-control" runat="server" ValidationGroup="contactSendMessage" Height="38px" Width="450px" placeholder="Your Email" meta:resourcekey="txtSenderEmailResource1" TextMode="Email"></asp:TextBox>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtSenderEmail" ValidationGroup="contactSendMessage" runat="server" ErrorMessage="Fill the Feild"></asp:RequiredFieldValidator>
             
                    </div>


              <div class="form-group mt-3">
                <asp:TextBox ID="txtSubject" CssClass="form-control"  runat="server" Width="450px"  ValidationGroup="contactSendMessage" TabIndex="1" placeholder="Subject" meta:resourcekey="txtSubjectResource1" ></asp:TextBox>
             <asp:RequiredFieldValidator ID="reqSub" ForeColor="Red" ControlToValidate="txtSubject" ValidationGroup="contactSendMessage" runat="server" ErrorMessage="Fill the Feild"></asp:RequiredFieldValidator>
             
                  </div>
              <div class="form-group mt-3">
                <asp:TextBox ID="txtMessage" CssClass="form-control"  runat="server"  ValidationGroup="contactSendMessage"  TextMode="MultiLine" Rows="4" placeholder="Message" meta:resourcekey="locBtnMsg"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtMessage" ValidationGroup="contactSendMessage" runat="server" ErrorMessage="Fill the Feild"></asp:RequiredFieldValidator>
             
                  </div>

                <div class="form-group mt-3">
                 <asp:Label ID="lblFileAttachments" runat="server" Text="File Attachments:" CssClass="myFormCaption" meta:resourcekey="locFileAttachments"></asp:Label>
            <asp:FileUpload ID="FileUpload" runat="server" Width="449px" meta:resourcekey="locFileUpload" />
                <br />
        <asp:RegularExpressionValidator ID="revFileUpload" ValidationExpression="^.*\.(pdf|PDF)$"
            ControlToValidate="FileUpload" runat="server" ForeColor="Red" ErrorMessage="Please select only pdf file."
            Display="Dynamic" meta:resourcekey="locrevFileUpload" />   
            <br />
  </div>
                
               
  <asp:Button ID="btnSendMessage" class="btn btn-warning text-white btn-md btn-block text-uppercase"  ValidationGroup="contactSendMessage" runat="server" Text="Send Message" OnClick="btnSendMessage_Click" meta:resourcekey="locBtnMsgSend"  />
          

            </form>

          </div>

        </div>

      </div>
    </section><!-- End Contact Section -->

  
  </main>
    
    <!-- End #main -->

           </div>

</asp:Content>
