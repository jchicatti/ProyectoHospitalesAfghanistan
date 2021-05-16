using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_BD
{
    public partial class Formulario1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PostLog();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ValidInput())
            {
                Session["logF1"] = ChangeLog();
                Response.Redirect("Formulario2.aspx");
            }
            else
            {
                Label1.Text = "Verify all inputs are numeric and try again.";
            }
        }
        private bool ValidInput()
        {
            if (TextBox2.Text.Equals(""))
                TextBox2.Text = "-1";
            if (TextBox3.Text.Equals(""))
                TextBox3.Text = "-1";
            return int.TryParse(TextBox2.Text, out _) && int.TryParse(TextBox3.Text, out _);
        }
        private List<string> ChangeLog()
        {
            List<string> log = new List<string>
            {
                DropDownList1.SelectedIndex.ToString(),
                DropDownList1.SelectedValue,
                TextBox2.Text,
                TextBox3.Text
            };

            return log;
        }
        private void PostLog()
        {
            List<string> log;
            if (Session["logF1"] != null)
            {
                log = (List<string>)Session["logF1"];
                DropDownList1.SelectedIndex = Convert.ToInt32(log[0]);
                TextBox2.Text = log[2];
                TextBox3.Text = log[3];
            }
        }
    }
}