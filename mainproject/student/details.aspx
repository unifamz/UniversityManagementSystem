<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.master" AutoEventWireup="true" CodeFile="details.aspx.cs" Inherits="student_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   <%-- <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- CSS -->
    <link href="~/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />

    <!--Scripts-->
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <asp:Panel ID="plsearch" runat="server" BorderStyle="Ridge">
            <div class="row">
                <div class="col-md-2">
                    <h2>Student:</h2>
                </div>
                <div class="col-md-2">
                    <h3>Roll No.</h3>
                </div>
                <div class="col-md-2">
                    <asp:TextBox ID="tbroll" runat="server" Style="vertical-align: bottom" CssClass="form-control" placeholder="Roll No" ></asp:TextBox>
                </div>
                <div class="col-md-1">
                    <h4>OR</h4>
                </div>
                <div class="col-md-1">
                    <h3>Name</h3>
                </div>
                <div class="col-md-2">
                    <asp:TextBox ID="tbname" runat="server" CssClass="form-control" placeholder="Name" ></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="btn btn-danger" OnClick="btnsearch_Click" />
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="plstudentlist" runat="server" BorderStyle="Ridge" Visible="false">
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="gvstudentlist" runat="server" AutoGenerateColumns="False" Width="100%" HeaderStyle-Font-Size="Large" HeaderStyle-BackColor="#2E3C59" HeaderStyle-ForeColor="White" OnRowDataBound="gvstudentlist_RowDataBound" OnSelectedIndexChanged="gvstudentlist_SelectedIndexChanged">
                        <Columns>
                            <asp:TemplateField HeaderText="Serial No">
                                <ItemTemplate>
                                    No. <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="roll" HeaderText="Roll No" SortExpression="roll" />
                            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                            <asp:BoundField DataField="email" HeaderText="Email ID" SortExpression="email" />
                            <asp:BoundField DataField="phone" HeaderText="Contact No" SortExpression="phone" />
                            <asp:ButtonField Text="Show" CommandName="Select" ItemStyle-Width="60" />
                        </Columns>
                        <HeaderStyle BackColor="#2E3C59" Font-Size="Large" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NetDomainConnectionString %>" SelectCommand="SELECT [roll], [name], [email], [phone] FROM [student] ">
                        <%-- <SelectParameters>
                           <asp:ControlParameter ControlID="tbname"  Name="name" PropertyName="Text" Type="String" />
                       </SelectParameters>--%>
                    </asp:SqlDataSource>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="plgrid" runat="server" BorderStyle="Ridge" Visible="false">
            <div class="row">
                <div class="col-md-4">
                    <asp:Image ID="imgphoto" runat="server" style="margin-top:300px; margin-left:100px" Height="400px" Width="200px" />
                </div>
                <div class="col-md-8" style="border-left-style: groove">
                    <form role="form">
                        <div class="form-group" style="border-bottom-style: groove; text-align: center; height: 60px">
                            <asp:Label ID="lbname" runat="server" CssClass="col-md-8" Font-Underline="true" Style="font-size: xx-large; color: red; font-style: italic"></asp:Label>

                        </div>
                        <br />
                        <br />

                        <div class="form-group">
                            <asp:Label ID="lbroll" Text="Roll No.:-" runat="server" CssClass="col-md-3" Style="font-size: larger; color: black;"></asp:Label>
                            <asp:Label ID="lbrollshow" runat="server" CssClass="col-md-5" Style="font-size: x-large; color: red; font-style: normal"></asp:Label>
                        </div>
                        <br />
                        <br />

                        <div class="form-group">
                            <asp:Label ID="Label1" Text="Contact Number:-" runat="server" CssClass="col-md-3" Style="font-size: larger; color: black;"></asp:Label>
                            <asp:Label ID="lbcontact" runat="server" CssClass="col-md-5" Style="font-size: x-large; color: red; font-style: normal"></asp:Label>
                        </div>
                        <br />
                        <br />

                        <div class="form-group">
                            <asp:Label ID="Label3" Text="Email ID" runat="server" CssClass="col-md-3" Style="font-size: larger; color: black;"></asp:Label>
                            <asp:Label ID="lbemail" runat="server" CssClass="col-md-5" Style="font-size: x-large; color: red; font-style: normal"></asp:Label>
                        </div>
                        <br />
                        <br />

                        <div class="form-group">
                            <asp:Label ID="Label5" Text="Gender:-" runat="server" CssClass="col-md-3" Style="font-size: larger; color: black;"></asp:Label>
                            <asp:Label ID="lbgender" runat="server" CssClass="col-md-5" Style="font-size: x-large; color: red; font-style: normal"></asp:Label>
                        </div>
                        <br />
                        <br />

                        <div class="form-group">
                            <asp:Label ID="Label7" Text="Address:-" runat="server" CssClass="col-md-3" Style="font-size: larger; color: black;"></asp:Label>
                            <asp:Label ID="lbaddress" runat="server" CssClass="col-md-5" Style="font-size: x-large; color: red; font-style: normal"></asp:Label>
                        </div>
                        <br />
                        <br />
                        <br />
                        <br />

                        <div class="form-group">
                            <asp:Label ID="Label9" Text="State:-" runat="server" CssClass="col-md-3" Style="font-size: larger; color: black;"></asp:Label>
                            <asp:Label ID="lbstate" runat="server" CssClass="col-md-5" Style="font-size: x-large; color: red; font-style: normal"></asp:Label>
                        </div>
                        <br />
                        <br />

                        <div class="form-group">
                            <asp:Label ID="Label11" Text="City:-" runat="server" CssClass="col-md-3" Style="font-size: larger; color: black;"></asp:Label>
                            <asp:Label ID="lbcity" runat="server" CssClass="col-md-5" Style="font-size: x-large; color: red; font-style: normal"></asp:Label>
                        </div>
                        <br />
                        <br />

                        <div class="form-group">
                            <asp:Label ID="Label13" Text="PinCode" runat="server" CssClass="col-md-3" Style="font-size: larger; color: black;"></asp:Label>
                            <asp:Label ID="lbpincode" runat="server" CssClass="col-md-5" Style="font-size: x-large; color: red; font-style: normal"></asp:Label>
                        </div>
                        <br />
                        <br />

                        <div class="form-group">
                            <asp:Label ID="Label15" Text="BirthDay:-" runat="server" CssClass="col-md-3" Style="font-size: larger; color: black;"></asp:Label>
                            <asp:Label ID="lbbirthday" runat="server" CssClass="col-md-5" Style="font-size: x-large; color: red; font-style: normal"></asp:Label>
                        </div>
                        <br />
                        <br />

                        <div class="form-group">
                            <asp:Label ID="Label17" Text="Department:-" runat="server" CssClass="col-md-3" Style="font-size: larger; color: black;"></asp:Label>
                            <asp:Label ID="lbdepartment" runat="server" CssClass="col-md-5" Style="font-size: x-large; color: red; font-style: normal"></asp:Label>
                        </div>
                        <br />
                        <br />

                        <div class="form-group">
                            <asp:Label ID="Label19" Text="Course" runat="server" CssClass="col-md-3" Style="font-size: larger; color: black;"></asp:Label>
                            <asp:Label ID="lbcourse" runat="server" CssClass="col-md-5" Style="font-size: x-large; color: red; font-style: normal"></asp:Label>
                        </div>
                        <br />
                        <br />
                    </form>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>

