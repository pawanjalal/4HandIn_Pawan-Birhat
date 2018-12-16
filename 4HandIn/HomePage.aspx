<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="_4HandIn.HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="icon" href="icon.png" type="image" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" media="screen"/>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"/>

    <style>

        .movie img{

          margin:0 20px 20px 0;

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

   .collage{
    background: linear-gradient( to right, rgba(27, 27, 27, 1),rgba(27, 27, 27, 0) ), url(https://www.hdwallpapers.in/walls/marvel_doctor_strange-wide.jpg) no-repeat center center fixed;
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
   
   /*This is footer*/


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
    .reklame{
            width: 206%;
}
}

@media only screen 
  and (min-device-width: 375px) 
  and (max-device-width: 667px) 
  and (-webkit-min-device-pixel-ratio: 2) { 
        .reklame{
            width: 333%;
}

        .movie{

            margin: 25px;

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
<h1 style="color:white;">Movie Info made easy.</h1>
</div>
        <br />
        <br />
    </div>





    <form id="form1" runat="server">
            <br />
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
            <asp:Label ID="LabelActionCategory" runat="server" Font-Bold="True" Text="Action" ForeColor="#CCFFCC"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LabelAnimationCategory" runat="server" Font-Bold="True" Text="Animation" ForeColor="#CCFFCC"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;

           
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="MovieName" DataValueField="MovieName" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="120px"  font-size="14px">
            </asp:DropDownList> 
              
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="MovieName" DataValueField="MovieName" Width="120px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
            </asp:DropDownList>
&nbsp;<br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
            <asp:Label ID="LabelThrillerCategory" runat="server" Font-Bold="True" Text="Thriller" ForeColor="#CCFFCC"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LabelScieneFictionCategory" runat="server" Font-Bold="True" Text="Scienefiction" ForeColor="#CCFFCC"></asp:Label>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="MovieName" DataValueField="MovieName" Width="120px" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList4" CssClass="hej" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="MovieName" DataValueField="MovieName" Width="120px" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;
            &nbsp;<br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
            <asp:Label ID="LabelSearch" runat="server" Font-Bold="True" Text="Search movie" ForeColor="White"></asp:Label>
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
            <asp:TextBox ID="TextBoxInput" runat="server" Height="30px" Width="120px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="ButtonFindMovie" runat="server" class="btn btn-success" Text="Find Movie" PostBackUrl="~/Index.aspx" Width="100px"  Height="30px" />
            &nbsp;<br />
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MovieNamesConnectionString %>" SelectCommand="SELECT [MovieName] FROM [MovieTable] WHERE ([Genre] = @Genre)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Sciene fiction" Name="Genre" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MovieNamesConnectionString %>" SelectCommand="SELECT [MovieName] FROM [MovieTable] WHERE ([Genre] = @Genre)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Thriller" Name="Genre" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MovieNamesConnectionString %>" SelectCommand="SELECT [MovieName] FROM [MovieTable] WHERE ([Genre] = @Genre)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Animation" Name="Genre" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MovieNamesConnectionString %>" SelectCommand="SELECT [MovieName] FROM [MovieTable] WHERE ([Genre] = @Genre)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Action" Name="Genre" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            &nbsp;&nbsp;
            <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LabelMable" runat="server" Font-Bold="True" Text="Top 3 searched movies on our site" ForeColor="White"></asp:Label>
            </h4>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <div class="col-xs-12 movie">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
          <asp:Image ID="ImagePoster1" runat="server" Width="300px" />
                <asp:Button ID="ButtonTopMovie1" class="btn btn-success" runat="server" Text="Movie Info" PostBackUrl="~/Index.aspx" OnClick="ButtonTopMovie1_Click"  />
                 &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1Poster" runat="server" Text="Label" ForeColor="White"></asp:Label>
                &nbsp;&nbsp;
                <asp:Label ID="LabelPoster1" runat="server" ForeColor="White" Text="Label"></asp:Label>
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;
                 <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <br />
                <br />
        
            &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                
            <asp:Image ID="ImagePoster2" runat="server" Width="300px" />
                <asp:Button ID="ButtonTopMovie2" class="btn btn-success" runat="server" Text="Movie Info" OnClick="ButtonTopMovie2_Click"  />
                &nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2Poster" runat="server" Text="Label" ForeColor="White"></asp:Label>
                &nbsp;&nbsp;
                <asp:Label ID="LabelPoster2" runat="server" ForeColor="White" Text="Label"></asp:Label>
                <br />
                <br />
              
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;<br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <br />
           
            

           
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
           
            <asp:Image ID="ImagePoster3" runat="server" Width="300px" />
                <asp:Button ID="ButtonTopMovie3" class="btn btn-success" runat="server" Text="Movie Info" OnClick="ButtonTopMovie3_Click" />
                &nbsp;&nbsp;
                <asp:Label ID="Label3Poster" runat="server" Text="Label" ForeColor="White"></asp:Label>
                &nbsp;&nbsp;
                <asp:Label ID="LabelPoster3" runat="server" ForeColor="White" Text="Label"></asp:Label>
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;<br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <br />

            </div>
                
                <br />
               
    &nbsp;<br />
            <br />
            &nbsp;&nbsp;
            <asp:Label ID="LabelMessages" runat="server"></asp:Label>
            <br />
            <br />
           
            <div class="reklame">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/MyCommercial.xml" Width="450px" />
            </div>
            
                <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<div class="reklame">
            </div>
            
                <br />
        
    </form>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<div class="demo">
  <h1></h1>

</div>

<div class="footer"><strong>4 hand in</strong> made by pawan and Birhat.</div>



</body>
</html>
