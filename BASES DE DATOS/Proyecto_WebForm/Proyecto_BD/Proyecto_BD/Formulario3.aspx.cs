using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_BD
{
    public partial class Formulario3 : System.Web.UI.Page
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
                Session["logF3"] = ChangeLog();
                Response.Redirect("Formulario4.aspx");
            }
            else
            {
                Label1.Text = "Verify all inputs are numeric and try again.";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (ValidInput())
            {
                Session["logF3"] = ChangeLog();
                Response.Redirect("Formulario2.aspx");
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
            if (TextBox1.Text.Equals(""))
                TextBox1.Text = "-1";
            return int.TryParse(TextBox1.Text, out _);
        }
        public List<string> ChangeLog()
        {
            List<string> log = new List<string>
            {
                DropDownList1.SelectedIndex.ToString(),
                DropDownList1.SelectedValue,
                DropDownList2.SelectedIndex.ToString(),
                DropDownList2.SelectedValue,
                RadioButtonList1.SelectedIndex.ToString(),
                RadioButtonList2.SelectedIndex.ToString(),
                RadioButtonList3.SelectedIndex.ToString(),
                RadioButtonList4.SelectedIndex.ToString(),
                TextBox1.Text
            };

            return log;
        }
        public void PostLog()
        {
            List<string> log;
            if (Session["logF3"] != null)
            {
                log = (List<string>)Session["logF3"];
                DropDownList1.SelectedIndex = Convert.ToInt32(log[0]);
                DropDownList2.SelectedIndex = Convert.ToInt32(log[2]);
                RadioButtonList1.SelectedIndex = Convert.ToInt32(log[4]);
                RadioButtonList2.SelectedIndex = Convert.ToInt32(log[5]);
                RadioButtonList3.SelectedIndex = Convert.ToInt32(log[6]);
                RadioButtonList4.SelectedIndex = Convert.ToInt32(log[7]);
                TextBox1.Text = log[8];
            }
        }
    }
}