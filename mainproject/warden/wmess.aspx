<%@ Page Title="" Language="C#" MasterPageFile="~/warden/warden.master" AutoEventWireup="true" CodeFile="wmess.aspx.cs" Inherits="warden_wmess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  <%--  <meta charset="utf-8" />
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
        <div style="height:60px"></div>
        <asp:Panel ID="plmain" runat="server">

            <form role="form">
                <div class="form-group">
                    <asp:Label ID="lbdate" Text="Date:-" runat="server" CssClass="col-md-3" Style="font-size: x-large"></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbdate" runat="server" placeholder="Date eg. 14/april/2015" CssClass="form-control" required autofocus></asp:TextBox>
                    </div>
                </div>
                <br />
                <br />
                <br />

                <div class="form-group">
                    <asp:Label ID="lbday" Text="Day:-" runat="server" CssClass="col-md-3" Style="font-size: x-large"></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbday" runat="server" placeholder="Day eg. monday,tuesday etc..." CssClass="form-control" required></asp:TextBox>
                    </div>
                </div>
                <br />
                <br />

                <div class="form-group">
                    <asp:Label ID="lbbreakfast" Text="BreakFast:-" runat="server" CssClass="col-md-3" Style="font-size: x-large"></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbbreakfast" runat="server" placeholder="Breakfast" TextMode="MultiLine" CssClass="form-control" required></asp:TextBox>
                    </div>
                </div>
                <br />
                <br />
                <br />

                <div class="form-group">
                    <asp:Label ID="lblunch" Text="Lunch:-" runat="server" CssClass="col-md-3" Style="font-size: x-large"></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="tblunch" runat="server" placeholder="Lunch" TextMode="MultiLine" CssClass="form-control" required></asp:TextBox>
                    </div>
                </div>
                <br />
                <br />
                <br />

                <div class="form-group">
                    <asp:Label ID="lbdinner" Text="Dinner:-" runat="server" CssClass="col-md-3" Style="font-size: x-large"></asp:Label>
                    <div class="col-md-9">
                        <asp:TextBox ID="tbdinner" runat="server" placeholder="Dinner" TextMode="MultiLine" CssClass="form-control" required></asp:TextBox>
                    </div>
                </div>
                <br />
                <br />
                <br />
                <br />

                <div class="row">
                    <div class="col-md-6"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btnsubmit" runat="server" class="btn btn-info " Text="Submit" Font-Size="X-Large" Height="72px" Width="243px" Font-Bold="True" OnClick="btnsubmit_Click" />
                    </div>
                </div>
            </form>
        </asp:Panel>
        <div style="height:60px"></div>
    </div>
</asp:Content>

