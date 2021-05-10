<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Formulario4.aspx.cs" Inherits="Proyecto_BD.Formulario4" %>

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
            <h2>Monthly COVID Related Questions</h2><br />
            <br />
            Last month, how many patients with COVID symtoms have you observed?<br />
&nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            Last month, how many patients have tested positive for COVID?<br />
&nbsp;<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            Last month, how many patients were in intensive care with COVID symtoms and/or tsting positive for COVID?
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <br />
            Number of deaths from COVID during the last month?<br />
&nbsp;<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <br />
            <br />
            Number of non-COVID deaths during the last month?<br />
&nbsp;<asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            <br />
            <br />
            Number of patients recovered from COVID out of the hospital during the last month?<br />
&nbsp;<asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            <br />
            <br />
            On avarage for the last month, how quikly was your health center able to obtain COVID test results?<br />
&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="buttonl" Text="Previous Page" OnClick="Button2_Click" />
            <asp:Button ID="Button1" runat="server" CssClass="buttonr" Text="Next Page" OnClick="Button1_Click" />
            <br />
        </div>
    </form>
</body>
</html>
