<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormularioResumen.aspx.cs" Inherits="Proyecto_BD.FormularioResumen" %>

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
            <h2>Update Report</h2><br />
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
            <br />
            <asp:TextBox ID="TextBox4" runat="server" Width="575px"></asp:TextBox>
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
            Comments:<br />
&nbsp;<asp:TextBox ID="TextBox5" runat="server" Width="607px"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="buttonl" Text="Previous Page" OnClick="Button2_Click" />
            <asp:Button ID="Button1" runat="server" CssClass="buttonr" Text="Finish Update" OnClick="Button1_Click" />
            <br />
            <br />
        </div>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
