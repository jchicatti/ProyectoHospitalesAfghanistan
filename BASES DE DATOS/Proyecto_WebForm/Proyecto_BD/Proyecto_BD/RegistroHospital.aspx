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
            Contact number 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Contact name 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Contact type 1<br />
&nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList8" runat="server">
                <asp:ListItem Value="Landline">Landline</asp:ListItem>
                <asp:ListItem Value="Cellphone">Cellphone</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Contact number 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Contact name 2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Contact type 2 <br />
&nbsp;<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList7" runat="server">
                <asp:ListItem Value="Landline">Landline</asp:ListItem>
                <asp:ListItem Value="Cellphone">Cellphone</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Contact number 3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Contact name 3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Contact type 3<br />
&nbsp;<asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList6" runat="server">
                <asp:ListItem Value="Landline">Landline</asp:ListItem>
                <asp:ListItem Value="Cellphone">Cellphone</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Latitud&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Longitud&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;<asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
            <br />
            <br />
            MOPH:<br />
&nbsp;<asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
            <br />
            <br />
            Type:
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
            </asp:DropDownList>
            <br />
            <br />
            District: <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True">
            </asp:DropDownList>
            <br />
            <br />
            Province:
            <asp:DropDownList ID="DropDownList9" runat="server" AutoPostBack="True">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Verify the hospital you are registering is not a duplicate of the following:" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" Visible="False">
            </asp:GridView>
            <asp:Button ID="Button3" CssClass="buttonl" runat="server" Text="It is not a duplicate." Visible="False" OnClick="Button3_Click1" />
            <asp:Button ID="Button1" runat="server" CssClass="button" Text="Register this hospital" OnClick="Button1_Click" Width="260px" />
            <br />
            <asp:TextBox ID="TextBox14" runat="server" BorderStyle="None" TextMode="MultiLine" Height="48px" Width="374px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="buttonl" Text="Previous Page" OnClick="Button2_Click" />
        </div>
    </form>
</body>
</html>
