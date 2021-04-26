<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Formulario6.aspx.cs" Inherits="Proyecto_BD.Formulario6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            General Inventory Count<br />
            <br />
            Available oxygen reserves in days:
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            Available antipyretics reserves in days:
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            Available anesthesic drugs/muscular relaxatns reserves in days:
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <br />
            Available alcohol solution/soap for handwashing reserves in days:
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Last Page" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Next Page" />
        </div>
    </form>
</body>
</html>
