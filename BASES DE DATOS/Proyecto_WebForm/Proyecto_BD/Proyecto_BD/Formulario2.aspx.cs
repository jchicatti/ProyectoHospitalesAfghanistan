using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_BD
{
    public partial class Formulario2 : System.Web.UI.Page
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
            Session["logF2"] = ChangeLog();
            Response.Redirect("Formulario3.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["logF2"] = ChangeLog();
            Response.Redirect("Formulario1.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }
        public List<string> ChangeLog()
        {
            List<string> log = new List<string>
            {
                DropDownList1.SelectedIndex.ToString(),
                DropDownList1.SelectedValue,
                DropDownList2.SelectedIndex.ToString(),
                DropDownList2.SelectedValue,
                DropDownList3.SelectedIndex.ToString(),
                DropDownList3.SelectedValue,
                DropDownList4.SelectedIndex.ToString(),
                DropDownList4.SelectedValue,
                DropDownList5.SelectedIndex.ToString(),
                DropDownList5.SelectedValue,
                DropDownList6.SelectedIndex.ToString(),
                DropDownList6.SelectedValue
            };

            return log;
        }
        public void PostLog()
        {
            List<string> log;
            if (Session["logF2"] != null)
            {
                log = (List<string>)Session["logF2"];
                DropDownList1.SelectedIndex = Convert.ToInt32(log[0]);
                DropDownList2.SelectedIndex = Convert.ToInt32(log[2]);
                DropDownList3.SelectedIndex = Convert.ToInt32(log[4]);
                DropDownList4.SelectedIndex = Convert.ToInt32(log[6]);
                DropDownList5.SelectedIndex = Convert.ToInt32(log[8]);
                DropDownList6.SelectedIndex = Convert.ToInt32(log[10]);
            }
        }
    }
}