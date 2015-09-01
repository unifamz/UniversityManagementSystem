<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="awarden.aspx.cs" Inherits="admin_awarden" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <%--<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />

    <!--Scripts-->
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>--%>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid bg-success">
        <div style="height: 20px; margin-left: 200px;"></div>
        <asp:Panel ID="plwardenid" runat="server" BorderStyle="Ridge" BorderColor="#e0dcdf">
            <div class="row">
                <div class="col-md-12">
                    <asp:Label ID="lbwarden" CssClass="label control-label" runat="server" Text="Warden" Style="text-align: center; font-size: larger; color: black; font-family: Arial; margin-left: 500px;" Font-Underline="true"></asp:Label>
                </div>
                <br />
                <br />
                <br />
                <br />
                
                <div class="col-md-3">
                    <asp:Label ID="lbwarednid" runat="server" Text="Warden ID:-" Style="font-size: large"></asp:Label>
                </div>
                <div class="col-md-9">
                    <asp:TextBox ID="tbwardenid" runat="server" CssClass="form-control" placeholder="Warden ID" required></asp:TextBox>
                </div>
                <br />
                <br />
                <div class="col-md-3">
                    <asp:Label ID="lbname" runat="server" Text="Warden Name:-" Style="font-size: large"></asp:Label>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="tbfirstname" runat="server" CssClass="form-control" placeholder="First Name" required></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="tbmiddlename" runat="server" CssClass="form-control" placeholder="Middle Name"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="tblastname" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                </div>
                <br />
                <br />
                <div class="col-md-3">
                    <asp:Label ID="lbpassword" runat="server" Text="Password:-" Style="font-size: large"></asp:Label>
                </div>
                <div class="col-md-9">
                    <asp:TextBox ID="tbpassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password" required></asp:TextBox>
                </div>
                <br />
                <br />

                <div class="col-md-3">
                    <asp:Label ID="lbretypepassword" runat="server" Text="Retype Password:-" Style="font-size: large"></asp:Label>
                </div>
                <div class="col-md-9">
                    <asp:TextBox ID="tbretypepassword" runat="server" CssClass="form-control" placeholder="Retype Password" TextMode="Password" required></asp:TextBox>
                </div>
                <br />
                <br />
                <br />
                <br />
                <div class="col-md-5"></div>
                <div class="col-md-7">
                    <asp:Button ID="btnwardesubmit" runat="server" Text="Assign" CssClass="btn btn-info" Height="61px" Width="195px" OnClick="btnwardesubmit_Click"  />
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>

