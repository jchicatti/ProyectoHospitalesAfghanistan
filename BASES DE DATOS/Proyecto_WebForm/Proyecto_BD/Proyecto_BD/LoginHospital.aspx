<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginHospital.aspx.cs" Inherits="Proyecto_BD.LoginHospital1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
            <asp:Button ID="Button2" runat="server" Text="Last Page" OnClick="Button2_Click"/>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Start updating this hospital" OnClick="Button1_Click"/>
        </div>
    </form>
</body>
</html>
