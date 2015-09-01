<%@ Page Title="" Language="C#" MasterPageFile="~/login/login.master" AutoEventWireup="true" CodeFile="forgotpassword.aspx.cs" Inherits="login_forgotpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
    <link href="../css/login.css" rel="stylesheet" type="text/css" />
    <!--Scripts-->
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
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
        
        <div class="row" id="divlogin" runat="server">
            <div class="col-sm-4 col-md-8 col-md-offset-2">
                <h1 class="text-center login-title" style="color: white">Forgot Password </h1>
                <div class="account-wall">
                    <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                        alt="" />
                    <form class="form-signin">
                        
                        <asp:TextBox ID="tbemail" runat="server" CssClass="form-control" placeholder="Email ID" required autofocus></asp:TextBox>
                        
                        <asp:Button ID="btnlogin" runat="server" CssClass="btn btn-lg btn-primary btn-block" Text="Send Email" OnClick="btnlogin_Click"  />
                        
                        
                    </form>

                    
                </div>
            </div>
        </div>
        <div style="height: 50px"></div>
    </div>
</asp:Content>
