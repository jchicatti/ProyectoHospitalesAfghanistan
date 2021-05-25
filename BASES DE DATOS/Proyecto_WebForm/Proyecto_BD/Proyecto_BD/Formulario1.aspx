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
            <asp:Menu ID="Menu1" runat="server" BackColor="#AE0E0A" DynamicEnableDefaultPopOutImage="False" DynamicHorizontalOffset="2" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Size="0.9em" Font-Strikeout="False" Font-Underline="False" ForeColor="White" ItemWrap="True" Orientation="Horizontal" RenderingMode="Table" StaticSubMenuIndent="10px" style="margin-left: 0px" Width="855px">
                <DynamicHoverStyle BackColor="#7C6F57" ForeColor="White" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicMenuStyle BackColor="#F7F6F3" />
                <DynamicSelectedStyle BackColor="#5D7B9D" />
                <Items>
                    <asp:MenuItem NavigateUrl="~/Formulario1.aspx" Text="COVID Inventory" Value="1"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Formulario2.aspx" Text="Protection Material" Value="2"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Formulario3.aspx" Text="COVID General" Value="New Item"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Formulario4.aspx" Text="COVID Monthly" Value="3"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Formulario5.aspx" Text="Personnel" Value="4"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/Formulario6.aspx" Text="General Inventory" Value="5"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/FormularioResumen.aspx" Text="Report" Value="6"></asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#7C6F57" ForeColor="White" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticSelectedStyle BackColor="#5D7B9D" />
            </asp:Menu>
            <br />
            <h2>COVID Inventory Count</h2>
            <br />
            <br />
            <div class="right">
                Available COVID kits reserves in days</div>
                <asp:DropDownList ID="DropDownList1" runat="server" Width="141px" Height="17px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <br />
            <div class="right">
                Number of available COVID test kits:</div>
            <asp:TextBox ID="TextBox2" runat="server" Width="133px"></asp:TextBox>
            <br />
            <br />
            <br />
            <div class="right">
                Number of functioning respiratory ventilators:</div>
            <asp:TextBox ID="TextBox3" runat="server" Width="134px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" BorderColor="#FF9900" BorderStyle="Dotted"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="buttonl" Text="Cancel update" OnClick="Button2_Click" />
            <asp:Button ID="Button1" runat="server" CssClass="buttonr" Text="Next Page" OnClick="Button1_Click" Width="205px" />
        </div>
    </form>
</body>
</html>
