<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.master" AutoEventWireup="true" CodeFile="mess.aspx.cs" Inherits="student_mess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <%--<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />

    <!--Scripts-->
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>--%>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid">

        <br />
        <br />
        <br />

        <div class="row">
            <div class="col-md-6" style="border-right-style:groove; text-align:center">
                <asp:Label ID="lbdate" runat="server" Style="color: red; font-size: xx-large;"></asp:Label>
            </div>
            <div class="col-md-6" style=" text-align:center">
                <asp:Label ID="lbday" runat="server" Style="color: red; font-size: xx-large;" ></asp:Label>
            </div>
        </div>

        <br />
        <br />

        <asp:Panel ID="plfood" runat="server" BorderStyle="Ridge">
            <div class="row">
                <div class="col-md-4" style="height: 400px; border-right-style:groove">
                    <h3 style="border-bottom-style: groove; font-size: x-large;" class="center-block text-primary">Breakfast</h3>
                    <br />
                    <asp:Label ID="lbbreakfast" runat="server" Style="height: 300px;"></asp:Label>
                </div>

                <div class="col-md-4" style="height: 400px; border-right-style:groove">
                    <h3 style="border-bottom-style: groove; font-size: x-large;" class="center-block text-primary">Lunch</h3>
                    <br />
                    <asp:Label ID="lblunch" runat="server" Style="height: 300px;"></asp:Label>
                </div>

                <div class="col-md-4" style="height: 400px;">
                    <h3 style="border-bottom-style: groove; font-size: x-large;" class="center-block text-primary">Dinner</h3>
                    <br />
                    <asp:Label ID="lbdinner" runat="server" Style="height: 300px;"></asp:Label>
                </div>
            </div>
        </asp:Panel>

        <br />
        <br />
        <br />

    </div>

</asp:Content>

