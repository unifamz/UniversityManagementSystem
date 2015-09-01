<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/teacher.master" AutoEventWireup="true" CodeFile="teligiblestudents.aspx.cs" Inherits="teacher_teligiblestudents" %>

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

        <br />
        <br />

        <form role="form">

            <div class="form-group">
                <h3 class="col-md-3">10th Percentage:-</h3>
                <div class="col-md-9">
                    <asp:TextBox ID="tbtenth" runat="server" placeholder="10th %" required autofocus MaxLength="2" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <br />
            <br />
            <br />

            <div class="form-group">
                <h3 class="col-md-3">12th Percentage:-</h3>
                <div class="col-md-9">
                    <asp:TextBox ID="tbtweleve" runat="server" placeholder="12th %" required autofocus MaxLength="2" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <br />
            <br />
            <br />

            <div class="form-group">
                <h3 class="col-md-3">Graduation Percentage:-</h3>
                <div class="col-md-9">
                    <asp:TextBox ID="tbgraduationpercentage" runat="server" placeholder="10th %" required autofocus MaxLength="2" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <br />
            <br />
            <br />

            <div class="form-group">
                <h3 class="col-md-3">Upto Backlogs:-</h3>
                <div class="col-md-9">
                    <asp:TextBox ID="tbbacklogs" runat="server" placeholder="upto backlogs allowed" required autofocus MaxLength="2" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <br />
            <br />
            <br />

            <div class="form-group">
                <h3 class="col-md-3">Department:-</h3>
                <div class="col-md-9">
                    <asp:DropDownList ID="ddldepartment" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged">
                        <asp:ListItem Text="---Select Department---" Selected="False" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <br />
            <br />
            <br />

            <div class="form-group">
                <h3 class="col-md-3">Course:-</h3>
                <div class="col-md-9">
                    <asp:DropDownList ID="ddlcourse" runat="server" CssClass="form-control" AutoPostBack="True">
                        <asp:ListItem Text="---Select Course---" Selected="True" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <br />
            <br />
            <br />
            <br />
            <br />

            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnshowlist" runat="server" Text="Show List" CssClass="btn btn-primary" Font-Size="Medium" Height="83px" Width="188px" OnClick="btnshowlist_Click" />
                 </div>
            </div>
        </form>

        <br />
        <br />
        <br />
        <br />

        <asp:Panel ID="plgrid" runat="server" BorderStyle="Ridge">
            <asp:GridView ID="gvlist" runat="server" AutoGenerateColumns="False" Width="100%" HeaderStyle-Font-Size="Large" HeaderStyle-BackColor="#2E3C59" HeaderStyle-ForeColor="White" >

                <Columns>
                    <asp:TemplateField HeaderText="Serial No">
                        <ItemTemplate>
                            No.<%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="department" HeaderText="Department" SortExpression="department" />
                    <asp:BoundField DataField="course" HeaderText="Course" SortExpression="course" />
                    <asp:BoundField DataField="rollno" HeaderText="Roll No" SortExpression="rollno" />
                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                    <asp:BoundField DataField="email" HeaderText="Email ID" SortExpression="email" />
                    <asp:BoundField DataField="phone" HeaderText="Phone No" SortExpression="phone" />
                    <asp:BoundField DataField="tenth" HeaderText="10th %" SortExpression="tenth" />
                    <asp:BoundField DataField="tweleve" HeaderText="12th %" SortExpression="tweleve" />
                    <asp:BoundField DataField="graduation" HeaderText="Graduation %" SortExpression="graduation" />
                    <asp:BoundField DataField="gradback" HeaderText="Backlogs" SortExpression="gradback" />
                   <%-- <asp:BoundField DataField="postgraduation" HeaderText="postgraduation" SortExpression="postgraduation" />
                    <asp:BoundField DataField="postgradback" HeaderText="postgradback" SortExpression="postgradback" />--%>
                </Columns>
                <HeaderStyle BackColor="#2E3C59" Font-Size="Large" ForeColor="White" />

            </asp:GridView>
            
           <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NetDomainConnectionString %>" SelectCommand="SELECT [department], [course], [rollno], [name], [email], [phone], [tenth], [tweleve], [graduation], [gradback] FROM [acedemic] WHERE (([course] = @course) AND ([department] = @department) AND ([gradback] &lt;= @gradback) AND ([graduation] &gt;= @graduation) AND ([tenth] &gt;= @tenth) AND ([tweleve] = @tweleve))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlcourse" Name="course" PropertyName="SelectedItem" Type="String" />
                    <asp:ControlParameter ControlID="ddldepartment" Name="department" PropertyName="SelectedItem" Type="String" />
                    <asp:ControlParameter ControlID="tbbacklogs" Name="gradback" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="tbgraduationpercentage" Name="graduation" PropertyName="Text" Type="Int64" />
                    <asp:ControlParameter ControlID="tbtenth" Name="tenth" PropertyName="Text" Type="Int64" />
                    <asp:ControlParameter ControlID="tbtweleve" Name="tweleve" PropertyName="Text" Type="Int64" />
                </SelectParameters>
            </asp:SqlDataSource>--%>
            
        </asp:Panel>
        <br />
        <br />
    </div>
</asp:Content>

