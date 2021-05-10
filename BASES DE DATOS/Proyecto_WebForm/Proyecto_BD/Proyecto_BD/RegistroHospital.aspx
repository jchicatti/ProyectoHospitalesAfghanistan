<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistroHospital.aspx.cs" Inherits="Proyecto_BD.Registro_Hospital" %>

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
            <h2>Health Facility/Hospital General Information</h2>
            <br />
            Name:&nbsp;<br />
&nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Address:<br />
&nbsp;<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            Contact number:<br />
&nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            MOPH number:<br />
&nbsp;<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="button" Text="Register this hospital" OnClick="Button1_Click" />
            <br />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Status"></asp:Label>
            <br />
            <br />
            Test:<br />
            <br />
            <asp:DropDownList ID="DropDownList1" CssClass="drop" runat="server" AutoPostBack="True" Height="38px" Width="216px">
            </asp:DropDownList>
            <br />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="buttonl" Text="Previous Page" OnClick="Button2_Click" />
        </div>
    </form>
</body>
</html>
