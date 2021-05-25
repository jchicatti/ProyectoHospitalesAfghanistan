<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginHospital.aspx.cs" Inherits="Proyecto_BD.LoginHospital1" %>

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
            <h2>Registered Health Facilities/Hospitals</h2>
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            <br />
            Select Hospital to Update: <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Please certify the MOPH number:"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
            </asp:DropDownList>
            <br />
&nbsp;<br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="buttonl" Text="Previous Page" OnClick="Button2_Click"/>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" CssClass="buttonr" Text="Start updating this hospital" OnClick="Button1_Click" Width="340px"/>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" CssClass="buttonr" Text="Hospital Contact Information" OnClick="Button4_Click" Width="340px"/>
        </div>
    </form>
</body>
</html>
