<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.master" AutoEventWireup="true" CodeFile="attendence.aspx.cs" Inherits="student_attendence" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <script>
        $(function () {
            $("#" + '<%=tbstartdate.ClientID%>').datepicker({ dateFormat: 'yy-mm-dd' });
          $("#" + '<%=tbenddate.ClientID%>').datepicker({ dateFormat: 'yy-mm-dd' });
      });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <br />

    <div class="container-fluid">
        <div class="row">
            <h3 class="col-md-2">Roll No:-</h3>
            <div class="col-md-10">
                <asp:TextBox ID="tbroll" runat="server" placeholder="Enter Roll No. after press enter..." CssClass="form-control" OnTextChanged="tbroll_TextChanged" AutoPostBack="true"></asp:TextBox>
            </div>
        </div>

        <br />
        <br />

        <div class="row">
            <h3 class="col-md-2">Subject:-</h3>
            <div class="col-md-10">
                <asp:DropDownList ID="ddlsubject" runat="server" CssClass="form-control">
                    <asp:ListItem Text="---Select Subject---" Value="0" Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <br />
        <br />

        <div class="row">
            <h3 class="col-md-2">Date:-</h3>
            <div class="col-md-5">
                <asp:TextBox ID="tbstartdate" runat="server" placeholder="Start Date" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-5">
                <asp:TextBox ID="tbenddate" runat="server" placeholder="End Date" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

        <br />
        <br />
        <br />

        <div class="row">
            <div class="col-md-6"></div>
            <div class="col-md-6">
                <asp:Button ID="btnshow" runat="server" CssClass="btn btn-info" Text="Show Attendence" Font-Size="Medium" Height="65px" Width="238px" OnClick="btnshow_Click" />
            </div>
        </div>

        <br />
        <br />

        <asp:Panel ID="plattendence" runat="server" BorderStyle="Ridge">

            <br />

            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="gvattendence" runat="server" AutoGenerateColumns="false" Width="100%" HeaderStyle-Font-Size="Large" HeaderStyle-BackColor="#2E3C59" HeaderStyle-ForeColor="White" OnRowDataBound="gvattendence_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="Serial No">
                                <ItemTemplate>
                                    No.<%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%-- <asp:BoundField DataField="date" HeaderText="Date" SortExpression="Date" />--%>
                            <asp:TemplateField HeaderText="Date">
                                <ItemTemplate>
                                    <asp:Label ID="lbdate" runat="server" Text='<%# Eval("Date") %>' ></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Present">
                                <ItemTemplate>
                                    <asp:Label ID="lblpresent" runat="server" Text='<%# Eval("present") %>' Visible="false" ></asp:Label>
                                    <asp:RadioButton ID="rbpresent" runat="server" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Absent">
                                <ItemTemplate>
                                    <asp:RadioButton ID="rbabsent" runat="server" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>

