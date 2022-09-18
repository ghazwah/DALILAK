<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="clubs.aspx.cs" Inherits="seniorProject.clubs" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <link rel="stylesheet" type="text/css" href="style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style type="text/css">

        .wrapper {
   display: grid;
   grid-template-columns: repeat(2, 2fr);
   grid-template-rows: repeat(2, 2fr);
}
    
body {
    background: #e8e0d5;
    background-attachment: fixed;
    background-size: cover;
}

#container {
    box-shadow: 0 15px 30px 1px grey;
    background: rgba(255, 255, 255, 0.90);
    text-align: center;
    border-radius: 5px;
    overflow: hidden;
    margin: 5em auto;
    height: 350px;
    width: 650px;
   
}



.product-details {
    position: relative;
    text-align: left;
    overflow: hidden;
    padding: 30px;
    height: 100%;
    float: left;
    width: 50%;
}

#container .product-details h1 {
    font-family: "Times New Roman", Times, serif;
    display: inline-block;
    position: relative;
    font-size: 30px;
    color: #344055;
    margin: 0;
    line-height: 2;
}

    #container .product-details h1:before {
        position: absolute;
        content: '';
        right: 0%;
        top: 0%;
        transform: translate(25px, -15px);
        font-family: "Times New Roman", Times, serif;
        display: inline-block;
        background: #ffe6e6;
        border-radius: 5px;
        font-size: 14px;
        padding: 5px;
        color: white;
        margin: 0;
        animation: chan-sh 6s ease infinite;
    }


#container .product-details > p {
    font-family: "Lucida Console", "Courier New", monospace;
    text-align: center;
    font-size: 14px;
    color: #7d7d7d;
    line-height: 1.5;
}

.control {
    position: absolute;
    bottom: 5%;
    left: 22.8%;
}

.btn {
    transform: translateY(0px);
    transition: 0.3s linear;
    background:#d1c8bc;
    border-radius: 5px;
    position: relative;
    overflow: hidden;
    cursor: pointer;
    outline: none;
    border: none;
    color: #eee;
    padding: 0;
    margin: 0;
    font-size: 1.2em;
    font-family: "Lucida Console", "Courier New", monospace;
    display: inline-block;
    padding: 2px 3px;
}



    .btn:hover {
        transform: translateY(-6px);
        background: #9e9486;
    }

     

    

.product-image {
    transition: all 0.3s ease-out;
    display: inline-block;
    position: relative;
    overflow: hidden;
    height: 100%;
    float: right;
    width: 50%;
    display: inline-block;
}

#container img {
    width: 100%;
    height: 100%;
}

.info {
    background: rgba(27, 26, 26, 0.9);
    font-family: "Lucida Console", "Courier New", monospace;
    transition: all 0.3s ease-out;
    transform: translateX(-100%);
    position: absolute;
    line-height: 1.8;
    text-align: left;
    font-size: 80%;
    cursor: no-drop;
    color: #FFF;
    height: 100%;
    width: 100%;
    left: 0;
    top: 0;
    opacity: 80%; 
}

    .info h2 {
        text-align: center;
        line-height: 1.5;

    }

.product-image:hover .info {
    transform: translateX(0);
}

.info ul li {
    transition: 0.3s ease;
}

    .info ul li:hover {
        transform: translateX(5px) scale(1.1);
    }

.product-image:hover img {
    transition: all 0.3s ease-out;
}

.product-image:hover img {
    transform: scale(1.2, 1.2);
}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- ======= Breadcrumbs ======= -->
    <section  class="breadcrumbs" >
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2><asp:Localize ID="locClubs" meta:resourceKey="locClubs" Text="Clubs" runat="server"></asp:Localize></h2>
          <ol>
            <li><a href="home.aspx"><asp:Localize ID="locHome" meta:resourceKey="locHome" Text="Home" runat="server"></asp:Localize></a></li>
            <li><asp:Localize ID="Localize1" meta:resourceKey="locClubss" Text="Clubs" runat="server"></asp:Localize></li>
               <li><a href="SearchClubs.aspx"><asp:Localize ID="locMD" meta:resourceKey="locMD" Text="More Details" runat="server"></asp:Localize></a></li>
          </ol>
        </div>
         

      </div>
    </section>
    
    <!-- End Breadcrumbs -->
    <br />
  
    <div class="wrapper">
     <div id="container">


        <div class="product-details">

            <h1><asp:Localize ID="locEDHAAH" meta:resourceKey="locEDHAAH" Text="EDHAAH" runat="server"></asp:Localize></h1>

                   <p class="information">
            <asp:Localize ID="Localize2" meta:resourceKey="locEDHAAH1" Text="
                Student Club in Hafar Al -Batin University From the various specializations, we are happy with the inquiries
                Related to the university or specializations on the course of the hour." runat="server"></asp:Localize>
     
            </p>



            <div class="control">

                <button class="btn">
                    <a href="mailto:edhaah@uhb.edu.sa" target="_blank" >
            <asp:Localize ID="Localize3" meta:resourceKey="locEDHAAH2" Text="Contact us" runat="server"></asp:Localize>
                        </a>
                </button>
               
            </div>

        </div>

        <div class="product-image">

           
            <img src="assets/img/clubs/1.jpg" />

            <div class="info">
          
                 <h2>  <asp:Localize ID="Localize4" meta:resourceKey="locEDHAAH4" Text="The Vision" runat="server"></asp:Localize></h2>
                <ul>
                    <li><strong> <asp:Localize ID="Localize5" meta:resourceKey="locEDHAAH5" Text="Contribute to raising the level of university students." runat="server"></asp:Localize>
                        </strong></li>
                    <li><strong><asp:Localize ID="Localize6" meta:resourceKey="locEDHAAH6" Text="seeking a well-informed generation of his work." runat="server"></asp:Localize>
                        </strong></li>
                    <li><strong><asp:Localize ID="Localize7" meta:resourceKey="locEDHAAH7" Text="Contribute to the dissemination of a culture of motivation." runat="server"></asp:Localize>
                        </strong></li>
                    <li><strong><asp:Localize ID="Localize8" meta:resourceKey="locEDHAAH8" Text="Social media assistance" runat="server"></asp:Localize>
                         </strong></li>

                </ul>
            </div>
        </div>

    </div>


    <div id="container">

        <div class="product-details">

            <h1>CYBERNAUTS</h1>
         
              
            <p class="information">
                <asp:Localize ID="Localize9" meta:resourceKey="locCYBERNAUTS" 
               Text="The initiative of the Saudi Federation for Cybersecurity, Programming and Drones #CyberHub is launched in cooperation with the Ministry of Education With the aim of establishing student clubs specializing in #cybersecurity in Saudi universities." runat="server"></asp:Localize> 
            </p>



            <div class="control">

                <button class="btn">

                    <a href="https://cyberhub.sa" target="_blank"> <asp:Localize ID="Localize11" meta:resourceKey="locCYBERNAUTS1" 
                        Text="Contact us" runat="server"></asp:Localize> </a>
                </button>
              
            </div>

        </div>

        <div class="product-image">

          
            <img src="assets/img/clubs/2.jpg" />

            <div class="info">
                <h2><asp:Localize ID="Localize10" meta:resourceKey="locCYBERNAUTS2" 
                        Text="The Vision" runat="server"></asp:Localize> </h2>
                <ul>
                    <li><strong><asp:Localize ID="Localize12" meta:resourceKey="locCYBERNAUTS3" 
                        Text=" CyberHub is an initiative presented by the Saudi Federation for Cybersecurity,Programming and Drones" runat="server"></asp:Localize>
                       </strong></li>
                    <li><strong><asp:Localize ID="Localize13" meta:resourceKey="locCYBERNAUTS4" 
                        Text=" Aims to develop student competencies through the establishment of student clubs in the field of cybersecurity in Saudi universities" runat="server"></asp:Localize>
                       </strong></li>


                </ul>
            </div>
        </div>

    </div>


    <div id="container">

        <div class="product-details">

            <h1><asp:Localize ID="Localize14" meta:resourceKey="locTECHNOLOGY" 
                        Text="TECHNOLOGY" runat="server"></asp:Localize></h1>
           

            <p class="information">
              <asp:Localize ID="Localize15" meta:resourceKey="locTECHNOLOGY1" 
                        Text=" Qualifying female students by developing their skills to raise the technical and digital cultural level,
                spreading digital technical knowledge among them, 
                and supporting their personal abilities to achieve self-success and professional excellence." runat="server"></asp:Localize>
            </p>



            <div class="control">

                <button class="btn">

                    <a href="mailto:sclubs@uhb.edu.sa" target="_blank">
                        <asp:Localize ID="Localize16" meta:resourceKey="locTECHNOLOGY2" 
                        Text="Contact us" runat="server"></asp:Localize></a>

                </button>

            </div>

        </div>

        <div class="product-image">

   <img src="assets/img/clubs/6.jpg" />


            <div class="info">
                <h2> <asp:Localize ID="Localize17" meta:resourceKey="locTECHNOLOGY3" 
                        Text="The Vision" runat="server"></asp:Localize></h2>
                <ul>
                    <li><strong><asp:Localize ID="Localize18" meta:resourceKey="locTECHNOLOGY4" 
                        Text="Spreading knowledge and cultural awareness of digital technology 
                        (cloud computing, internet networks, mobile phones, social networks,
                        smart devices and their role in life." runat="server"></asp:Localize>
                        </strong></li>

                    <li><strong><asp:Localize ID="Localize19" meta:resourceKey="locTECHNOLOGY5" 
                        Text="Encouraging and supporting talented people in the field of digital technology 
                 by creating appropriate opportunities and conditions for the development of their talents and abilities." runat="server"></asp:Localize></strong></li>
                    

                </ul>
            </div>
        </div>

    </div>

    <div id="container">

        <div class="product-details">

            <h1><asp:Localize ID="Localize20" meta:resourceKey="locTARGET" 
                        Text="TARGET" runat="server"></asp:Localize></h1>
            

            <p class="information"><asp:Localize ID="Localize21" meta:resourceKey="locTARGET1" 
                        Text=" A club interested in IELTS, followed by activities and 
                programs affiliated to University of Hafr Al-Batin." runat="server"></asp:Localize>
                 
            </p>



            <div class="control">

                <button class="btn">
                     <a href="mailto:targetclub12@gmail.com " target="_blank"> <asp:Localize ID="Localize22" meta:resourceKey="locTARGET2" 
                        Text=" Contact us" runat="server"></asp:Localize>
                        </a>
                </button>

            </div>

        </div>

        <div class="product-image">

               <img src="assets/img/clubs/5.jpg" />
           

            <div class="info">
                <h2><asp:Localize ID="Localize23" meta:resourceKey="locTARGET3" 
                        Text="The Vision" runat="server"></asp:Localize> </h2>
                <ul>
                    <li><strong><asp:Localize ID="Localize24" meta:resourceKey="locTARGET4" 
                        Text="The student's joining the club gives him several important skills in self-building." runat="server"></asp:Localize>
                        </strong></li>
                    <li><strong><asp:Localize ID="Localize25" meta:resourceKey="locTARGET5" 
                        Text=" Contributes to increasing his knowledge and cultural output through courses,visits,research and development." runat="server"></asp:Localize>
                       </strong></li>
                    <li><strong><asp:Localize ID="Localize26" meta:resourceKey="locTARGET6" 
                        Text=" An opportunity for the student in innovation, invention and creativity." runat="server"></asp:Localize>
                       </strong></li>
                    

                </ul>
            </div>
        </div>

    </div>



</div>
    </span></span></span></span>
</asp:Content>
