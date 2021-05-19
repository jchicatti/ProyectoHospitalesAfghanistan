using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_BD
{
    public partial class Formulario5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PostLog();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ValidInput())
            {
                Session["logF5"] = ChangeLog();
                Conexion.finished5 = true;
                Response.Redirect("Formulario6.aspx");
            }
            else
            {
                Label1.Text = "Verify inputs are numeric and try again.";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (ValidInput())
            {
                Session["logF5"] = ChangeLog();
                Conexion.finished5 = true;
                Response.Redirect("Formulario4.aspx");
            }
            else
            {
                Label1.Text = "Verify inputs are numeric and try again.";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }
        private bool ValidInput()
        {
            if (TextBox5.Text.Equals(""))
                TextBox5.Text = "-1";
            if (TextBox6.Text.Equals(""))
                TextBox6.Text = "-1";
            return int.TryParse(TextBox5.Text, out _) && int.TryParse(TextBox6.Text, out _);
        }
        private List<string> ChangeLog()
        {
            List<string> log = new List<string>
            {
                TextBox5.Text,
                TextBox6.Text
            };

            return log;
        }
        public void PostLog()
        {
            List<string> log;
            if (Session["logF5"] != null)
            {
                log = (List<string>)Session["logF5"];
                TextBox5.Text = log[0];
                TextBox6.Text = log[1];
            }
        }
    }
}