<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Formulario3.aspx.cs" Inherits="Proyecto_BD.Formulario3" %>

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
            <h2>General COVID Related Questions</h2>
            <br />
            <br />
            Does your health center currently have the ability to test patients for COVID-19?<asp:RadioButtonList ID="RadioButtonList3" runat="server">
                <asp:ListItem>YES</asp:ListItem>
                <asp:ListItem>NO</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            Has a screening of COVID patients, based on symptoms, been implemented at hospital arrival?
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                <asp:ListItem>YES</asp:ListItem>
                <asp:ListItem>NO</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            Have there been awareness campaigns on COVID prevention in this hospital?
            <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                <asp:ListItem>YES</asp:ListItem>
                <asp:ListItem>NO</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            Have you recieved COVID related resources in the last month?<br />
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" Width="183px" AutoPostBack="True">
            </asp:DropDownList>
            <br />
            <br />
            Do you regulary track COVID cases in your health facility?
            <asp:RadioButtonList ID="RadioButtonList4" runat="server">
                <asp:ListItem>YES</asp:ListItem>
                <asp:ListItem>NO</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            How regularly do you report your COVID tracking results to the MOPH?<br />
&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" Width="133px">
                <asp:ListItem Value="3">Every 3 days</asp:ListItem>
                <asp:ListItem Value="7">Every 7 days</asp:ListItem>
                <asp:ListItem Value="15">Every 15 days</asp:ListItem>
                <asp:ListItem Value="30">Every 30 days or more</asp:ListItem>
                <asp:ListItem Value="0">Never</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Number of COVID cases referred to PHC:
            <br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" BorderColor="#FF9900" BorderStyle="Dotted" Text="Label"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="buttonl" Text="Previous Page" OnClick="Button2_Click" />
            <asp:Button ID="Button1" runat="server" CssClass="buttonr" Text="Next Page" OnClick="Button1_Click" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" CssClass="buttonl" Text="Cancel update" OnClick="Button3_Click" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
