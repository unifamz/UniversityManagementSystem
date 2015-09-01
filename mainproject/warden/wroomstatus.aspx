<%@ Page Title="" Language="C#" MasterPageFile="~/warden/warden.master" AutoEventWireup="true" CodeFile="wroomstatus.aspx.cs" Inherits="warden_wroomstatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <%-- <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
    <link href="../css/login.css" rel="stylesheet" type="text/css" />
    <!--Scripts-->
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>--%>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container-fluid">

        <div class="row">
            <div class="col-md-12" style="text-align: center">
                <h2>Room Information</h2>
            </div>
        </div>

        <br />
        <br />
        <br />

        <div class="row">
            <div class="col-md-4">
                <asp:Button ID="btnspecificroom" runat="server" Text="Single Room" CssClass="btn btn-info center-block" Height="50px" Width="190px" Font-Size="Medium" OnClick="btnspecificroom_Click" formnovalidate />
            </div>
            <div class="col-md-4">
                <asp:Button ID="btnrangeroom" runat="server" Text="Range Room" CssClass="btn btn-info center-block" Height="50px" Width="190px" Font-Size="Medium" OnClick="btnrangeroom_Click" formnovalidate />
            </div>
            <div class="col-md-4">
                <asp:Button ID="btnallrooms" runat="server" Text="All Room" CssClass="btn btn-info center-block" Height="50px" Width="190px" Font-Size="Medium" OnClick="btnallrooms_Click" formnovalidate />
            </div>
        </div>

        <br />
        <br />

        <asp:Panel ID="plenterroom" runat="server" BorderStyle="Ridge">
            <div class="form-group">
                <div class="col-md-3">
                    <asp:Label ID="lbroomfrom" runat="server" Style="font-size: large"></asp:Label>
                </div>
                <div class="col-md-9">
                    <asp:TextBox ID="tbroomfrom" runat="server" CssClass="form-control" placeholder="Enter Room Number eg. 214" autofocus required></asp:TextBox>
                </div>
            </div>

            <br />
            <br />

            <div class="form-group">
                <div class="col-md-3">
                    <asp:Label ID="lbroomto" runat="server" Style="font-size: large"></asp:Label>
                </div>
                <div class="col-md-9">
                    <asp:TextBox ID="tbroomto" runat="server" CssClass="form-control" placeholder="Enter Room Number eg. 214" required></asp:TextBox>
                </div>
            </div>

            <br />
            <br />

            <div class="row">
                <div class="col-md-12">
                    <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-danger center-block" Text="Submit" Height="80px" Font-Size="Larger" Width="163px" OnClick="btnsubmit_Click" />
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="plgrid" runat="server" BorderStyle="Ridge">
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="gvroomstatus" runat="server" AutoGenerateColumns="False" Width="100%" HeaderStyle-Font-Size="Large" HeaderStyle-BackColor="#2E3C59" HeaderStyle-ForeColor="White" PageSize="50" AllowPaging="true" OnPageIndexChanging="gvroomstatus_PageIndexChanging">
                        <Columns>
                            <asp:TemplateField HeaderText="Serial No">
                                <ItemTemplate>
                                    No. <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="room" HeaderText="Room Number" SortExpression="room" />
                            <asp:BoundField DataField="allot" HeaderText="Alloted Student" SortExpression="allot" />
                            <asp:BoundField DataField="student1" HeaderText="Student Name" SortExpression="student1" />
                            <asp:BoundField DataField="roll1" HeaderText="Roll Number" SortExpression="roll1" />
                            <asp:BoundField DataField="student2" HeaderText="Student Name" SortExpression="student2" />
                            <asp:BoundField DataField="roll2" HeaderText="Roll Number" SortExpression="roll2" />
                        </Columns>
                        <HeaderStyle BackColor="#2E3C59" Font-Size="Large" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NetDomainConnectionString %>" SelectCommand="SELECT [room], [allot], [student1], [roll1], [student2], [roll2] FROM [allotrooms]"></asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NetDomainConnectionString %>" SelectCommand="SELECT [room], [allot], [student1], [roll1], [student2], [roll2] FROM [allotrooms] WHERE (([room] &gt;= @room) AND ([room] &lt;= @room2))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="tbroomfrom" Name="room" PropertyName="Text" Type="Int32" />
                            <asp:ControlParameter ControlID="tbroomto" Name="room2" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:NetDomainConnectionString %>" SelectCommand="SELECT [room], [allot], [student1], [roll1], [student2], [roll2] FROM [allotrooms] WHERE ([room] = @room)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="tbroomfrom" Name="room" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </asp:Panel>



        <div style="height: 60px"></div>
    </div>
</asp:Content>

