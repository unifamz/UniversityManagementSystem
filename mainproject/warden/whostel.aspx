<%@ Page Title="" Language="C#" MasterPageFile="~/warden/warden.master" AutoEventWireup="true" CodeFile="whostel.aspx.cs" Inherits="warden_whostel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- CSS -->
    <link href="../css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css" />
    <link href="../css/login.css" rel="stylesheet" type="text/css" />
    <!--Scripts-->
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="../js/bootstrap.js" type="text/javascript"></script>--%>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div style="height: 60px"></div>
        <asp:Panel ID="pltopbuton" runat="server" BorderStyle="Ridge">
        <div class="row">
            <div class="col-md-6" style="border-right-style:groove">
                <asp:Button ID="btnboyshostel" runat="server" Text="Boys Hostel" CssClass="btn btn-info center-block" Style="font-size: larger;" formnovalidate OnClick="btnboyshostel_Click" />
            </div>
            <div class="col-md-6">
                <asp:Button ID="btngirlshostel" runat="server" Text="Girls Hostel" CssClass="btn btn-info center-block" Style="font-size: larger" formnovalidate OnClick="btngirlshostel_Click" />
            </div>
        </div>
            </asp:Panel>
    </div>
    <br />
    <br />
    <div class="container-fluid" >
        <div class="row" style="text-align: center" id="divtotalblocks" runat="server">
            <asp:Label ID="lbtotalblocks" runat="server" Text="Total Blocks:-" CssClass="col-md-3" Style="font-size: large;"></asp:Label>
            <div class="col-md-6">
                <asp:TextBox ID="tbtotalblocks" runat="server" CssClass="form-control" placeholder="eg. 1,2,3 etc..."></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:Button ID="btnsubmit" CssClass="btn btn-danger" runat="server" Text="Submit" OnClick="btncheck_Click"    />
            </div>
        </div>
        <br />
        <br />
        <div class="row" id="divblockno" runat="server" style="text-align: center; border: groove">

            <asp:Label ID="lbblockno" runat="server"  CssClass="col-md-5" Style="font-size: 70px; color: rosybrown;"></asp:Label>
            <div class="col-md-4" style="border-left-style: groove">
                <h2>Total Floors:-</h2>
                <asp:TextBox ID="tbtotalfloors" runat="server" placeholder="eg. 1 or 2 or 3 etc.." CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <asp:Button ID="btntotalfloor" runat="server" CssClass="btn btn-warning btn-sm btn-block " Style="font-size: larger" Text="Enter" OnClick="btntotalfloor_Click" />
            </div>
        </div>
    </div>
    <br />
    <br />
    <div class="container-fluid">
        <asp:Panel ID="plblock" runat="server" BorderStyle="Groove">
            <form role="form">
                <div class="form-group" style="border-bottom-style:ridge">
                    <div class="row">
                        <div class="col-md-5" style="text-align: center">
                            <asp:Label ID="lbblockshow" runat="server" Style="font-size: x-large; color: #032e0e"></asp:Label>
                        </div>
                        <div class="col-md-2" style="text-align: center">
                            <asp:Label ID="Label1" runat="server" Text="-" Style="font-size: x-large; color:black"></asp:Label>
                        </div>
                        <div class="col-md-5" style="text-align: center">
                            <asp:Label ID="lbfloorshow" runat="server" Style="font-size: x-large; color: #ac71d5"></asp:Label>
                        </div>
                    </div>
                </div>
                <br /><br />

                <div class="form-group">
                    <asp:Label ID="lbchooseside" runat="server" for="chooseside" style="font-size:large" CssClass="col-md-4" Text="Choose Side:-"></asp:Label>
                    <div class="col-md-4" style="text-align:center">
                       <asp:Label ID="lbfrontside" Text="Front Side" runat="server" style="font-size:larger; color:#51e34d"></asp:Label>
                    </div>
                    <div class="col-md-4" style="text-align:center; border-left-style:ridge">
                        <asp:Label ID="lboppositeside" Text="Opposite Side" runat="server" style="font-size:larger; color:#51e34d"></asp:Label>
                    </div>
                </div>
                <br />
                <br />

                <div class="form-group">
                    <asp:Label ID="lbstartroom" runat="server" for="startroom" style="font-size:large" CssClass="col-md-4" Text="Starting Room No.:-"></asp:Label>
                    <div class="col-md-4">
                        <asp:TextBox ID="tbstartroomfront" runat="server" CssClass="form-control" placeholder="Starting Room Number"></asp:TextBox>
                    </div>
                     <div class="col-md-4" style="border-left-style:ridge"">
                        <asp:TextBox ID="tbstartroomopposite" runat="server" CssClass="form-control" placeholder="Starting Room Number"></asp:TextBox>
                    </div>
                </div>
                <br />
                <br />

                <div class="form-group">
                    <asp:Label ID="lbendroom" runat="server" for="endroom" style="font-size:large" CssClass="col-md-4" Text="Ending Room No.:-"></asp:Label>
                    <div class="col-md-4">
                        <asp:TextBox ID="tbendroomfront" runat="server" CssClass="form-control" placeholder="Ending Room Number"></asp:TextBox>
                    </div>
                    <div class="col-md-4" style="border-left-style:ridge"">
                        <asp:TextBox ID="tbendroomopposite" runat="server" CssClass="form-control" placeholder="Ending Room Number"></asp:TextBox>
                    </div>
                </div>
                <br />
                <br />
                <br />
                <br />
                
                <div class="row">
                <div class="col-md-6"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnsubmit1" runat="server" class="btn btn-info " Text="Submit" Font-Size="X-Large" Height="72px" Width="243px" Font-Bold="True" OnClick="btnsubmit1_Click" />
                </div>
            </div>
                <br />
                <br />
            </form>
        </asp:Panel>
    </div>
    <div style="height:50px"></div>
</asp:Content>