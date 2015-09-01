<%@ Page Title="" Language="C#" MasterPageFile="~/starting/starting.master" 
    AutoEventWireup="true" CodeFile="registeration.aspx.cs" Inherits="starting_registeration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />

    <!--Scripts-->
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="height: 60px"></div>
    <div class="row">
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

    <div class="container" style="margin: 10px" id="divmain" runat="server">
        <div class="row">
            <h2>New Registration</h2>
        </div>
        <form role="form">
             <div class="form-group" id="divdesignation"  runat="server">
                <asp:Label ID="lbdesignation" runat="server" for="designation"  class="col-md-2"></asp:Label>
                <div class="col-md-10">
                    <asp:DropDownList ID="ddldesignation" runat="server" CssClass="form-control" AutoPostBack="true" required OnSelectedIndexChanged="ddldesignation_SelectedIndexChanged">
                        
                    </asp:DropDownList>
                </div>
            </div>
            <br />
            <br />

            <div class="form-group" id="divcourse" runat="server">
                <asp:Label ID="lbcourse" runat="server" for="course" Text="Course:-"  class="col-md-2"></asp:Label>
                <div class="col-md-10">
                    <asp:DropDownList ID="ddlcourse" runat="server" CssClass="form-control" AutoPostBack="true" required>
                        
                    </asp:DropDownList>
                </div>
            </div>
            <br />
            <br />

            <div class="form-group">
                <asp:Label ID="lbid" runat="server" for="id" class="col-md-2"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="tbid" runat="server" CssClass="form-control" placeholder="Enter ID" autofocus required></asp:TextBox>
                </div>
                
            </div>
            <br />
            <br />

            <div class="form-group">
                <asp:Label ID="lbpassword" runat="server" for="password" Text="Password:-" class="col-md-2"></asp:Label>
                <div class="col-md-6">
                    <asp:TextBox ID="tbpassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password" required ></asp:TextBox>
                    <%--<p class="help-block">
                        Min: 6 Characters(Alphanumeric only)
                    </p>--%>
                </div>
                <div class="col-md-4">
                    <asp:Button ID="btncheck" CssClass="btn btn-danger" runat="server" Text="Check" OnClick="btncheck_Click"  formnovalidate />
                </div>
            </div>
            <br />
            <br />

            <div class="form-group">
                <asp:Label ID="lbname" runat="server" for="fullname" class="col-md-2" Text="Full Name:-"></asp:Label>
                <div class="col-md-10">
                    <asp:Label ID="lbnameshow" runat="server" for="name" BorderStyle="Ridge" style="font-size:larger; color:red; font-style:italic" required></asp:Label> 
                </div>
            </div>
            <br />
            <br />

            <div id="divsection" runat="server"  >
             <div class="form-group">
                <asp:Label ID="lbsection" runat="server" for="section" class="col-md-2" Text="Section:-"></asp:Label>
                <div class="col-md-10">
                    <asp:Label ID="lbsectionshow" runat="server" for="section" BorderStyle="Ridge" style="font-size:larger; color:red; font-style:italic" required></asp:Label>
                </div>
            </div>
            <br />
            <br />
           
            <div class="form-group">
                <asp:Label ID="lbsemster" runat="server" for="semster" class="col-md-2" Text="Semster:-"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="tbsemster" runat="server" placeholder="Semster" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <br />
            <br />
                </div>
            <%--<div class="form-group">
                <asp:Label ID="lbretypepassword" runat="server" for="retypepassword" Text="Retype Password:-" class="col-md-2"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="tbretypepassword" runat="server" CssClass="form-control" placeholder="Retype Password" TextMode="Password" required></asp:TextBox>
                </div>
            </div>
            <br />
            <br />--%>

            <div class="form-group">
                <asp:Label ID="lbmobile" runat="server" for="mobile" Text="Contact No.:-" class="col-md-2"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="tbmobile" runat="server" CssClass="form-control" placeholder="Contact Number" required MaxLength="10"></asp:TextBox>
                </div>
            </div>
            <br />
            <br />

            <div class="form-group">
                <asp:Label ID="lbaddress" runat="server" for="address" Text="Address:-" class="col-md-2"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="tbaddress" runat="server" CssClass="form-control" placeholder="Permanent Address" required></asp:TextBox>
                </div>
            </div>
            <br />
            <br />

            <div class="form-group">
                <asp:Label ID="lbstate" runat="server" for="state" Text="State:-" class="col-md-2"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="tbstate" runat="server" CssClass="form-control" placeholder="State" required></asp:TextBox>
                </div>
            </div>
            <br />
            <br />

            <div class="form-group">
                <asp:Label ID="lbcity" runat="server" for="city" Text="city:-" class="col-md-2"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="tbcity" runat="server" CssClass="form-control" placeholder="City" required></asp:TextBox>
                </div>
            </div>
            <br />
            <br />
            
            <div class="form-group">
                <asp:Label ID="lbpincode" runat="server" for="pincode" Text="PinCode:-" class="col-md-2"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="tbpincode" runat="server" CssClass="form-control" placeholder="PinCode" required></asp:TextBox>
                </div>
            </div>
            <br />
            <br />

            <div class="form-group">
                <asp:Label ID="lbemail" runat="server" for="email" Text="Email ID:-" class="col-md-2"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="tbemail" runat="server" CssClass="form-control" placeholder="Email ID" required></asp:TextBox>
                    <p class="help-block">
                        Example:- Yourname@domain.com
                    </p>
                </div>
            </div>
            <br />
            <br />
            <br />

            <div class="form-group">
                <asp:Label ID="lbgender" runat="server" for="gender" Text="Gender:-" class="col-md-2"></asp:Label>
                <div class="col-md-10">
                    <asp:DropDownList ID="ddlgender" runat="server" CssClass="form-control" required>
                        <asp:ListItem Text="---Select Gender---" Selected="True" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Male" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Female" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <br />
            <br />

            <div class="form-group">
                <asp:Label ID="lbbirthdate" runat="server" for="birthdate" Text="Bithdate:-" class="col-md-2"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddldate" runat="server" CssClass="form-control" required>
                        <asp:ListItem Text="---Select Date---" Value="date" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <asp:DropDownList ID="ddlmonth" runat="server" CssClass="form-control">
                        <asp:ListItem Text="---Select Month---" Value="month" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlyear" runat="server" CssClass="form-control">
                        <asp:ListItem Text="---Select Year---" Value="year" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <br />
            <br />

           

            
            <div class="form-group">
                <asp:Label ID="lbimageupload" runat="server" for="city" Text="Upload Image:-" class="col-md-2"></asp:Label>
                <div class="col-md-10">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>
            </div>
            <br />
            <br />
            <br />
            <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="up1" runat="server">
                <ContentTemplate>
            <div class="form-group">
                <div class="col-md-3"></div>
                <div class="col-md-5">
                    <asp:Image ID="imgcaptcha" runat="server" Width="300px" Height="50px" />
                </div>
                <div class="col-md-4">
                    <asp:Button ID="btnregenerate" runat="server" Text="Regenerate" CssClass="btn btn-danger" OnClick="btnregenerate_Click" formnovalidate />
                </div>
            </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            <br />
            <br />
            <br />
            <div class="form-group">

                <asp:Label ID="lbcaptcha" runat="server" for="captcha" Text="Enter Code above:-" class="col-md-3"></asp:Label>

                <div class="col-md-4">
                    <asp:TextBox ID="tbcaptcha" runat="server" CssClass="form-control" placeholder="Captcha" required></asp:TextBox>
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnsubmit" runat="server" class="btn btn-info " Text="Register" Font-Size="X-Large" Height="72px" Width="243px" Font-Bold="True" OnClick="btnsubmit_Click" />
                </div>
            </div>
        </form>
    </div>
    <div style="height: 60px"></div>
</asp:Content>
