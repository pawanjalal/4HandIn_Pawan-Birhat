<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XMLCrud.aspx.cs" Inherits="_4HandIn.XMLCrud" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="icon" href="icon.png" type="image" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" media="screen"/>
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet"/>

    <style type="text/css">

           .collage{
    background: linear-gradient( to right, rgba(27, 27, 27, 1),rgba(27, 27, 27, 0) ), url(http://www.cutehdwallpapers.com/uploads/large/lion/wide-animals-lion-image.jpg) no-repeat center center fixed;
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

        body {
  position: relative;
  margin: 0;
  padding-bottom: 6rem;
  min-height: 100%;
  font-family: "Helvetica Neue", Arial, sans-serif;
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
<h1 style="color:white;">Admin page.</h1>
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
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LabelMessage" runat="server" ForeColor="White" Text="Message"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBoxWebpage" runat="server"></asp:TextBox>
            &nbsp;<asp:Label ID="LabelWebpage" runat="server" ForeColor="White" Text="Webpage"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBoxPhone" runat="server"></asp:TextBox>
            &nbsp;<asp:Label ID="LabelPhone" runat="server" ForeColor="White" Text="Phone"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBoxPicture" runat="server"></asp:TextBox>
            &nbsp;<asp:Label ID="LabelPicture" runat="server" ForeColor="White" Text="Picture"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBoxCompany" runat="server"></asp:TextBox>
            &nbsp;<asp:Label ID="LabelCompany" runat="server" ForeColor="White" Text="Company"></asp:Label>
            &nbsp;<br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonCreate" runat="server" OnClick="ButtonCreate_Click" Text="Create" />
            &nbsp;
            <asp:Button ID="ButtonUpdate" runat="server" OnClick="ButtonUpdate_Click" Text="Update" />
            &nbsp;
            <asp:Button ID="ButtonDelete" runat="server" OnClick="ButtonDelete_Click" Text="Delete" />
            &nbsp;
            <asp:Button ID="ButtonCancel" runat="server" OnClick="ButtonCancel_Click" Text="Cancel" />
            &nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <asp:Repeater ID="Repeater1" runat="server">

                  <HeaderTemplate>
                    <table border="double" style="color:white; margin:20px;">
                        <tr>
                            <td> Webpage </td> 
                            <td> Phone </td> 
                            <td>  PictureLink</td> 
                            <td> Picture </td> 
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        
                        <td><%# Eval("NavigateUrl") %></td>
                        <td><%# Eval("Impressions") %></td>
                        <td><%# Eval("ImageUrl") %></td>
                        <td><img src="<%# Eval("ImageUrl") %>" alt="Ad" /> </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                    </FooterTemplate>




            </asp:Repeater>
            <br />
            <br />
        &nbsp;&nbsp;&nbsp;
        </div>
    </form>

    <div class="footer"><strong>4 hand in</strong> made by pawan and Birhat.</div>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>
