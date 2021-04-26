<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Formulario2.aspx.cs" Inherits="Proyecto_BD.Formulario2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        &nbsp;Protection Material for Personnel Inventory Count<br />
            <br />
            Available disposable masks reserves in days:
            <asp:DropDownList ID="DropDownList1" runat="server" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Available dispable vinyl gloves reserves in days:
            <asp:DropDownList ID="DropDownList2" runat="server" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Available disposable hats reserves in days:
            <asp:DropDownList ID="DropDownList3" runat="server" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Available disposable aprons reserves in days:
            <asp:DropDownList ID="DropDownList4" runat="server" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Available visors reserves in days:
            <asp:DropDownList ID="DropDownList5" runat="server" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Available disposable shoe covers reserves in days:
            <asp:DropDownList ID="DropDownList6" runat="server" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
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
