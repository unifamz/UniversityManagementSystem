<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/teacher.master" AutoEventWireup="true" CodeFile="ttimetable.aspx.cs" Inherits="teacher_ttimetable" %>

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
        <br />

        <div class="row">
            <h3 class="col-md-2">Teacher ID:-</h3>
            <div class="col-md-8">
                <asp:TextBox ID="tbteacherid" runat="server" CssClass="form-control" placeholder="Enter Teacher ID." required autofocus></asp:TextBox>
            </div>
            <div class="col-md-2">
                <asp:Button ID="btncheck" runat="server" Text="Check" CssClass="btn btn-danger" Width="140px" OnClick="btncheck_Click" />
            </div>
        </div>

        <br />
        <br />

        <div class="row" id="divname" runat="server">
            <h3 class="col-md-2">Name:-</h3>
            <asp:Label ID="lbname" runat="server" CssClass="col-md-10" Style="color: red; font-size: x-large"></asp:Label>
        </div>

        <br />
        <br />

        <div class="row" id="divdepartment" runat="server">
            <h3 class="col-md-2">Department:-</h3>
            <asp:Label ID="lbdepartment" runat="server" CssClass="col-md-10" Style="color: red; font-size: x-large"></asp:Label>
        </div>

        <br />
        <br />

        <div class="row" id="divcourse" runat="server">
            <h3 class="col-md-2">Course:-</h3>
            <asp:Label ID="lbcourse" runat="server" CssClass="col-md-10" Style="color: red; font-size: x-large"></asp:Label>
        </div>

        <br />
        <br />

        <div class="row" id="divsubject" runat="server">
            <h3 class="col-md-2">Subject:-</h3>
            <asp:Label ID="lbSubject" runat="server" CssClass="col-md-10" Style="color: red; font-size: x-large"></asp:Label>
        </div>

        <br />
        <br />
        <br />

        <asp:Panel ID="plgrid" runat="server" BorderStyle="Ridge">
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="gvgridview" runat="server" AutoGenerateColumns="False" Width="100%" HeaderStyle-Font-Size="Large" HeaderStyle-BackColor="#2E3C59" HeaderStyle-ForeColor="White" DataSourceID="SqlDataSource1">

                        <Columns>
                            <asp:TemplateField HeaderText="Serial No">
                                <ItemTemplate>
                                    No. <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="day" HeaderText="Day" SortExpression="day" />
                            <asp:BoundField DataField="lectureno" HeaderText="Lecture No." SortExpression="lectureno" />
                            <asp:BoundField DataField="timing" HeaderText="Timing" SortExpression="timing" />
                            <asp:BoundField DataField="roomno" HeaderText="Room No." SortExpression="roomno" />
                            <asp:BoundField DataField="class" HeaderText="Section" SortExpression="class" />
                        </Columns>
                        <HeaderStyle BackColor="#2E3C59" Font-Size="Large" ForeColor="White" />

                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NetDomainConnectionString %>" SelectCommand="SELECT [day], [lectureno], [timing], [roomno], [class] FROM [teachertimetable] WHERE ([teacherid] = @teacherid)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="tbteacherid" Name="teacherid" PropertyName="Text" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </asp:Panel>

        <br />
        <br />
        <br />

    </div>

</asp:Content>
