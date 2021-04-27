<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Proyecto_BD.Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register New Hospital" Width="315px" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Update Existing Hospital" Width="314px" OnClick="Button2_Click" />
            <br />
        </div>
    </form>
</body>
</html>
