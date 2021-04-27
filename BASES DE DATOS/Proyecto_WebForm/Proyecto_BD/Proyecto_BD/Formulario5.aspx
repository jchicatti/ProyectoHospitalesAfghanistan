<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Formulario5.aspx.cs" Inherits="Proyecto_BD.Formulario5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Personnel Count<br />
            <br />
            Number of doctors working in this health facility/hospital?
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <br />
            Number of paramedical staff working in this health facility/hospital?
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
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
