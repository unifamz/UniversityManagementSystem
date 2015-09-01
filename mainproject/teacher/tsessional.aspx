<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/teacher.master" AutoEventWireup="true" CodeFile="tsessional.aspx.cs" Inherits="teacher_tsessional" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">

        <br />
        <br />
       
                <div class="form-group">
                    <h3 class="col-md-2">Department:-</h3>
                    <div class="col-md-10">
                        <asp:DropDownList ID="ddldepartment" runat="server" CssClass="form-control" required AutoPostBack="True" OnSelectedIndexChanged="ddldepartment_SelectedIndexChanged">
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
                <asp:DropDownList ID="ddlcourse" runat="server" CssClass="form-control" required>
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
                <asp:DropDownList ID="ddlsemster" runat="server" CssClass="form-control" required>
                    <asp:ListItem Text="---Select Semster---" Selected="True" Value="0"></asp:ListItem>
                    <asp:ListItem Text="First(1st)" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Second(2nd)" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Third(3rd)" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Fourth(4th)" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Fifth(5th)" Value="5"></asp:ListItem>
                    <asp:ListItem Text="Sixth(6th)" Value="6"></asp:ListItem>
                    <asp:ListItem Text="Seventh(7th)" Value="7"></asp:ListItem>
                    <asp:ListItem Text="Eight(8th)" Value="8"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <br />
        <br />
        <br />

        <div class="form-group">
            <h3 class="col-md-2">Section:-</h3>
            <div class="col-md-10">
                <asp:DropDownList ID="ddlsection" runat="server" CssClass="form-control" required>
                    <asp:ListItem Text="---Select Section---" Selected="True" Value="0"></asp:ListItem>
                    <asp:ListItem Text="First(1st)" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Second(2nd)" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Third(3rd)" Value="3"></asp:ListItem>
                    <asp:ListItem Text="Fourth(4th)" Value="4"></asp:ListItem>
                    <asp:ListItem Text="Fifth(5th)" Value="5"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <br />
        <br />
        <br />

        <div class="form-group">
           <h3 class="col-md-2">Total Marks:-</h3>
            <div class="col-md-10">
                <asp:TextBox ID="tbtotalmarks" runat="server" placeholder="Out OF total Marks" CssClass="form-control" required></asp:TextBox>
            </div>
        </div>

        <br />
        <br />
        <br />
        <br />

        <div class="row">
            <div class="col-md-6"></div>
            <div class="col-md-6">
                <asp:Button ID="btnshow" runat="server" Text="Show" CssClass="btn btn-primary" Font-Size="Medium" Height="58px" Width="179px" OnClick="btnshow_Click" />
            </div>
        </div>

        <br />
        <br />

        <asp:Panel ID="plgrid" runat="server" BorderStyle="Ridge" Visible="false">
            <br />

            <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="up1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
            <asp:GridView ID="gvsessional" runat="server" AllowPaging="true" AutoGenerateColumns="False" Width="100%" HeaderStyle-Font-Size="Large" HeaderStyle-BackColor="#2E3C59" HeaderStyle-ForeColor="White" OnRowDataBound="gvsessional_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Serial No">
                        <ItemTemplate>
                            No.<%#Container.DataItemIndex+1%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="Name" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:TextBox ID="tbinternal" runat="server" AutoPostBack="true" CssClass="form-control" placeholder="Enter Marks eg. 30 ,25 etc." OnTextChanged="tbinternal_textchanged"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="%age">
                        <ItemTemplate>
                            <asp:Label ID="lbpercent" runat="server" style="color:red; font-size:medium" ></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="lbstatus" runat="server" style="color:#1debf4; Font-Size:medium;"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                    </ContentTemplate>
                <%--<Triggers>
                    <asp:AsyncPostBackTrigger ControlID="tbinternal" />
                </Triggers>--%>
                </asp:UpdatePanel>
            <br />
            <br />

            <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-primary" Height="72px" Text="Submit" Font-Size="Medium" Width="159px" OnClick="btnsubmit_Click" />
                </div>
            </div>
            
        </asp:Panel>
    </div>
</asp:Content>

