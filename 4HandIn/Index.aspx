<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="_4HandIn.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="icon.png" type="image" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" media="screen"/>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"/>
    <title></title>

    <style>


            body {
  position: relative;
  margin: 0;
  padding-bottom: 6rem;
  min-height: 100%;
  font-family: "Helvetica Neue", Arial, sans-serif;
}

               .collage{
    background: linear-gradient( to right, rgba(27, 27, 27, 1),rgba(27, 27, 27, 0) ), url(http://www.hdwallpaperslife.com/wp-content/uploads/2018/02/astronaut_5k-wide.jpg) no-repeat center center fixed;
    background-size: cover;
    height: 100%;
    width: 100%;
    position: fixed;
    left: 620px;
    padding: 40px;
    z-index: -1;
    
   }

   .collage-text-container {
    font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    position: relative;
    top: 35%;
    transform: none;
    text-align: center;
    margin-right:550px;
}


        .collapse ul li {
    list-style: none;
    float: left;
    position: relative;
    margin-left: 25px;
    font-size: 14px;
    line-height: 14px;
    font-weight: 700;
    letter-spacing: .04em;  
    }

    a img{
      width:40px;
    }

   @media (min-width: 1281px) {
       .pictureimg{

           margin-left:-130px;
           margin-bottom: 2px;
           margin-top: 5px;
       }
   }


    html {
  height: 100%;
  box-sizing: border-box;
}

*,
*:before,
*:after {
  box-sizing: inherit;
}

body {
  position: relative;
  margin: 0;
  padding-bottom: 6rem;
  min-height: 100%;
  font-family: "Helvetica Neue", Arial, sans-serif;
}

.demo {
  margin: 0 auto;
  padding-top: 64px;
  max-width: 640px;
  width: 94%;
}

.demo h1 {
  margin-top: 0;
}

.footer {
  position: absolute;
  right: 0;
  bottom: 0;
  left: 0;
  padding: 1rem;
  background-color: #191919;
  text-align: center;
  color:antiquewhite;
}
@media only screen 
  and (min-device-width: 768px) 
  and (max-device-width: 1024px) 
  and (-webkit-min-device-pixel-ratio: 2) { 
    .reklamebanner{
            width: 206%;
}
}

@media only screen 
  and (min-device-width: 375px) 
  and (max-device-width: 667px) 
  and (-webkit-min-device-pixel-ratio: 2) { 
        .reklamebanner{
            width: 333%;
}

}

@media only screen 
  and (min-device-width: 375px) 
  and (max-device-width: 812px) 
  and (-webkit-min-device-pixel-ratio: 3) { 
        #form1{
            margin:0px 0px 10px 0px;
        }

}

    </style>
</head>
<body style="background: #1b1b1b;">

    <div class="navbar navbar-inverse navbar-fixed-top" style="background-color:#191919;">
        <div class="container">
            <div class="navbar-header">
                <a href="#" class="navbar-brand"></a>
                <button class="navbar-toggle" data-toggle="collapse" data-target=".navHeaderCollapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse navHeaderCollapse">
            <a class="nav navbar-nav navbar-left">
            <img class="pictureimg" src="Picture/popcornLogo.png" />
            </a>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="HomePage.aspx" style="color:#fff;">Forside</a></li>
                    <li><a href="Index.aspx" style="color:#fff;">Movies</a></li>
                    <li><a href="XMLCrud.aspx" style="color:#fff;">Admin</a></li>
                </ul>
            </div>
        </div>
    </div>

        <div class="collage">
        <br />
        <br />
                <div class="collage-text-container">
<h1 style="color:white;">All the info you need.</h1>
</div>
        <br />
        <br />
    </div>



    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" Class="btn btn-primary btn-sm" runat="server" OnClick="Button1_Click" Text="Back"  />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBoxInput" runat="server"></asp:TextBox>
&nbsp;&nbsp;
            <asp:Label ID="LabelMovieName" runat="server" Text="Search for movie name" ForeColor="White"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonFindMovie" Class="btn btn-primary btn-sm" runat="server" OnClick="ButtonFindMovie_Click" Text="Find movie" />
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp; <asp:Image ID="ImagePoster" runat="server" />
            &nbsp;
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LabelYear" Class="labels" runat="server" ForeColor="White"></asp:Label>
&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LabelActors" Class="labels" runat="server" ForeColor="White"></asp:Label>
&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp; &nbsp;
            <asp:Label ID="LabelAwards" Class="labels" runat="server" ForeColor="White"></asp:Label>
            <br />
            &nbsp;&nbsp; &nbsp;
            <asp:Label ID="LabelResults" Class="labels" runat="server" ForeColor="White"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="LabelJoke" runat="server" Font-Bold="True" Text="Do u want to hear a joke?" ForeColor="White"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonJoke" Class="btn btn-primary btn-sm" runat="server" OnClick="ButtonJoke_Click" Text="Give me the joke!" />
            <br />
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="reklamebanner">
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/MyCommercial.xml" Width="30%"/>
                 </div>

        </div>
    </form>
    <div class="footer"> <strong>4 hand in</strong> made by pawan and Birhat.</div>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>
