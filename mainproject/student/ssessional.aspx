<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.master" AutoEventWireup="true" CodeFile="ssessional.aspx.cs" Inherits="student_ssessional" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <br />
    <br />

    <div class="container-fluid">

        <div class="row">
            <h3 class="col-md-3">Roll No.:-</h3>
            <div class="col-md-6">
                <asp:TextBox ID="tbroll" runat="server" placeholder="Enter Roll No" CssClass="form-control" required autofocus></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:Button ID="btnshow" runat="server" CssClass="btn btn-danger" Text="Show" Font-Size="Medium" style="border-radius:20px" Width="140px" OnClick="btnshow_Click" />
            </div>
        </div>

        <br />
        <br />

       <asp:Panel ID="pldetails" runat="server" BorderStyle="Ridge">
           
           <br />
           <br />

           <div class="form-group">
               <h3 class="col-md-3">Name:-</h3>
               <asp:Label ID="lbname" runat="server" CssClass="col-md-9" style="color:red; font-size:x-large; font-style:italic;"></asp:Label>
           </div>

           <br />
           <br />
           <br />

           <div class="form-group">
               <h3 class="col-md-3">Department:-</h3>
               <asp:Label ID="lbdepartment" runat="server" CssClass="col-md-9" style="color:red; font-size:x-large; font-style:italic;"></asp:Label>
           </div>

           <br />
           <br />
           <br />

         <div class="form-group">
               <h3 class="col-md-3">Course:-</h3>
               <asp:Label ID="lbcourse" runat="server" CssClass="col-md-9" style="color:red; font-size:x-large; font-style:italic;"></asp:Label>
           </div>

           <br />
           <br />
           <br />

           <div class="form-group">
               <h3 class="col-md-3">Semester:-</h3>
               <asp:Label ID="lbsemester" runat="server" CssClass="col-md-9" style="color:red; font-size:x-large; font-style:italic;"></asp:Label>
           </div>

           <br />
           <br />
           <br />
           <br />

           <asp:GridView ID="gvmarks" runat="server" AutoGenerateColumns="false" Width="100%" HeaderStyle-Font-Size="Large" HeaderStyle-BackColor="#2E3C59" HeaderStyle-ForeColor="White" OnRowDataBound="gvmarks_RowDataBound">
               <columns>
                   <asp:TemplateField HeaderText="Serial No">
                       <ItemTemplate>
                           No.<%#Container.DataItemIndex+1 %>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:BoundField DataField="subject_name" HeaderText="Subject Name" SortExpression="Subject Name" />
                   <asp:BoundField DataField="sessional_marks" HeaderText="Total Marks" SortExpression="Total Marks" />
                   <asp:TemplateField HeaderText="Marks Obtained">
                       <ItemTemplate>
                           <asp:Label ID="lbmarks" runat="server"></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="%age">
                       <ItemTemplate>
                           <asp:Label ID="lbpercent" runat="server"></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Status">
                       <ItemTemplate>
                           <asp:Label ID="lbstatus" runat="server"></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Grade">
                       <ItemTemplate>
                           <asp:Label ID="lbgrade" runat="server"></asp:Label>
                       </ItemTemplate>
                   </asp:TemplateField>
               </columns>
           </asp:GridView>
           



           <br />
           <br />

           <div class="row">
               <div class="col-md-6"></div>
               <div class="col-md-6">
                   <asp:Button ID="btndownload" runat="server" Text="Download" CssClass="btn btn-info" Font-Size="Medium" />
               </div>
           </div>

           <br />

       </asp:Panel>
    </div>
</asp:Content>

