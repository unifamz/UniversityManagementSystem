<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="acourses.aspx.cs" Inherits="admin_acourses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript">
        function divexpandcollapse(divname) {
            var div = document.getElementById(divname);
            var img = document.getElementById('img' + divname);

            if (div.style.display == "none") {
                div.style.display = "inline";
                img.src = "../images/minus.gif";
            }
            else {
                div.style.display = "none";
                img.src = "../images/plus.gif";
            }
        }
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container" style="margin: 10px" id="divmain" runat="server">

        <div class="row" style="text-align: center">
            <h2>Assign Courses </h2>
        </div>

        <br />
        <br />

        <form role="form">

            <div class="form-group">
                <asp:Label ID="lbdepartment" runat="server" for="department" Text="Department:-" class="col-md-2"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="tbdepartment" runat="server" CssClass="form-control" placeholder="Enter Department eg. B.Tech or Law or Pharmacy etc..." autofocus required></asp:TextBox>
                </div>
            </div>

            <br />
            <br />

            <div class="form-group">
                <asp:Label ID="lbcourse" runat="server" for="course" Text="Course:-" class="col-md-2"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="tbcourse" runat="server" CssClass="form-control" placeholder="Enter Course eg. Computer Science & Engineering or Civil Engineering etc..."></asp:TextBox>
                </div>
            </div>

            <br />
            <br />

            <div class="form-group">
                <asp:Label ID="lbtotalseats" runat="server" for="totalseats" class="col-md-2" Text="Total Seats:-"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="tbtotalseats" runat="server" CssClass="form-control" placeholder="Enter Total no of seats in course eg. 120 etc..."></asp:TextBox>
                </div>
            </div>

            <br />
            <br />

            <div class="form-group">
                <asp:Label ID="lbsection" runat="server" for="sections" Text="Section:-" class="col-md-2"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="tbsections" runat="server" CssClass="form-control" placeholder="Enter Number of Sections" required AutoPostBack="True" OnTextChanged="tbsections_TextChanged"></asp:TextBox>
                </div>
            </div>
            <br />
            <br />

            <div class="form-group">
                <asp:Label ID="lbstudentpersection" runat="server" for="address" Text="Students/per Section:-" class="col-md-2"></asp:Label>
                <div class="col-md-10">
                    <asp:Label ID="lbstudentpersection1" runat="server" for="studentsection" style="color:Red; font-size:x-large"></asp:Label>
                                    </div>
            </div>

            <br />
            <br />

            <asp:Panel ID="plroll" runat="server" BorderStyle="Ridge">
                <br />

                <div class="form-group">
                    <h3 class="col-md-2">Section:-</h3>
                    <div class="col-md-10">
                        <asp:Label ID="lblsection" runat="server" for="section" Style="font-size: x-large; color: red; font-family: Arial"></asp:Label>
                    </div>
                </div>

                <br />
                <br />
                <br />

                <div class="form-group">
                    <h3 class="col-md-2">Roll No.<span style="color: brown">(Range)</span>:-</h3>
                    <div class="col-md-10">
                        <asp:TextBox ID="tbrangeroll" runat="server" placeholder="Roll No Range eg. 1150157 - 1150210" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <br />
                <br />
                <br />

                <div class="form-group">
                    <div class="col-md-6"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btninsert" Text="Insert" runat="server" CssClass="btn btn-danger" Font-Size="Medium" OnClick="btninsert_Click" Width="158px" formnovalidate />
                    </div>
                </div>

                <br />
                <br />

            </asp:Panel>

            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-info" Font-Size="Large" Height="61px" Width="169px" OnClick="btnsubmit_Click" />
                </div>
            </div>
        </form>
    </div>

    <div class="container-fluid">



        <br />
        <br />
        <asp:Panel ID="plgridview" runat="server" BorderStyle="Ridge">
            <asp:GridView ID="gvlist" runat="server" AutoGenerateColumns="False" Width="100%" HeaderStyle-Font-Size="Large" HeaderStyle-BackColor="#2E3C59" HeaderStyle-ForeColor="White" DataSourceID="SqlDataSource1" OnRowDataBound="gvlist_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Serial No">
                        <ItemTemplate>
                            No. <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                        <ItemTemplate>
                            <a href="JavaScript:divexpandcollapse('div<%#Container.DataItemIndex+1 %>'); ">
                                <img id="imgdiv<%#Container.DataItemIndex+1 %>" width="9px" border="0" src="../images/plus.gif" />
                                &nbsp; <%#Container.DataItemIndex+1 %>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="department" HeaderText="Department" SortExpression="department" />
                    <asp:BoundField DataField="course" HeaderText="Course" SortExpression="course" />
                    <asp:BoundField DataField="seats" HeaderText="Total Seats" SortExpression="seats" />
                    <asp:BoundField DataField="section" HeaderText="Sections" SortExpression="section" />
                    <asp:BoundField DataField="studentssection" HeaderText="Students/ per Section" SortExpression="studentssection" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <tr>
                                <td colspan="100%">
                                    <div id="div<%#Container.DataItemIndex+1 %>" style="display: none; position: relative; left: 15px; overflow: auto">
                                        <asp:GridView ID="gvchildlist" runat="server" EmptyDataText="no record" AutoGenerateColumns="false" BorderStyle="Double" BorderColor="#df5015" GridLines="None" Width="250px">
                                            <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
                                            <RowStyle BackColor="#E1E1E1" />
                                            <Columns>
                                                <asp:TemplateField HeaderText="Serial No">
                                                    <ItemTemplate>
                                                        No.<%#Container.DataItemIndex+1 %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="section" HeaderText="Section" SortExpression="section" />
                                                <asp:BoundField DataField="rangeroll" HeaderText="Roll No(Range)" SortExpression="rangeroll" />
                                            </Columns>
                                            <AlternatingRowStyle BackColor="White" />
                                            <HeaderStyle BackColor="#df5015" Font-Bold="true" ForeColor="White" />
                                        </asp:GridView>
                                    </div>
                                </td>
                            </tr>

                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#2E3C59" Font-Size="Large" ForeColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NetDomainConnectionString %>" SelectCommand="SELECT [department], [course], [seats], [section], [studentssection] FROM [courses]"></asp:SqlDataSource>
            <%--<asp:SqlDataSource ID="sqldb1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:universityschemaConnectionString %>" 
                SelectCommand="SELECT * FROM [acedemic]"></asp:SqlDataSource>--%>
        </asp:Panel>

    </div>

    <div style="height: 50px"></div>

</asp:Content>

