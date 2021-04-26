<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroHospital.aspx.cs" Inherits="Proyecto_BD.Registro_Hospital" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Health Facility/Hospital General Information<br />
            <br />
            Name:&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Address:
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            Contact number:
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            MOPH number:
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Last Page" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="First Update" />
        </div>
    </form>
</body>
</html>
