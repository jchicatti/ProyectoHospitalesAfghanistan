<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateContacto.aspx.cs" Inherits="Proyecto_BD.UpdateContacto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/Style-Forms.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <br />
            VOXMAP</div>
        <div class="registro">
            <h2>Health Facility/Hospital Contact Details</h2>
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <br />
            <strong>Change existing contact status</strong><br />
            <br />
            Select id_telephone:&nbsp;
            <asp:DropDownList ID="DropDownList7" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" CssClass="button" Text="Change status to active/inactive" OnClick="Button3_Click" Width="289px" />
            &nbsp;<br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Status: "></asp:Label>
            <br />
            <br />
            <strong>Register new contact</strong><br />
            <br />
            Contact number&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Contact name&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Contact type
            <br />
            <br />
&nbsp;<asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList6" runat="server">
                <asp:ListItem Value="Landline">Landline</asp:ListItem>
                <asp:ListItem Value="Cellphone">Cellphone</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="button" Text="Register" OnClick="Button1_Click" Width="209px" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Status: "></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" CssClass="button" Text="Refresh" OnClick="Button4_Click" Width="209px" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="button" Text="Previous Page" OnClick="Button2_Click" Width="209px" />
        </div>
    </form>
</body>
</html>
