<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormularioResumen.aspx.cs" Inherits="Proyecto_BD.FormularioResumen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Update Report<br />
            <br />
            Update Status<br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                <asp:ListItem Value="1">QUESTIONNAIRE COMPLETED</asp:ListItem>
                <asp:ListItem Value="2">QUESTIONNAIRE COMPLETED PARTIALLY</asp:ListItem>
                <asp:ListItem Value="3">QUESTIONNAIRE NOT DONE</asp:ListItem>
                <asp:ListItem Value="4">THIS WAS A TEST</asp:ListItem>
                <asp:ListItem Value="5">OTHER</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            Comments:
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            Problem Status<br />
            <asp:RadioButtonList ID="RadioButtonList2" runat="server">
                <asp:ListItem Value="1">NO PROBLEM</asp:ListItem>
                <asp:ListItem Value="2">SOME DATA IS MISSING</asp:ListItem>
                <asp:ListItem Value="3">REFUSED TO SPEAK</asp:ListItem>
                <asp:ListItem Value="4">WRONG PHONE NUMBER</asp:ListItem>
                <asp:ListItem Value="5">DOCTOR HAS QUIT</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            Action Status<br />
            <asp:RadioButtonList ID="RadioButtonList3" runat="server">
                <asp:ListItem Value="1">NO ADDITIONAL ACTION NEEDED</asp:ListItem>
                <asp:ListItem Value="2">CALL BACK TOMORROW</asp:ListItem>
                <asp:ListItem Value="3">FIND NEW PHONE NUMBER</asp:ListItem>
                <asp:ListItem Value="4">AUTHORIZATION</asp:ListItem>
                <asp:ListItem Value="5">OTHER</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            Comments:
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="Last Page" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Finish Update" />
        </div>
    </form>
</body>
</html>
