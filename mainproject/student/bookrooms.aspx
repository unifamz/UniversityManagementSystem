<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.master" AutoEventWireup="true" CodeFile="bookrooms.aspx.cs" Inherits="student_bookrooms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <%-- <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />

    <!--Scripts-->
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>--%>

    <script type="text/javascript">

        $(document).ready(function () {
            $("#btnhide").click(function (e) {

                $("#ContentPlaceHolder1_plshowpatner").hide(2000);
                e.preventDefault();
                e.stopPropagation();
                return false;
            })
        })

        function HidePanel() {
            alert("No partner in this room!!!");
            $("#ContentPlaceHolder1_plshowpatner").hide(2000);
        }

        //function HidePanelonroombookedclick(e) {
        //    //alert("aksfjdkajfd");
        //    $("#ContentPlaceHolder1_divroom").hide();
        //    $("#ContentPlaceHolder1_divroombooked").show();
        //    $("#ContentPlaceHolder1_divbtnroombooked").show();
        //    $("#ContentPlaceHolder1_plshowpatner").hide(2000);
        //    //getvacantrooms();
        //    e.stopPropagation();
        //    e.preventDefault();
        //}

    </script>
    <script type="text/javascript">
        function submitconfirm() {
            if (confirm('Do You want to really booked Room No.- <%=ddlroombooked.SelectedItem %> ')) {
                return true;
            }
            else {
                return false;
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid">

        <div class="row" style="height: 90px; text-align: center;">
            <h2>Book Room</h2>
        </div>

        <form role="form">

            <div class="form-group">
                <h4 class="col-md-3">Roll No.:-</h4>
                <div class="col-md-9">
                    <asp:TextBox ID="tbrollno" runat="server" CssClass="form-control" placeholder="Enter Roll Number" required autofocus></asp:TextBox>
                </div>
            </div>

            <br />
            <br />

            <div class="form-group">
                <h4 class="col-md-3">Password:-</h4>
                <div class="col-md-6">
                    <asp:TextBox ID="tbpassword" EnableViewState="true" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password" required></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:Button ID="btncheck" runat="server" Text="Check" CssClass="btn btn-danger" OnClick="btncheck_Click" />
                </div>
            </div>

            <br />
            <br />

            <div class="form-group">
                <h4 class="col-md-3">Name:- </h4>
                <div class="col-md-9">
                    <asp:Label ID="lbname" runat="server" Style="font-size: x-large; color: red; font-style: italic"></asp:Label>
                </div>
            </div>

            <br />
            <br />

            <asp:Panel ID="plloginafter" Visible="false" runat="server" BorderStyle="Ridge">

                <div class="form-group" id="divblock" runat="server">
                    <h4 class="col-md-3">Select Block:-</h4>
                    <div class="col-md-9">
                        <asp:DropDownList ID="ddlblock" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlblock_SelectedIndexChanged">
                            <asp:ListItem Text="---Select Block---" Value="0" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <br />
                <br />

                <div class="form-group" id="divfloor" runat="server">
                    <h4 class="col-md-3">Select Floor:-</h4>
                    <div class="col-md-9">
                        <asp:DropDownList ID="ddlfloor" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlfloor_SelectedIndexChanged">
                            <asp:ListItem Text="---Select Floor---" Value="0" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <br />
                <br />

                <div class="form-group" id="divside" runat="server">
                    <h4 class="col-md-3">Select Side:-</h4>
                    <div class="col-md-9">
                        <asp:DropDownList ID="ddlside" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlside_SelectedIndexChanged">
                            <asp:ListItem Text="---Select Side---" Value="0" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <br />
                <br />

                <div class="row" id="btnroomsrelated" runat="server">
                    <div class="col-md-6">
                        <asp:Button ID="btnroomstatus" runat="server" Text="Room Status" CssClass="btn btn-danger center-block" Height="57px" Width="172px" Font-Size="Medium" OnClick="btnroomstatus_Click" formnovalidate />
                    </div>
                    <div class="col-md-6">
                        <asp:Button ID="btnbookedroom" runat="server" Text="Room Booked" CssClass="btn btn-danger center-block" Height="57px" Width="186px" Font-Size="Medium"  OnClick="btnbookedroom_Click" formnovalidate />
                    </div>
                </div>
                <br />
                <br />
                <div class="form-group" id="divroom" runat="server">
                    <h4 class="col-md-3">Select Room :-</h4>
                    <div class="col-md-9">
                        <asp:DropDownList ID="ddlroom" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlroom_SelectedIndexChanged">
                            <asp:ListItem Text="---Select Room Number---" Value="0" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <br />
                <br />
            </asp:Panel>
            <br />
            <br />

            <asp:Panel ID="plshowpatner" Visible="true" runat="server" BorderStyle="Ridge">
                <div class="row" style="height: 60px; text-align: center">
                    <h2>Student Details</h2>
                </div>

                <br />
                <br />

                <div class="row">
                    <div class="col-md-4">
                        <asp:Image ID="imgphoto" runat="server" Style="margin-top: 100px; margin-left: 100px" Height="300px" Width="200px" />
                    </div>

                    <div class="col-md-8" style="border-left-style: groove">
                        <div class="form-group">
                            <asp:Label ID="lbpatnerroll" Text="Roll No.:-" runat="server" CssClass="col-md-3" Style="font-size: larger; color: black;"></asp:Label>
                            <asp:Label ID="lbpatnerrollshow" runat="server" CssClass="col-md-5" Style="font-size: x-large; color: red; font-style: normal"></asp:Label>
                        </div>


                        <br />
                        <br />

                        <div class="form-group">
                            <asp:Label ID="lbpatnername" Text="Name:-" runat="server" CssClass="col-md-3" Style="font-size: larger; color: black;"></asp:Label>
                            <asp:Label ID="lbpatnernameshow" runat="server" CssClass="col-md-5" Style="font-size: x-large; color: red; font-style: normal"></asp:Label>
                        </div>

                        <br />
                        <br />

                        <div class="form-group">
                            <asp:Label ID="lbpatnerstate" Text="State:-" runat="server" CssClass="col-md-3" Style="font-size: larger; color: black;"></asp:Label>
                            <asp:Label ID="lbpartnerstateshow" runat="server" CssClass="col-md-5" Style="font-size: x-large; color: red; font-style: normal"></asp:Label>
                        </div>

                        <br />
                        <br />

                        <div class="form-group">
                            <asp:Label ID="lbpatnercity" Text="City:-" runat="server" CssClass="col-md-3" Style="font-size: larger; color: black;"></asp:Label>
                            <asp:Label ID="lbpatnercityshow" runat="server" CssClass="col-md-5" Style="font-size: x-large; color: red; font-style: normal"></asp:Label>
                        </div>

                        <br />
                        <br />

                        <div class="form-group">
                            <asp:Label ID="lbpatnerdepartment" Text="Department:-" runat="server" CssClass="col-md-3" Style="font-size: larger; color: black;"></asp:Label>
                            <asp:Label ID="lbpatnerdepartmentshow" runat="server" CssClass="col-md-5" Style="font-size: x-large; color: red; font-style: normal"></asp:Label>
                        </div>

                        <br />
                        <br />
                        <br />

                        <div class="form-group">
                            <div class="col-md-5" style="text-align: center">
                                <button id="btnhide" style="height: 80px; width: 200px; font-size: x-large" class="btn btn-success" formnovalidate>Hide</button>
                            </div>
                            <div class="col-md-3" style="text-align: right">
                                <asp:Button ID="btnnext" Style="height: 50px; width: 150px; font-size: medium" CssClass="btn btn-primary" runat="server" Visible="false" formnovalidate OnClick="btnnext_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <br />
            </asp:Panel>
            <br />
            <br />
            <div class="form-group" id="divroombooked" runat="server">
                <h4 class="col-md-3">Available Rooms:-</h4>
                <div class="col-md-9">
                    <asp:DropDownList ID="ddlroombooked" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Room you want to be booked...just Select room number!!!" Selected="True" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <br />
            <br />

            <div class="row" id="divbtnroombooked" runat="server">
                <div class="col-md-12">
                    <asp:Button ID="btnsubmit" runat="server" Text="Room Booked" CssClass="btn btn-info center-block" Style="height: 50px; width: 200px; font-size: larger" OnClientClick="return submitconfirm();" OnClick="btnsubmit_Click" formnovalidate />
                </div>
            </div>
        </form>


        <div style="height: 50px"></div>
    </div>

</asp:Content>

