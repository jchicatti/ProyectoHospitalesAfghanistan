<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Formulario2.aspx.cs" Inherits="Proyecto_BD.Formulario2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/Style-Forms.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <header class="header">
            <div class="menu">
                <a>VOXMAPP</a>
            </div>
        </header>
        <div class="registro">
            <h2>
            Protection Material for Personnel Inventory Count
              </h2>
            <br />
            <br />
            <div class="right">
                Available disposable masks reserves in days:</div>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="right" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <div class="right">Available dispable vinyl gloves reserves in days:</div>
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="right" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <div class="right">Available disposable hats reserves in days:</div>
            <asp:DropDownList ID="DropDownList3" runat="server" CssClass="right" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <div class="right">Available disposable aprons reserves in days:</div>
            <asp:DropDownList ID="DropDownList4" runat="server" CssClass="right" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <div class="right">Available visors reserves in days:</div>
            <asp:DropDownList ID="DropDownList5" runat="server" CssClass="right" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <div class="right">Available disposable shoe covers reserves in days:</div>
            <asp:DropDownList ID="DropDownList6" runat="server" CssClass="right" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="buttonl" Text="Previous Page" OnClick="Button2_Click" />
            <asp:Button ID="Button1" runat="server" CssClass="buttonr" Text="Next Page" OnClick="Button1_Click" />
            <br />
        </div>
    </form>
</body>
</html>
