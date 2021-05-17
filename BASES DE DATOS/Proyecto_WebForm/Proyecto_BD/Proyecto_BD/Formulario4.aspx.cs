using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_BD
{
    public partial class Formulario4 : System.Web.UI.Page
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
            if (ValidInput())
            {
                Session["logF4"] = ChangeLog();
                Response.Redirect("Formulario3.aspx");
            }
            else
            {
                Label1.Text = "Verify all inputs are numeric and try again.";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ValidInput())
            {
                Session["logF4"] = ChangeLog();
                Response.Redirect("Formulario5.aspx");
            }
            else
            {
                Label1.Text = "Verify all inputs are numeric and try again.";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }
        private bool ValidInput()
        {
            if (TextBox2.Text.Equals(""))
                TextBox2.Text = "-1";
            if (TextBox3.Text.Equals(""))
                TextBox3.Text = "-1";
            if (TextBox4.Text.Equals(""))
                TextBox4.Text = "-1";
            if (TextBox5.Text.Equals(""))
                TextBox5.Text = "-1";
            if (TextBox6.Text.Equals(""))
                TextBox6.Text = "-1";
            if (TextBox7.Text.Equals(""))
                TextBox7.Text = "-1";
            if (TextBox8.Text.Equals(""))
                TextBox8.Text = "-1";
            return int.TryParse(TextBox2.Text, out _) && int.TryParse(TextBox3.Text, out _) && int.TryParse(TextBox4.Text, out _) && int.TryParse(TextBox5.Text, out _)
                && int.TryParse(TextBox6.Text, out _) && int.TryParse(TextBox7.Text, out _) && int.TryParse(TextBox8.Text, out _);
        }
        public List<string> ChangeLog()
        {
            List<string> log = new List<string>
            {
                "",
                "",
                TextBox2.Text,
                TextBox3.Text,
                TextBox4.Text,
                TextBox5.Text,
                TextBox6.Text,
                TextBox7.Text,
                TextBox8.Text
            };

            return log;
        }
        public void PostLog()
        {
            List<string> log;
            if (Session["logF4"] != null)
            {
                log = (List<string>)Session["logF4"];
                TextBox2.Text = log[2];
                TextBox3.Text = log[3];
                TextBox4.Text = log[4];
                TextBox5.Text = log[5];
                TextBox6.Text = log[6];
                TextBox7.Text = log[7];
                TextBox8.Text = log[8];
            }
        }
    }
}