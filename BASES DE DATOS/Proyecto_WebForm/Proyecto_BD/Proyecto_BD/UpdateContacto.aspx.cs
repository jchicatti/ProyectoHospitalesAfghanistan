using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_BD
{
    public partial class UpdateContacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String numero_1 = TextBox3.Text;
            String numero_2 = TextBox6.Text;
            String numero_3 = TextBox8.Text;
            String nombre_1 = TextBox5.Text;
            String nombre_2 = TextBox7.Text;
            String nombre_3 = TextBox9.Text;
            String tipo_1 = DropDownList8.SelectedValue;
            String tipo_2 = DropDownList7.SelectedValue;
            String tiepo_3 = DropDownList6.SelectedValue;

            Label1.Text = "Contact details have been updated correctly.";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginHospital.aspx");
        }
    }
}