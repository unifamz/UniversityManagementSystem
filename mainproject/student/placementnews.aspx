<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.master" AutoEventWireup="true" CodeFile="placementnews.aspx.cs" Inherits="student_placementnews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">

        <br />
        <br />

        <div class="row">
            <div class="col-md-6" style="text-align:center; border-right-style:groove">
                <asp:RadioButton ID="rbalreadyfillform" runat="server" Text="Already fill form" GroupName="form" CssClass="radio" style="font-size:x-large" AutoPostBack="True" />
            </div>
            <div class="col-md-6" style="text-align:center">
                <asp:RadioButton ID="rbfillform" runat="server" Text=" fill form" GroupName="form" CssClass="radio" style="font-size:x-large" AutoPostBack="True"/>
            </div>
        </div>

        <br />
        <br />

        <asp:Panel ID="plform" runat="server" BorderStyle="Ridge">
            
            <br />

       <form role="form">
           
           <div class="form-group" >
               <h3 class="col-md-2">Roll No.:-</h3>
               <div class="col-md-7">
                   <asp:TextBox ID="tbrollno" runat="server" CssClass="form-control" placeholder="Roll Number" required autofocus></asp:TextBox>
               </div>
               <div class="col-md-3">
                   <asp:Button ID="btncheck" runat="server" Text="Check" CssClass="btn btn-danger" Height="38px" Width="127px" Font-Size="Medium" OnClick="btncheck_Click" formnovalidate />
               </div>
           </div>

           <br />
           <br />
           <br />

           <div class="form-group" >
               <h3 class="col-md-2">Name:-</h3>
               <div class="col-md-10">
                   <asp:Label ID="lbname" runat="server" for="name" style="color:red; font-size:x-large; font-style:italic"></asp:Label>
               </div>
           </div>

           <br />
           <br />
           <br />

           <div class="form-group" >
               <h3 class="col-md-2">Email ID:-</h3>
               <div class="col-md-10">
                  <asp:Label ID="lbemail" runat="server" for="email" style="color:red; font-size:x-large; font-style:italic"></asp:Label>
               </div>
           </div>

           <br />
           <br />
           <br />

           <div class="form-group" >
               <h3 class="col-md-2">Contact No.:-</h3>
               <div class="col-md-10">
                   <asp:Label ID="lbcontact" runat="server" for="contact" style="color:red; font-size:x-large; font-style:italic"></asp:Label>
               </div>
           </div>

           <br />
           <br />
           <br />

           <div class="form-group" >
               <h3 class="col-md-2">Department:-</h3>
               <div class="col-md-10">
                   <asp:Label ID="lbdepartment" runat="server" for="department" style="color:red; font-size:x-large; font-style:italic"></asp:Label>
               </div>
           </div>

           <br />
           <br />
           <br />

           <div class="form-group" >
               <h3 class="col-md-2">Course:-</h3>
               <div class="col-md-10">
                   <asp:Label ID="lbcourse" runat="server" for="course" style="color:red; font-size:x-large; font-style:italic"></asp:Label>
               </div>
           </div>

           <br />
           <br />
           <br />

           <div class="form-group" >
               <h3 class="col-md-3">10th Percentage:-</h3>
               <div class="col-md-9">
                   <asp:TextBox ID="tbtenth" runat="server" CssClass="form-control" placeholder="10th % eg. 85.27" required MaxLength="2"></asp:TextBox>
               </div>
           </div>

           <br />
           <br />
           <br />
           <br />

           <div class="form-group" >
               <h3 class="col-md-3">12th Percentage:-</h3>
               <div class="col-md-9">
                   <asp:TextBox ID="tbtwelve" runat="server" MaxLength="2" CssClass="form-control" placeholder="12th % eg. 75.23" required></asp:TextBox>
               </div>
           </div>

           <br />
           <br />
           <br />
           <br />

           <div class="form-group" >
               <h3 class="col-md-3">Graduation Percentage:-</h3>
               <div class="col-md-9">
                   <asp:TextBox ID="tbgraduation" runat="server" MaxLength="2" CssClass="form-control" placeholder="Graduation %" required></asp:TextBox>
               </div>
           </div>

           <br />
           <br />
           <br />
           <br />

           <div class="form-group" >
               <h3 class="col-md-3">Current Backlogs<span style="color:brown">(Optional)</span>:-</h3>
               <div class="col-md-9">
                   <asp:TextBox ID="tbgraduationbacklogs" runat="server" CssClass="form-control"  placeholder="Current Backlogs eg. 2 or 3 "></asp:TextBox>
               </div>
           </div>

           <br />
           <br />
           <br />
           <br />

           <div class="form-group" >
               <h3 class="col-md-3">Post Graduation Percentage<span style="color:brown">(Optional)</span> :-</h3>
               <div class="col-md-9">
                   <asp:TextBox ID="tbpostgraduation" runat="server" MaxLength="2" CssClass="form-control" placeholder="Post Graduation %" ></asp:TextBox>
               </div>
           </div>

           <br />
           <br />
           <br />
           <br />

           <div class="form-group" >
               <h3 class="col-md-3">Current Backlogs<span style="color:brown">(Optional)</span>:-</h3>
               <div class="col-md-9">
                   <asp:TextBox ID="tbpostgraduationbacklogs" runat="server" CssClass="form-control" placeholder="Current Backlogs eg. 2 or 3 etc." ></asp:TextBox>
               </div>
           </div>

           <br />
           <br />
           <br />
           <br />
           <br />

           <div class="row">
               <div class="col-md-6"></div>
               <div class="col-md-6">
                   <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-primary" Text="Submit" Height="90px" Width="198px" Font-Size="Medium" OnClick="btnsubmit_Click" />
               </div>
           </div>

       </form>
            </asp:Panel>
    </div>   
</asp:Content>

