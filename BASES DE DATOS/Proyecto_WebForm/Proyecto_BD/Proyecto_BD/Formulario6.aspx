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
            <asp:DropDownList ID="DropDownList1" runat="server" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Available antipyretics reserves in days:
            <asp:DropDownList ID="DropDownList2" runat="server" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Available anesthesic drugs/muscular relaxatns reserves in days:
            <asp:DropDownList ID="DropDownList3" runat="server" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Available alcohol solution/soap for handwashing reserves in days:
            <asp:DropDownList ID="DropDownList4" runat="server" Width="133px">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem Value="3 ">3 </asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Last Page" OnClick="Button2_Click" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Next Page" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
