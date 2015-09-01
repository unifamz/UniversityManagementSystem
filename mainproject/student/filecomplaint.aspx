<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.master" AutoEventWireup="true" CodeFile="filecomplaint.aspx.cs" Inherits="student_filecomplaint" %>

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
        <asp:Panel ID="plfilecomplaint" runat="server" BorderStyle="Ridge">
            
        <div class="row" style="height:70px; text-align:center">
            <asp:Label ID="lbhead" runat="server" Text="Complaint File" style="font-size:x-large"></asp:Label>
        </div>
        <form role="form">
            <div class="form-group">
                <asp:Label ID="lbroll" CssClass="col-md-3" for="roll" runat="server" Text="Roll No:-"></asp:Label>
                <div class="col-md-9">
                    <asp:TextBox ID="tbroll" runat="server" CssClass="form-control" placeholder="Roll Number" autofocus required></asp:TextBox>
                </div>
                
            </div>
            <br />
            <br />

            <div class="form-group">
                <asp:Label ID="lbpassword" CssClass="col-md-3" for="roll" runat="server" Text="Password:-"></asp:Label>
                <div class="col-md-6">
                    <asp:TextBox ID="tbpassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="Password" required></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:Button ID="btnshow" CssClass="btn btn-danger" runat="server" Text="Check" OnClick="btnshow_Click" formnovalidate />
                </div>
            </div>
            <br />
            <br />

            <div class="form-group">
                <asp:Label ID="lbname" CssClass="col-md-3" for="name" runat="server" Text="Student Name:-"></asp:Label>
                <div class="col-md-9">
                    <asp:Label ID="lbnameshow" runat="server" BorderStyle="Ridge" Style="font-size: larger; font-style: italic; color: red"></asp:Label>
                </div>
            </div>
            <br />
            <br />

            <div class="form-group">
                <asp:Label ID="lbroom" CssClass="col-md-3" for="room" runat="server" Text="Room No:-"></asp:Label>
                <div class="col-md-9">
                    <asp:Label ID="lbroomshow" runat="server" BorderStyle="Ridge" Style="font-size: larger; font-style: italic; color: red"></asp:Label>
                </div>
            </div>
            <br />
            <br />

            <div class="form-group">
                <asp:Label ID="lbcomplaintdate" CssClass="col-md-3" for="complaintdate" runat="server" Text="Complaint Date"></asp:Label>
                <div class="col-md-9">
                    <asp:Label ID="lbcomplaintdateshow" runat="server" BorderStyle="Ridge" Style="font-size: larger; font-style: italic; color: red"></asp:Label>
                </div>
            </div>
            <br />
            <br />

            <div class="form-group">
                <asp:Label ID="lblcomplaint" CssClass="col-md-3" for="complaint" runat="server" Text="Complaint:-"></asp:Label>
                <div class="col-md-9">
                    <asp:TextBox ID="tbcomplaint" runat="server" CssClass="form-control" placeholder="Write Complaint" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnsubmit" runat="server" class="btn btn-info " Text="Complaint" Font-Size="X-Large" Height="72px" Width="243px" Font-Bold="True" />
                </div>
            </div>
        </form>
        </asp:Panel>

        <asp:Panel ID="plshowcomplaint" runat="server" BorderStyle="Ridge">
            <div class="row">
                <div class="col-md-12">
                    <asp:Button ID="btnshowgrid" Text="Complaint List" runat="server" Font-Size="Large" Height="72px" Width="243px" Font-Bold="True" CssClass="btn btn-danger" OnClick="btnshowgrid_Click" formnovalidate />
                </div>
                <div class="col-md-12">
                    <asp:GridView ID="gvcomplaintlist" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="description" AutoGenerateColumns="False" Width="100%" HeaderStyle-Font-Size="Large" HeaderStyle-BackColor="#2E3C59" HeaderStyle-ForeColor="White" OnSelectedIndexChanged="gvcomplaintlist_SelectedIndexChanged" >

                        <Columns>
                            <asp:TemplateField HeaderText="Serial No">
                                <ItemTemplate>
                                    No. <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="name" HeaderText="Student Name" SortExpression="name" />
                            <asp:BoundField DataField="room" HeaderText="Room No" SortExpression="room" />
                            <asp:BoundField DataField="date" HeaderText="Complaint Date" SortExpression="date" />
                            <asp:BoundField DataField="description"  ItemStyle-Wrap="true" HeaderText="Complaint Details" SortExpression="complaint" />
                            <asp:TemplateField HeaderText="Complaint Fulfill">
                                <ItemTemplate>
                                    <asp:TextBox ID="tbcomplaintfullfill" runat="server" placeholder="Yes or No" Visible='<%# Eval("complaintfulfill") =="" %>' CssClass="form-control" style="width:200px; background-color:silver; color:black"></asp:TextBox>
                                    <asp:Label runat="server" ID="lblcomplaintfulfill" Text='<%# Eval("complaintfulfill")%>' Visible='<%# Eval("complaintfulfill") !="" %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Completion Date">
                                <ItemTemplate>
                                    <asp:TextBox ID="tbcompletiondate" runat="server" placeholder="eg. 12/april/2015" Visible='<%# Eval("completiondate")=="" %>' CssClass="form-control" style="width:200px; background-color:silver; color:black"></asp:TextBox>
                                    <asp:Label runat="server" ID="lblcompletiondate" Text='<%# Eval("completiondate") %>' Visible='<%#Eval("completiondate")!="" %>'></asp:Label>                                

                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowSelectButton="true"  SelectText="Submit" ItemStyle-CssClass="btn btn-info" />
                        </Columns>
                        <HeaderStyle BackColor="#2E3C59" Font-Size="Large" ForeColor="White" />

                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NetDomainConnectionString %>" SelectCommand="SELECT [name], [room], [date], [description],[complaintfulfill],[completiondate] FROM [complaint] ">
                        <%--<%--<SelectParameters>
                            <asp:ControlParameter ControlID="lbroomshow" Name="room" PropertyName="Text" Type="Int32" />
                        </SelectParameters>--%>
                    </asp:SqlDataSource>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>

