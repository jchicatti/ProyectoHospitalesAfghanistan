<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormularioResumen.aspx.cs" Inherits="Proyecto_BD.FormularioResumen" %>

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
            <h2>Update Report</h2>
            <br />
            <strong>Was this a test?<br />
            </strong><br />
            <asp:RadioButtonList ID="RadioButtonList3" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList3_SelectedIndexChanged">
                <asp:ListItem Value="0">Yes</asp:ListItem>
                <asp:ListItem Value="1">No</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Label ID="Label2" runat="server" style="font-weight: 700"></asp:Label>
            &nbsp;<br />
            <br />
            <asp:RadioButtonList ID="RadioButtonList4" runat="server" style="font-size: medium" Width="116px" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList4_SelectedIndexChanged">
            </asp:RadioButtonList>
            <br />
            <asp:Label ID="Label3" runat="server" style="font-weight: 700"></asp:Label>
            &nbsp;<br />
            <br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" style="font-size: medium" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
            </asp:RadioButtonList>
            <br />
            <asp:Label ID="Label1" runat="server" style="font-weight: 700"></asp:Label>
            <br />
            <br />
            <asp:RadioButtonList ID="RadioButtonList2" runat="server" style="font-size: medium">
            </asp:RadioButtonList>
            <br />
            Comments:<br />
&nbsp;<asp:TextBox ID="TextBox5" runat="server" Width="607px"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="TextBox6" runat="server" ReadOnly="True" TextMode="MultiLine" Height="66px" Width="267px"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="buttonl" Text="Previous Page" OnClick="Button2_Click" />
            <asp:Button ID="Button1" runat="server" CssClass="buttonr" Text="Finish Update" OnClick="Button1_Click" />
            <br />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" CssClass="buttonl" Text="Cancel update" OnClick="Button3_Click" />
        </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
