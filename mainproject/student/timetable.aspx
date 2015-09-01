<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.master" AutoEventWireup="true" CodeFile="timetable.aspx.cs" Inherits="student_timetable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <%--<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- CSS -->
    <link href="~/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <%--<link href="~/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />

    <!--Scripts-->
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>--%>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
   <div class="container-fluid">

        <br />
        <br />

        <div class="row">
            <h3 class="col-md-3">Department:-</h3>
            <div class="col-md-9">
                <asp:DropDownList ID="ddldepartment" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged" >
                    <asp:ListItem Text="---Select Department---" Selected="True" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <br />
        <br />
        <br />

        <div class="row">
            <h3 class="col-md-3">Course:-</h3>
            <div class="col-md-9">
                <asp:DropDownList ID="ddlcourse" runat="server" CssClass="form-control" AutoPostBack="true">
                    <asp:ListItem Text="---Select Course---" Selected="True" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <br />
        <br />
        <br />

        <div class="row">
            <h3 class="col-md-3">Semster:-</h3>
            <div class="col-md-9">
                <asp:DropDownList ID="ddlsemster" runat="server" CssClass="form-control" AutoPostBack="true">
                    <asp:ListItem Text="---Select Semster---" Value="0" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="First (1st)" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Second (2nd)" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Third (3rd)" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Fourth (4th)" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Fifth (5th)" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Sixth (6th)" Value="6"></asp:ListItem>
                    <asp:ListItem Text="Seventh (7th)" Value="7"></asp:ListItem>
                    <asp:ListItem Text="Eighth (8th)" Value="8"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <br />
        <br />
        <br />

        <div class="row">
            <h3 class="col-md-3">Section:-</h3>
            <div class="col-md-9">
                <asp:DropDownList ID="ddlsection" runat="server" CssClass="form-control" AutoPostBack="true">
                    <asp:ListItem Text="---Select Section---" Value="0" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="First (1st)" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Second (2nd)" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Third (3rd)" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Fourth (4th)" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Fifth (5th)" Value="5"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <br />
        <br />
        <br />

       <div class="row">
           <div class="col-md-6"></div>
           <div class="col-md-6">
               <asp:Button ID="btnshowgrid" runat="server" Text="Show Grid" Font-Size="Medium" CssClass="btn btn-primary" Height="66px" Width="185px" OnClick="btnshowgrid_Click" />
            </div>
       </div>

       <br />
       <br />
       <br />
       <br />

       <asp:Panel ID="plgrid" runat="server" BorderStyle="Ridge">

           <div class="row">
               <div class="col-md-12">
                   <asp:GridView ID="gvtimetable" runat="server" AutoGenerateColumns="False" Width="100%" HeaderStyle-Font-Size="Large" HeaderStyle-BackColor="#2E3C59" HeaderStyle-ForeColor="White" >

                       <Columns>
                           <%--<asp:TemplateField HeaderText="Serial No">
                               <ItemTemplate>
                                   No<%#Container.DataItemIndex+1 %>
                               </ItemTemplate>
                           </asp:TemplateField>--%>
                           <asp:BoundField DataField="day" HeaderText="Day" SortExpression="day" />
                           <asp:BoundField DataField="lectureno" HeaderText="Lecture No" SortExpression="lectureno" />
                           <asp:BoundField DataField="timing" HeaderText="Timing" SortExpression="timing" />
                           <asp:BoundField DataField="subject" HeaderText="Subject" SortExpression="subject" />
                           <asp:BoundField DataField="classroom" HeaderText="Classroom" SortExpression="classroom" />
                       </Columns>
                       <HeaderStyle BackColor="#2E3C59" Font-Size="Large" ForeColor="White" />

                   </asp:GridView>
                   
               </div>
           </div>

           <div class="row">
               <asp:GridView ID="gv2" runat="server" ></asp:GridView>
           </div>
           <br />
           <br />

           <div class="row">
               <div class="col-md-6"></div>
               <div class="col-md-6">
                   <asp:Button ID="btndownload" runat="server" Text="Download" CssClass="btn btn-danger" Font-Size="Medium" OnClick="btndownload_Click" Width="199px" />
               </div>
           </div>
       </asp:Panel>
       <br />
       <br />
       </div>

</asp:Content>

