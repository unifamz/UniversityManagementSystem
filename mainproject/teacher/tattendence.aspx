<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/teacher.master" AutoEventWireup="true" CodeFile="tattendence.aspx.cs" Inherits="teacher_tattendence" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        
        <br />
        <br />

        <div class="row">
            <h3 class="col-md-3">Teacher ID:-</h3>
            <div class="col-md-9">
                <asp:TextBox ID="tbteacherid" runat="server" placeholder="Teacher ID" CssClass="form-control" required autofocus></asp:TextBox>
            </div>
        </div>

        <br />
        <br />

        <div class="row">
            <h3 class="col-md-3">Password:-</h3>
            <div class="col-md-6">
                <asp:TextBox ID="tbpassword" runat="server" placeholder="Password" TextMode="Password" CssClass="form-control" required></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:Button ID="btncheck" runat="server" CssClass="btn btn-danger" Text="Check" Font-Size="Medium" Width="186px" OnClick="btncheck_Click" />
            </div>
        </div>

        <br />
        <br />

        <div class="row">
            <h3 class="col-md-3">Name:-</h3>
            <asp:Label ID="lbname" runat="server" CssClass="col-md-9" style="color:red; font-size:x-large; font-family:Arial"></asp:Label>
        </div>

        <br />
        <br />

        <asp:Panel ID="plshowlist" runat="server" BorderStyle="Ridge">
            
            <br />

            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="gvteacherlist" runat="server" AutoGenerateColumns="False" Width="100%" HeaderStyle-Font-Size="Large" HeaderStyle-BackColor="#2E3C59" HeaderStyle-ForeColor="White" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="gvteacherlist_SelectedIndexChanged">
                        <Columns>
                            <asp:TemplateField HeaderText="Serial No">
                                <ItemTemplate>
                                    No.<%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="department" HeaderText="Department" SortExpression="department" />
                            <asp:BoundField DataField="course" HeaderText="Course" SortExpression="course" />
                            <asp:BoundField DataField="subject" HeaderText="Subject" SortExpression="subject" />
                            <asp:BoundField DataField="day" HeaderText="Day" SortExpression="day" />
                            <asp:BoundField DataField="lectureno" HeaderText="Lecture No" SortExpression="lectureno" />
                            <asp:BoundField DataField="timing" HeaderText="Timing" SortExpression="timing" />
                            <asp:BoundField DataField="roomno" HeaderText="Room No" SortExpression="roomno" />
                            <asp:BoundField DataField="class" HeaderText="Section" SortExpression="class" />
                            <asp:CommandField ShowSelectButton="true" HeaderText="Select" SelectText="Show" ItemStyle-Font-Underline="true" />
                        </Columns>
                        <HeaderStyle BackColor="#2E3C59" Font-Size="Large" ForeColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NetDomainConnectionString %>" SelectCommand="SELECT [department], [course], [subject], [day], [lectureno], [timing], [roomno], [class] FROM [teachertimetable] WHERE ([name] = @name)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lbname" Name="name" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>

            <br />

        </asp:Panel>

        <br />
        <br />

        <asp:Panel ID="plstudentlist" runat="server" BorderStyle="Ridge">
            <br />
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="gvstudentlist" runat="server" AutoGenerateColumns="False" Width="100%" HeaderStyle-Font-Size="Large" HeaderStyle-BackColor="#2E3C59" HeaderStyle-ForeColor="White"  OnRowDataBound="gvstudentlist_RowDataBound">

                        <Columns>
                            <asp:TemplateField HeaderText="Serial No">
                                <ItemTemplate>
                                    No. <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="roll" HeaderText="Roll No" SortExpression="roll" />
                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                            <asp:TemplateField >
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbattendence" runat="server" style="border-radius:2px" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" /> 
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#2E3C59" Font-Size="Large" ForeColor="White" />
                    </asp:GridView>
                    <br />
                    <br />
                    <br />

                    <div class="row">
                        <div class="col-md-6"></div>
                        <div class="col-md-6">
                            <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-info" Text="Submit" Font-Size="Medium" Height="82px" OnClick="btnsubmit_Click" Width="200px" />
                        </div>
                    </div>
                    
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>

