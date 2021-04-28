<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Formulario1.aspx.cs" Inherits="Proyecto_BD.Formulario1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            COVID Inventory Count<br />
            <br />
            Available COVID test kits reserves in days:
            <asp:DropDownList ID="DropDownList1" runat="server" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Number of available COVID test kits:
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            Number of functioning respiratory/ventilators machines:
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Last Page" OnClick="Button2_Click" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Next Page" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
