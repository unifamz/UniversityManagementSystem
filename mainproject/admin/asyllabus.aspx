<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="asyllabus.aspx.cs" Inherits="admin_asyllabus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid bg-success">

    <br />

        <asp:Panel ID="plsubject" runat="server" BorderStyle="Ridge">
            <br />

            <div class="form-group">
                <h3 class="col-md-2">Department:-</h3>
                <div class="col-md-10">
                    <asp:DropDownList ID="ddldepartment" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged">
                        <asp:ListItem Text="---Select Department---" Selected="True" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <br />
            <br />
            <br />

            <div class="form-group">
                <h3 class="col-md-2">Course:-</h3>
                <div class="col-md-10">
                    <asp:DropDownList ID="ddlcourse" runat="server" CssClass="form-control">
                        <asp:ListItem Text="---Select Course---" Selected="True" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <br />
            <br />
            <br />

            <div class="form-group">
                <h3 class="col-md-2">Semester:-</h3>
                <div class="col-md-10">
                    <asp:TextBox ID="tbsemester" runat="server" placeholder="Enter Semester" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <br />
            <br />
            <br />

            <div class="form-group">
                <h3 class="col-md-2">Total Sessional Marks:-</h3>
                <div class="col-md-10">
                    <asp:TextBox ID="tbsessionalmarks" runat="server" placeholder="Enter sessional marks" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <br />
            <br />
            <br />
            <br />

            <div class="form-group" id="divtextboxes" runat="server">
                <h3 class="col-md-2">Total Subjects:-</h3>
                <div class="col-md-7">
                    <asp:TextBox ID="tbtotalsubjects" runat="server" placeholder="Enter total subjects eg. 5 or 6" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-3">
                    <asp:Button ID="btnclick" runat="server" CssClass="btn btn-danger" Text="Click" Font-Size="Medium" style="border-radius:20px" Width="127px" OnClick="btnclick_Click" />
                 </div>
            </div>

            <br />
            <br />
            <br />

            <div class="form-group">
                
                <div class="col-md-3" id="divno" runat="server">
                    <asp:Label id="lbnumber" runat="server" Text="Serial No:-" Font-Size="X-Large"></asp:Label>
                </div>
                <div class="col-md-3" id="divsubject" runat="server">
                    <asp:Label ID="lbsubject" runat="server" Text="Subject Name:-" Font-Size="X-Large"></asp:Label>
                </div>
                <div class="col-md-3" id="divinternalmarks" runat="server">
                    <asp:Label ID="lbinternalmarks" runat="server" Text="Internal Marks:-" Font-Size="X-Large"></asp:Label>
                </div>
                <div class="col-md-3" id="divexternalmarks" runat="server">
                    <asp:Label ID="lbexternalmarks" runat="server" Text="External Marks:-" Font-Size="X-Large"></asp:Label>
                </div>
            </div>

            <br />
            <br />

            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-info" Font-Size="Medium" Width="178px" OnClick="btnsubmit_Click" />
                </div>
            </div>

            <br />
            <br />

        </asp:Panel>
    </div>
</asp:Content>

