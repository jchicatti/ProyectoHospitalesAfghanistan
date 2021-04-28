<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Formulario3.aspx.cs" Inherits="Proyecto_BD.Formulario3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            General COVID Related Questions<br />
            <br />
            Does your health center currently have the ability to test patients for COVID-19?<asp:RadioButtonList ID="RadioButtonList3" runat="server">
                <asp:ListItem>YES</asp:ListItem>
                <asp:ListItem>NO</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            Has a screening of COVID patients, based on symptoms, been implemented at hospital arrival?
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                <asp:ListItem>YES</asp:ListItem>
                <asp:ListItem>NO</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            Have there been awareness campaigns on COVID prevention in this hospital?
            <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                <asp:ListItem>YES</asp:ListItem>
                <asp:ListItem>NO</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            Have you recieved COVID related resources in the last month? <asp:DropDownList ID="DropDownList1" runat="server" Width="183px">
                <asp:ListItem>Yes Government</asp:ListItem>
                <asp:ListItem Value="1">Yes Non Government</asp:ListItem>
                <asp:ListItem Value="3">Yes Both</asp:ListItem>
                <asp:ListItem Value="4">None</asp:ListItem>
                <asp:ListItem Value="5">Don&#39;t Know</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Do you regulary track COVID cases in your health facility?
            <asp:RadioButtonList ID="RadioButtonList4" runat="server">
                <asp:ListItem>YES</asp:ListItem>
                <asp:ListItem>NO</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            How regularly do you report your COVID tracking results to the MOPH?
            <asp:DropDownList ID="DropDownList2" runat="server" Width="133px">
                <asp:ListItem Value="0">Every 3 days</asp:ListItem>
                <asp:ListItem Value="1">Every 7 days</asp:ListItem>
                <asp:ListItem Value="2">Every 15 days</asp:ListItem>
                <asp:ListItem Value="3">Every 30 days or more</asp:ListItem>
                <asp:ListItem Value="5">Never</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Number of COVID cases referred to PHC:
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Last Page" OnClick="Button2_Click" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Next Page" OnClick="Button1_Click" />
            <br />
        </div>
    </form>
</body>
</html>
