<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/teacher.master" AutoEventWireup="true" CodeFile="tassignment.aspx.cs" Inherits="teacher_tassignment" %>

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
        <asp:Panel ID="plfillform" runat="server" BorderStyle="Ridge">
            <div style="height: 60px"></div>
            <form role="form">
                <div class="form-group">
                    <asp:Label ID="lbteachername" runat="server" for="teachername" Text="Teacher Name:-" CssClass="col-md-3"></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbteachername" runat="server" CssClass="form-control" placeholder="Teacher Name" autofocus required></asp:TextBox>
                    </div>
                </div>
                <br />
                <br />

                <div class="form-group">
                    <asp:Label ID="lbassignment" runat="server" for="assignment" Text="Assignment:-" CssClass="col-md-3"></asp:Label>
                    <div class="col-md-9">
                        <asp:FileUpload ID="flupassignment" runat="server" /></span>
                    </div>
                </div>
                <br />
                <br />

                <div class="form-group">
                    <asp:Label ID="lbassignmentdate" runat="server" for="assignmentdate" Text="Assignment Date:-" CssClass="col-md-3"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlassignmentdate" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlassignmentmonth" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlassignmentyear" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <br />
                <br />

                <div class="form-group">
                    <asp:Label ID="lbsubmissiondate" runat="server" for="submissiondate" Text="Submission Date:-" CssClass="col-md-3"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlsubmissiondate" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlsubmissionmonth" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlsubmissionyear" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <br />
                <br />

                <div class="form-group">
                    <asp:Label ID="lbassignmentnumber" runat="server" for="assignmentno" Text="Assignment No.:-" CssClass="col-md-3"></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbassignmentnumber" runat="server" CssClass="form-control" placeholder="Assignemnt Number" required></asp:TextBox>
                    </div>
                </div>
                <br />
                <br />

                <div class="form-group">
                    <asp:Label ID="lbsubject" runat="server" for="subject" Text="Subject:-" CssClass="col-md-3"></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbsubject" runat="server" CssClass="form-control" placeholder="Subject" required></asp:TextBox>
                    </div>
                </div>
                <br />
                <br />
                <br />
                <br />

                <div class="row">
                    <div class="col-md-6"></div>
                    <div class="col-md-6">
                        <asp:Button CssClass="btn btn-info" ID="btnsubmit" runat="server" Text="Submit" Font-Size="X-Large" Height="72px" Width="243px" Font-Bold="True" OnClick="btnsubmit_Click" />
                    </div>
                </div>
            </form>
        </asp:Panel>
        <asp:Panel ID="plgrid" runat="server" BorderStyle="Ridge">
            <div class="row">
                <div class="col-md-12">
                    <asp:Button ID="btngrid" runat="server" Text="Show List" CssClass="btn btn-danger" Font-Size="X-Large" Height="72px" Width="243px" Font-Bold="True" OnClick="btngrid_Click" formnovalidate />
                </div>
                <br />
                <br />

                <div class="col-md-12">
                    <asp:GridView ID="gvshowlist" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" Width="100%" HeaderStyle-Font-Size="Large" HeaderStyle-BackColor="#2E3C59" HeaderStyle-ForeColor="White" OnSelectedIndexChanged="gvshowlist_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowSelectButton="true" SelectText="Delete" ItemStyle-Width="60" />
                            <asp:BoundField DataField="id" HeaderText="ID"
                                ReadOnly="True" SortExpression="id" InsertVisible="False"></asp:BoundField>
                            <asp:BoundField DataField="number" HeaderText="Assignment Number"
                                SortExpression="number"></asp:BoundField>
                            <asp:BoundField DataField="subject" HeaderText="Subject"
                                SortExpression="subject"></asp:BoundField>
                            <asp:BoundField DataField="adate" HeaderText="Assignment Date"
                                SortExpression="adate"></asp:BoundField>
                            <asp:BoundField DataField="submit" HeaderText="Submission Date"
                                SortExpression="submit"></asp:BoundField>
                            <asp:BoundField DataField="teacher" HeaderText="Teacher Name"
                                SortExpression="teacher"></asp:BoundField>
                            <asp:BoundField DataField="filename" HeaderText="Filename"
                                SortExpression="filename"></asp:BoundField>
                            <asp:BoundField DataField="ext" HeaderText="Extension" SortExpression="ext" />
                        </Columns>

                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                        ConnectionString="<%$ ConnectionStrings:NetDomainConnectionString %>"
                        SelectCommand="SELECT [id], [number], [subject], [adate], [submit], [teacher], [filename], [ext] FROM [assignment]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                        ConnectionString="<%$ ConnectionStrings:con %>"
                        ProviderName="<%$ ConnectionStrings:con.ProviderName %>"
                        SelectCommand="SELECT [id], [number], [subject], [adate], [submit], [teacher], [filename], [ext] FROM [assignment]"></asp:SqlDataSource>
                </div>
            </div>

        </asp:Panel>
        <div style="height:60px"></div>
    </div>

</asp:Content>

