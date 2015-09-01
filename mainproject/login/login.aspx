<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/login/login.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login_login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
    <link href="../css/login.css" rel="stylesheet" type="text/css" />
    <!--Scripts-->
    <script src="http://code.jquery.com/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function (e) {
            //if($("<%=btnteacher.ClientID %>").click(function(){
            $("<%=tbemail.ClientID %>").bind('focus',function(){
                if($(this).val()=="Teacher ID")
                {
                    $(this).val('');
                }
                $(this).css('color', '#333');
            });
            $("<%=tbemail.ClientID %>").bind('blur', function () {
                if ($(this).val() == '') {
                    $(this).val("Teacher ID");
                }
                $(this).css('color', '#333');
            });
            
        });
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid" style="height: auto; background-image: url(../images/black.jpg)">

        <div style="height: 60px"></div>

        <div class="row">
            <div class="col-sm-6">
                <asp:Button ID="btnadmin" runat="server" Text="Admin" CssClass="btn btn-sm btn-block btn-warning" Style="font-size: larger" formnovalidate OnClick="btnadmin_Click" />
            </div>
            <div class="col-sm-6">
                <asp:Button ID="btnuser" runat="server" Text="User" CssClass="btn btn-sm btn-block btn-warning" Style="font-size: larger" formnovalidate OnClick="btnuser_Click" />
            </div>
        </div>

        <div style="height: 40px"></div>

        <div class="row" id="divusers" runat="server">
            <div class="col-sm-4">
                <asp:Button ID="btnteacher" runat="server" Text="Teacher" CssClass="btn btn-sm btn-block btn-success" Style="font-size: larger" OnClick="btnteacher_Click" formnovalidate />
            </div>
            <div class="col-sm-4">
                <asp:Button ID="btnstudent" runat="server" Text="Student" CssClass="btn btn-sm btn-block btn-success" Style="font-size: larger" OnClick="btnstudent_Click" formnovalidate />
            </div>
            <div class="col-sm-4">
                <asp:Button ID="btnwarden" runat="server" Text="Warden" CssClass="btn btn-sm btn-block btn-success" Style="font-size: larger"  formnovalidate OnClick="btnwarden_Click" />
            </div>
        </div>

        <div class="row" id="divlogin" runat="server">
            <div class="col-sm-4 col-md-8 col-md-offset-2">
                <h1 class="text-center login-title" style="color: white">Sign in to continue </h1>
                <div class="account-wall">
                    <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                        alt="" />
                    <form class="form-signin">
                        <asp:Label ID="lbid" runat="server" Style="font-size: medium"></asp:Label>
                        <asp:TextBox ID="tbid" runat="server" CssClass="form-control" required autofocus></asp:TextBox>

                        <asp:Label ID="lbpassword" runat="server" Style="font-size: medium" Text="Password:-"></asp:Label>
                        <asp:TextBox ID="tbpassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password" required></asp:TextBox>
                        <asp:HyperLink CssClass="pull-right text-danger " runat="server" NavigateUrl="~/login/forgotpassword.aspx">Forgot Password</asp:HyperLink>
                        <asp:Button ID="btnlogin" runat="server" CssClass="btn btn-lg btn-primary btn-block" Text="Login" OnClick="btnlogin_Click1" />
                        <label class="checkbox pull-left">
                            <input type="checkbox" value="remember-me" />
                            Remember me
                        </label>
                        <a href="#" class="pull-right need-help">Need help? </a><span class="clearfix"></span>
                    </form>

                    <a href="../starting/registeration.aspx" class="text-center new-account bg-success" style="font-size: x-large; color: blue;">Create an account </a>
                </div>
            </div>
        </div>

        <div style="height: 50px"></div>
    </div>
</asp:Content>

