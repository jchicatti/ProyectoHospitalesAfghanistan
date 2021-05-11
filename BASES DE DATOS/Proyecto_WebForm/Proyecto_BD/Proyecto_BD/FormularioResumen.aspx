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
            <h2>Update Report</h2><br />
            <br />
            <strong>Update Status</strong><br />
            <br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                <asp:ListItem Value="1">QUESTIONNAIRE COMPLETED</asp:ListItem>
                <asp:ListItem Value="2">QUESTIONNAIRE COMPLETED PARTIALLY</asp:ListItem>
                <asp:ListItem Value="3">QUESTIONNAIRE NOT DONE</asp:ListItem>
                <asp:ListItem Value="4">THIS WAS A TEST</asp:ListItem>
                <asp:ListItem Value="5">OTHER</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            Comments:
            <br />
            <asp:TextBox ID="TextBox4" runat="server" Width="575px"></asp:TextBox>
            <br />
            <br />
            <strong>Problem Status</strong><br />
            <br />
            <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                <asp:ListItem Value="1">NO PROBLEM</asp:ListItem>
                <asp:ListItem Value="2">SOME DATA IS MISSING</asp:ListItem>
                <asp:ListItem Value="3">REFUSED TO SPEAK</asp:ListItem>
                <asp:ListItem Value="4">WRONG PHONE NUMBER</asp:ListItem>
                <asp:ListItem Value="5">DOCTOR HAS QUIT</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <strong>Action Status</strong><br />
            <br />
            <asp:RadioButtonList ID="RadioButtonList3" runat="server">
                <asp:ListItem Value="1">NO ADDITIONAL ACTION NEEDED</asp:ListItem>
                <asp:ListItem Value="2">CALL BACK TOMORROW</asp:ListItem>
                <asp:ListItem Value="3">FIND NEW PHONE NUMBER</asp:ListItem>
                <asp:ListItem Value="4">AUTHORIZATION</asp:ListItem>
                <asp:ListItem Value="5">OTHER</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            Comments:<br />
&nbsp;<asp:TextBox ID="TextBox5" runat="server" Width="607px"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="buttonl" Text="Previous Page" OnClick="Button2_Click" />
            <asp:Button ID="Button1" runat="server" CssClass="buttonr" Text="Finish Update" OnClick="Button1_Click" />
            <br />
            <br />
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
