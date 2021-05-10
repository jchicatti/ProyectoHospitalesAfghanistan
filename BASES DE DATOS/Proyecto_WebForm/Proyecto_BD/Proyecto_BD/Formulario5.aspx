<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Formulario5.aspx.cs" Inherits="Proyecto_BD.Formulario5" %>

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
            <h2>Personnel Count</h2><br />
            <br />
            Number of doctors working in this health facility/hospital?<br />
&nbsp;<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <br />
            Number of paramedical staff working in this health facility/hospital?<br />
&nbsp;<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
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
