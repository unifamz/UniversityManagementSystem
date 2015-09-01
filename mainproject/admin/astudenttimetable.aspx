<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="astudenttimetable.aspx.cs" Inherits="admin_astudenttimetable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

   <%-- <meta charset="utf-8" />
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

        <div class="row">
            <h3 class="col-md-3">Department:-</h3>
            <div class="col-md-9">
                <asp:DropDownList ID="ddldepartment" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged">
                    <asp:ListItem Text="---Select Department---" Selected="True" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <br />
        <br />
        <br />

        <div class="row">
            <h3 class="col-md-3">Course:-</h3>
            <div class="col-md-9">
                <asp:DropDownList ID="ddlcourse" runat="server" CssClass="form-control" AutoPostBack="true">
                    <asp:ListItem Text="---Select Course---" Selected="True" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <br />
        <br />
        <br />

        <div class="row">
            <h3 class="col-md-3">Semster:-</h3>
            <div class="col-md-9">
                <asp:DropDownList ID="ddlsemster" runat="server" CssClass="form-control" AutoPostBack="true">
                    <asp:ListItem Text="---Select Semster---" Value="0" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="First (1st)" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Second (2nd)" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Third (3rd)" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Fourth (4th)" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Fifth (5th)" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Sixth (6th)" Value="6"></asp:ListItem>
                    <asp:ListItem Text="Seventh (7th)" Value="7"></asp:ListItem>
                    <asp:ListItem Text="Eighth (8th)" Value="8"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <br />
        <br />
        <br />

        <div class="row">
            <h3 class="col-md-3">Section:-</h3>
            <div class="col-md-9">
                <asp:DropDownList ID="ddlsection" runat="server" CssClass="form-control" AutoPostBack="true">
                    <asp:ListItem Text="---Select Section---" Value="0" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="First (1st)" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Second (2nd)" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Third (3rd)" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Fourth (4th)" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Fifth (5th)" Value="5"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <br />
        <br />
        <br />

        <div class="row">
        <h3 class="col-md-3">Total Lectures:-</h3>
        <div class="col-md-9">
        <asp:TextBox ID="tbtotallectures" runat="server" placeholder="Enter total Lectures" CssClass="form-control"></asp:TextBox>
        </div>
        </div>

        <br />
        <br />
        <br />

        <div class="row">
            <h3 class="col-md-3">Day:-</h3>
            <div class="col-md-9">
                <asp:DropDownList ID="ddlday" CssClass="form-control" runat="server" AutoPostBack="true">
                    <asp:ListItem Text="---Select Day---" Selected="True" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Monday" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Tuesday" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Wednesday" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Thurday" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Friday" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Saturday" Value="6"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <br />
        <br />
        <br />

        <asp:Panel ID="pltimetable" runat="server" BorderStyle="Ridge">
            <div class="form-group">
                <h3 class="col-md-3">Lecture No</h3>
                <div class="col-md-9">
                    <asp:Label ID="lblectureno" runat="server" for="lectureno" style="color:Red; font-size:x-large"></asp:Label>
                </div>
            </div>

            <br />
            <br />
            <br />

            <div class="form-group">
                <h3 class="col-md-3">Timing</h3>
                <div class="col-md-9">
                    <asp:TextBox ID="tbtiming" runat="server" placeholder="Timing" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <br />
            <br />
            <br />

            <div class="form-group">
                <h3 class="col-md-3">Subject:-</h3>
                <div class="col-md-9">
                    <asp:TextBox ID="tbsubject" runat="server" placeholder="Subject" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <br />
            <br />
            <br />

            <div class="form-group">
                <h3 class="col-md-3">Class Room:-</h3>
                <div class="col-md-6">
                    <asp:TextBox ID="tbclassroom" runat="server" placeholder="Classroom" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:Button CssClass="btn btn-danger" Text="Insert" ID="btninsert" runat="server" Font-Size="Medium" OnClick="btninsert_Click" Width="129px" />
                </div>
            </div>

            <br />
            <br />

        </asp:Panel>

        <br />
        <br />

        <div class="row">
            <div class="col-md-6"></div>
            <div class="col-md-6">
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-primary" Font-Size="Medium" Height="62px" Width="145px" OnClick="btnsubmit_Click" />
            </div>
        </div>

        <br />
        <br />

    </div>

</asp:Content>

