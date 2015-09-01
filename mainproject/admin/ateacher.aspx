<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ateacher.aspx.cs" Inherits="admin_ateacher" %>

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
    <div class="container-fluid bg-success">
        <div style="height: 20px; margin-left: 200px;"></div>
        <asp:Panel ID="plassignroll" runat="server" BorderStyle="Ridge" BorderColor="#e0dcdf">
            <div class="row">
                <div class="col-md-12">
                    <asp:Label ID="Label1" CssClass="label control-label" runat="server" Text="Teacher" Style="text-align: center; font-size: larger; color: black; font-family: Arial; margin-left: 500px;" Font-Underline="true"></asp:Label>
                </div>
                <br />
                <br />
                <br />
                <br />
                <div class="col-md-3">
                    <asp:Label ID="lbdesignation" runat="server" Text="Designation:-" Style="font-size: large"></asp:Label>
                </div>
                <div class="col-md-9">
                    <asp:DropDownList ID="ddldesignation" runat="server" CssClass="form-control" required autofocus>
                        <asp:ListItem Selected="True" Text="---Select Designation---" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Teacher" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Hod" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Dean" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Principal" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Warden" Value="5"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <br /><br />
                <div class="col-md-3">
                    <asp:Label ID="lbteacherid" runat="server" Text="Teacher ID:-" Style="font-size: large"></asp:Label>
                </div>
                <div class="col-md-9">
                    <asp:TextBox ID="tbteacherid" runat="server" CssClass="form-control" placeholder="Teacher ID" required></asp:TextBox>
                </div>
                <br />
                <br />
                <div class="col-md-3">
                    <asp:Label ID="lbname" runat="server" Text="Teacher Name:-" Style="font-size: large"></asp:Label>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="tbfirstname" runat="server" CssClass="form-control" placeholder="First Name" required></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="tbmiddlename" runat="server" CssClass="form-control" placeholder="Middle Name"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="tblastname" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                </div>
                <br />
                <br />
                <div class="col-md-3">
                    <asp:Label ID="lbpassword" runat="server" Text="Password:-" Style="font-size: large"></asp:Label>
                </div>
                <div class="col-md-9">
                    <asp:TextBox ID="tbpassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password" required></asp:TextBox>
                </div>
                <br />
                <br />

                <div class="col-md-3">
                    <asp:Label ID="lbretypepassword" runat="server" Text="Retype Password:-" Style="font-size: large"></asp:Label>
                </div>
                <div class="col-md-9">
                    <asp:TextBox ID="tbretypepassword" runat="server" CssClass="form-control" placeholder="Retype Password" TextMode="Password" required></asp:TextBox>
                </div>
                <br />
                <br />
                <br />
                <br />
                <div class="col-md-5"></div>
                <div class="col-md-7">
                    <asp:Button ID="btnteacherid" runat="server" Text="Assign" CssClass="btn btn-info" Height="61px" Width="195px" OnClick="btnteacherid_Click" />
                </div>
            </div>
        </asp:Panel>
    </div>

    <div class="container-fluid bg-info">
        <asp:Panel ID="plshowstudent" runat="server" BorderStyle="Groove">
            <div class="row">
                <div class="col-md-12">
                     <asp:Button ID="btngridview" runat="server" Text="Show List" CssClass="btn btn-info" Height="61px" Width="195px"  formnovalidate OnClick="btngridview_Click"/>
                </div>
                <div class="col-md-12">
                    <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" Width="100%" HeaderStyle-Font-Size="Large" HeaderStyle-BackColor="#2E3C59" HeaderStyle-ForeColor="White" DataSourceID="SqlDataSource1">
                        <Columns>

                            <asp:TemplateField HeaderText="Serial No">
                                <ItemTemplate>
                                    No. <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <%--<asp:TemplateField HeaderText="Roll No">
                                <ItemTemplate>
                                    <asp:Label ID="lbroll" runat="server" Text='<%#Eval("student_roll") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="lbname" runat="server" Text='<%#Eval("student_name") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Email ID">
                                <ItemTemplate>
                                    <asp:Label ID="lbemail" runat="server" Text='<%#Eval("student_email") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Contact No">
                                <ItemTemplate>
                                    <asp:Label ID="lbconact" runat="server" Text='<%#Eval("student_contact") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Birthdate">
                                <ItemTemplate>
                                    <asp:Label ID="lbbirthdate" runat="server" Text='<%#Eval("student_birthdate") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Department">
                                <ItemTemplate>
                                    <asp:Label ID="lbdepartment" runat="server" Text='<%#Eval("student_department") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Course">
                                <ItemTemplate>
                                    <asp:Label ID="lbcourse" runat="server" Text='<%#Eval("student_course") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <asp:Label ID="lbaddress" runat="server" Text='<%#Eval("student_address") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="State">
                                <ItemTemplate>
                                    <asp:Label ID="lbstate" runat="server" Text='<%#Eval("student_state") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="city">
                                <ItemTemplate>
                                    <asp:Label ID="lbcity" runat="server" Text='<%#Eval("student_city") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Pincode">
                                <ItemTemplate>
                                    <asp:Label ID="lbpincode" runat="server" Text='<%#Eval("student_pincode") %>' Visible="true"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:BoundField DataField="id1" HeaderText="Teacher ID" SortExpression="id" />
                            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                            <asp:BoundField DataField="email" HeaderText="Email ID" SortExpression="email" />
                            <asp:BoundField DataField="birthday" HeaderText="Birthdate" SortExpression="birthday" />
                            <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" />
                            <asp:BoundField DataField="sex" HeaderText="Gender" SortExpression="sex" />
                            <asp:BoundField DataField="designation" HeaderText="Designation" SortExpression="designation" />
                            <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                            <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                            <asp:BoundField DataField="pincode" HeaderText="PinCode" SortExpression="pincode" />
                        </Columns>
                        <HeaderStyle BackColor="#2E3C59" Font-Size="Large" ForeColor="White" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NetDomainConnectionString %>" SelectCommand="SELECT [id1], [name], [image], [email], [birthday], [phone], [sex], [designation], [address], [state], [city], [pincode] FROM [register]"></asp:SqlDataSource>

                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
