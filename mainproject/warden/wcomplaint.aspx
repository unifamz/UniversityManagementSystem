<%@ Page Title="" Language="C#" MasterPageFile="~/warden/warden.master" AutoEventWireup="true" CodeFile="wcomplaint.aspx.cs" Inherits="warden_wcomplaint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <%-- <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />

    <!--Scripts-->
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div style="height:60px"></div>
        <div class="row">
            <div class="col--md-12" style="text-align:center">
                <h1>Complaint List</h1>
            </div>
            <div class="col-md-12">
                <asp:GridView ID="gvcomplaintlist" runat="server" AutoGenerateColumns="False" Width="100%" HeaderStyle-Font-Size="Large" HeaderStyle-BackColor="#2E3C59" HeaderStyle-ForeColor="White" DataSourceID="SqlDataSource1">

                    <Columns>
                        <asp:TemplateField HeaderText="Serial No">
                            <ItemTemplate>
                              No. <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="name" HeaderText="Student Name" SortExpression="name" />
                        <asp:BoundField DataField="room" HeaderText="Room No" SortExpression="room" />
                        <asp:BoundField DataField="date" HeaderText="COmplaint Date" SortExpression="date" />
                        <asp:BoundField DataField="complaint" HeaderText="Description" SortExpression="complaint" />
                    </Columns>
<HeaderStyle BackColor="#2E3C59" Font-Size="Large" ForeColor="White"></HeaderStyle>

                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NetDomainConnectionString %>" SelectCommand="SELECT [name], [room], [date], [complaint] FROM [complaint]"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>

