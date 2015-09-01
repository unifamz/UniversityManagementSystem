<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.master" AutoEventWireup="true" CodeFile="assignment.aspx.cs" Inherits="student_assignment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div style="height: 60px"></div>
        <asp:Panel ID="plgridview" runat="server" BorderStyle="Ridge">
            <div class="row">
                <div class="col-md-12" style="text-align:center">
                    <asp:Button ID="btngridview" runat="server" Text="Show Assignment" CssClass="btn btn-danger" Font-Size="X-Large" Height="72px" Width="243px" Font-Bold="True" OnClick="btngridview_Click" />
                </div>
                <div class="col-md-12">
                    <asp:GridView ID="gvassignment" Visible="false" runat="server" AutoGenerateColumns="False" Width="100%" HeaderStyle-Font-Size="Large" HeaderStyle-BackColor="#2E3C59" HeaderStyle-ForeColor="White" DataKeyNames="id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="gvassignment_SelectedIndexChanged">

                        <Columns>
                            <asp:CommandField ShowSelectButton="true" HeaderText="Download" SelectText="Download" />
                            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="number" HeaderText="Assignment Number" SortExpression="number" />
                            <asp:BoundField DataField="subject" HeaderText="Subject" SortExpression="subject" />
                            <asp:BoundField DataField="adate" HeaderText="Assignment date" SortExpression="adate" />
                            <asp:BoundField DataField="submit" HeaderText="Submission Date" SortExpression="submit" />
                            <asp:BoundField DataField="teacher" HeaderText="Teacher Name" SortExpression="teacher" />
                            <asp:BoundField DataField="filename" HeaderText="Filename" SortExpression="filename" />
                            <asp:BoundField DataField="ext" HeaderText="Extension" SortExpression="ext" />
                        </Columns>
                        <HeaderStyle BackColor="#2E3C59" Font-Size="Large" ForeColor="White" />

                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NetDomainConnectionString %>" SelectCommand="SELECT * FROM [assignment] order by adate asc"></asp:SqlDataSource>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>

