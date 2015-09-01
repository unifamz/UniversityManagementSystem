<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ateachertimetable.aspx.cs" Inherits="admin_ateachertimetable" %>

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

        <div style="height: 10px"></div>

        <br />
        <br />
        <br />
        <div class="form-group">
            <h3 class="col-md-3">Teacher ID:-</h3>
            <div class="col-md-8">
                <asp:TextBox ID="tbteacherid" runat="server" placeholder="Teacher ID" CssClass="form-control"  ></asp:TextBox>
            </div>
            <div class="col-md-1">
                <asp:Button ID="btnsearch" runat="server" style="border-radius:25px" Text="Go" CssClass="btn btn-danger" OnClick="btnsearch_Click" />
            </div>
        </div>

        <br />
        <br />
        <br />

        <div class="form-group">
            <h3 class="col-md-3">Name:-</h3>
            <div class="col-md-9">
                <asp:Label ID="lbname" runat="server" Style="font-size: x-large; color: red; font-style: italic"></asp:Label>
            </div>
        </div>

        <br />
        <br />

        <asp:Panel ID="plassigntimetable" runat="server" BorderStyle="Ridge" style="height:auto">

            <form role="form">

                <div class="form-group">
                    <h3 class="col-md-2">Subject:-</h3>
                    <div class="col-md-10">
                        <asp:TextBox ID="tbsubject" runat="server" placeholder="Enter subject name eg. physics or system programming" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <br />
                <br />
                <br />

                <div class="form-group">
                    <h3 class="col-md-2">Department:-</h3>
                    <div class="col-md-10">
                        <asp:DropDownList ID="ddldepartment" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged">
                            <asp:ListItem Text="---Select Department---" Selected="True" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <br />
                <br />
                <br />

                <div class="form-group">
                    <h3 class="col-md-2">Course:-</h3>
                    <div class="col-md-10">
                        <asp:DropDownList ID="ddlcourse" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlcourse_SelectedIndexChanged">
                            <asp:ListItem Text="---Select Course---" Selected="True" Value="0"> </asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <br />
                <br />
                <br />

                <div class="form-group">
                    <h3 class="col-md-2">Day:-</h3>
                    <div class="col-md-10">
                    <asp:DropDownList ID="ddlday" runat="server" CssClass="form-control" AutoPostBack="True">
                        <asp:ListItem Text="---Select Day---" Value="0" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                        </div>
                </div>

                <br />
                <br />
                <br />

                <div class="form-group">
                   <div class="col-md-3" id="divlecture" runat="server">
                       <asp:Label ID="lblecture" runat="server" Text="Lecture No.(eg. 5)" Font-Size="Large"></asp:Label>
                   </div>

                    <div class="col-md-3" id="divtiming" runat="server">
                       <asp:Label ID="lbtiming" runat="server" Text="Timing(eg. 1:20 pm - 2:00pm)" Font-Size="Large"></asp:Label>
                   </div>
 
                    <div class="col-md-3" id="divclass" runat="server">
                       <asp:Label ID="lbroom" runat="server" Text="Room No(eg. BF02)" Font-Size="Large"></asp:Label>
                   </div>

                    <div class="col-md-3" id="divclass1" runat="server">
                        <asp:Label ID="lbclass" runat="server" Text="Class(eg. 1 or 2)" Font-Size="Large"></asp:Label>
                    </div>

                </div>

                <br />
                <br />

                <div class="row" id="divtextboxcreate" runat="server">
                    <div class="col-md-10">
                        <asp:TextBox ID="tbcreatetextboxes" runat="server" placeholder="Enter Number of textboxes you want to create...eg. 4 or 5 etc" CssClass="form-control" ></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        
                        <asp:Button ID="btncreate" runat="server" Text="Create" style="border-radius:10px; Font-Size:medium" CssClass="btn btn-success"  OnClick="btncreate_Click" />
                    </div>
                </div>

                <br />
                <br />
                <br />
                <br />

                <div class="row">
                    <div class="col-md-6"></div>
                    <div class="col-md-6" id="divbutton" runat="server" >
                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-info" Height="68px" Width="151px" Font-Size="Medium" OnClick="btnsubmit_Click" />
                    </div>
                </div>
            </form>
            <br />
            <br />
        </asp:Panel>
        <br />
        <br />
    </div>
</asp:Content>

