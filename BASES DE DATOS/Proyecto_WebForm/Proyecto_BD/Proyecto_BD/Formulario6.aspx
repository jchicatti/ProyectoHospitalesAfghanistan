<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Formulario6.aspx.cs" Inherits="Proyecto_BD.Formulario6" %>

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
            <h2>General Inventory Count</h2><br />
            <br />
            <div class="right">Available oxygen reserves in days:</div>
            <asp:DropDownList ID="DropDownList1" runat="server" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <div class="right">Available antipyretics reserves in days:</div>
            <asp:DropDownList ID="DropDownList2" runat="server" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <div class="right">Available anesthesic drugs/muscular relaxatns reserves in days:</div>
            <asp:DropDownList ID="DropDownList3" runat="server" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <div class="right">Available alcohol solution/soap for handwashing reserves in days:</div>
            <asp:DropDownList ID="DropDownList4" runat="server" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="buttonl" Text="Previous Page" OnClick="Button2_Click" />
            <asp:Button ID="Button1" runat="server" CssClass="buttonr" Text="Next Page" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
