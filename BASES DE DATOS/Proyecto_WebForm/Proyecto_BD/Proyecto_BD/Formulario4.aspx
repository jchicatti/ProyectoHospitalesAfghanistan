<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Formulario4.aspx.cs" Inherits="Proyecto_BD.Formulario4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Monthly COVID Related Questions<br />
            <br />
            Last month, how many patients with COVID symtoms have you observed?
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            Last month, how many patients have tested positive for COVID?
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            Last month, how many patients were in intensive care with COVID symtoms and/or tsting positive for COVID?
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <br />
            Number of deaths from COVID during the last month?
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <br />
            <br />
            Number of non-COVID deaths during the last month?
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            <br />
            <br />
            Number of patients recovered from COVID out of the hospital during the last month?
            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            <br />
            <br />
            On avarage for the last month, how quikly was your health center able to obtain COVID test results?
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
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
