<%@ Page Title="" Language="C#" MasterPageFile="~/starting/starting.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="starting_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />

    <!--Scripts-->
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div  style="height:400px; background-image:url(../images/education_and_college_background-660x330.jpg); text-align:center; vertical-align:central">
        <div style="height:150px"></div>
        <asp:Label ID="Label1" runat="server" Text="Welcome To University" style="height:400px; color:darkmagenta; font-size:90px"></asp:Label> <br />  
        <asp:Label ID="Label2" runat="server" Text="Schema" style="color:darkmagenta; font-size:90px;"></asp:Label>   
    </div>
</asp:Content>

