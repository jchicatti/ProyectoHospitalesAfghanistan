<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Formulario1.aspx.cs" Inherits="Proyecto_BD.Formulario1" %>

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
            <h2>COVID Inventory Count</h2><br />
            <br />
            <div class="right">Available COVID test kits reserves in days:</div>
                <asp:DropDownList ID="DropDownList1" runat="server" Width="141px" Height="17px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <div class="right">Number of available COVID test kits:</div>
            <asp:TextBox ID="TextBox2" runat="server" Width="133px"></asp:TextBox>
            <br />
            <br />
            <div class="right">Number of functioning respiratory/ventilators machines:</div>
            <asp:TextBox ID="TextBox3" runat="server" Width="134px"></asp:TextBox>
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
