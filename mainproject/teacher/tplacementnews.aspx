<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/teacher.master" AutoEventWireup="true" CodeFile="tplacementnews.aspx.cs" Inherits="teacher_tplacementnews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />

    <!--Scripts-->
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {
            $('[id*=lbdepartment]').multiselect({
                includeSelectAllOption: true
            });
        });
    </script>

    <script type="text/javascript">
        $(function () {
            $('[id*=lbcourse]').multiselect({
                includeSelectAllOption: true
            });
        });
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid">

        <br />
        <br />

        <div class="row">
            <h3 class="col-md-3">Title:-</h3>
            <div class="col-md-9">
                <asp:TextBox ID="tbtitle" runat="server" CssClass="form-control" placeholder="Enter company title"></asp:TextBox>
            </div>
        </div>

        <br />
        <br />

        <div class="row">
            <h3 class="col-md-3">Date:-</h3>
            <asp:Label ID="lbdate" runat="server" for="date" CssClass="col-md-9" Style="font-size: x-large; color: red"></asp:Label>
        </div>

        <br />
        <br />

        <div class="row">
            <h3 class="col-md-3">Document:-</h3>
            <div class="col-md-9">
                <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
                <asp:UpdatePanel ID="upfileupload" runat="server">
                    <ContentTemplate>
                        <asp:FileUpload ID="fudocument" runat="server" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <br />
        <br />

        <div class="row">
            <h3 class="col-md-3">Information:-</h3>
            <div class="col-md-9">
                <asp:TextBox ID="tbinformation" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Enter information about company..." Height="180px" Width="420px"></asp:TextBox>
            </div>
        </div>

        <br />
        <br />

        <div class="row">
            <h3 class="col-md-3">Placement Date:-</h3>
            <div class="col-md-5">
                <h3>Select Placement Date from calender</h3>
            </div>
            <div class="col-md-4">
                
                <asp:UpdatePanel ID="upl1" runat="server">
                    <ContentTemplate>
                        <asp:Calendar ID="clplacementdate" runat="server" BorderWidth="1px"
                            DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" Height="200px"
                            ShowGridLines="True" Width="387px" BackColor="#FFFFCC" BorderColor="#FFCC66"
                            ForeColor="#663399">
                            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                            <OtherMonthDayStyle ForeColor="#CC9966" />
                            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                            <SelectorStyle BackColor="#FFCC66" />
                            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt"
                                ForeColor="#FFFFCC" />
                            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                            <WeekendDayStyle Font-Names="Calibri" />
                        </asp:Calendar>
                    </ContentTemplate>
                </asp:UpdatePanel>


            </div>
        </div>

        <br />
        <br />

        <div class="row">
            <h3 class="col-md-3">Eligible Condition:-</h3>
            <div class="col-md-5" style="text-align: center">
                <asp:RadioButton ID="rbyes" runat="server" GroupName="condition" Text="YES" CssClass="radio" Font-Size="X-Large" AutoPostBack="true" />
            </div>
            <div class="col-md-4" style="text-align: center">
                <asp:RadioButton ID="rbno" runat="server" GroupName="condition" Text="NO" CssClass="radio" Font-Size="X-Large" AutoPostBack="true" />
            </div>
        </div>

        <br />
        <br />
        <br />

        <asp:Panel ID="plcondition" runat="server" BorderStyle="Ridge">

            <form role="form">

                <div class="form-group">
                    <h3 class="col-md-3">10th Percentage:-</h3>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbtenth" runat="server" CssClass="form-control" placeholder="10th %"></asp:TextBox>
                    </div>
                </div>

                <br />
                <br />
                <br />

                <div class="form-group">
                    <h3 class="col-md-3">12th Percentage:-</h3>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbtweleve" runat="server" placeholder="12th %" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <br />
                <br />
                <br />

                <div class="form-group">
                    <h3 class="col-md-3">Graduation Percentage:-</h3>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbgraduation" runat="server" placeholder="Graduation %" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <br />
                <br />
                <br />
                <br />

                <div class="form-group">
                    <h3 class="col-md-3">Backlogs Allowed:-</h3>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbbacklogs" runat="server" placeholder="Backlogs" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <br />
                <br />
                <br />
                <br />

                <div class="form-group">
                    <h3 class="col-md-3">Department:-</h3>
                    <div class="col-md-9">
                        <asp:ListBox ID="lbdepartment" runat="server" SelectionMode="Multiple" AutoPostBack="True" OnSelectedIndexChanged="lbdepartment_SelectedIndexChanged">
                            <%--<asp:ListItem Text="---Select Department---" Selected="True" Value="0"></asp:ListItem>--%>
                        </asp:ListBox>
                    </div>
                </div>

                <br />
                <br />
                <br />
                <br />

                <div class="form-group">
                    <h3 class="col-md-3">Course:-</h3>
                    <div class="col-md-9">
                        <asp:ListBox ID="lbcourse" runat="server" SelectionMode="Multiple">
                            <%--<asp:ListItem Text="---Select Course---" Selected="True" Value="0"></asp:ListItem>--%>
                        </asp:ListBox>
                    </div>
                </div>

                <br />
                <br />
                <br />
                <br />
                <br />


            </form>
        </asp:Panel>
        <div class="row">
            <div class="col-md-6"></div>
            <div class="col-md-6">
                <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-primary" Height="79px" Width="137px" Font-Size="Medium" OnClick="btnsubmit_Click" />
            </div>
        </div>

        <br />
        <br />

    </div>
</asp:Content>

