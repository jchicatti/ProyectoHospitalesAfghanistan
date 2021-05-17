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
            TextBox10.Text = "";
            String numero_1 = TextBox3.Text;
            String numero_2 = TextBox6.Text;
            String numero_3 = TextBox8.Text;
            String nombre_1 = TextBox5.Text;
            String nombre_2 = TextBox7.Text;
            String nombre_3 = TextBox9.Text;
            String tipo_1 = DropDownList8.SelectedValue;
            String tipo_2 = DropDownList7.SelectedValue;
            string tipo_3 = DropDownList6.SelectedValue;
            bool isNumeric1 = double.TryParse(numero_1, out _);
            bool isNumeric2 = double.TryParse(numero_2, out _);
            bool isNumeric3 = double.TryParse(numero_3, out _);
            TextBox10.Visible = true;

            if (Session["id_hospital_update"] != null)
            {
                int id_hospital = (int)Session["id_hospital_update"];
                if (!numero_1.Equals("") || !numero_2.Equals("") || !numero_3.Equals(""))
                {
                    if ((isNumeric1 && numero_1.Length == 10) || (isNumeric2 && numero_2.Length == 10) || (isNumeric3 && numero_3.Length == 10))
                    {
                        if (isNumeric1 && numero_1.Length == 10)
                        {
                            Telephone t = new Telephone(numero_1, nombre_1, tipo_1, id_hospital);
                            TextBox10.Text += t.AddTelephone();
                        }
                        if (isNumeric2 && numero_2.Length == 10)
                        {
                            Telephone t = new Telephone(numero_2, nombre_2, tipo_2, id_hospital);
                            TextBox10.Text += t.AddTelephone();
                        }
                        if (isNumeric3 && numero_3.Length == 10)
                        {
                            Telephone t = new Telephone(numero_3, nombre_3, tipo_3, id_hospital);
                            TextBox10.Text += t.AddTelephone();
                        }
                    }
                    else
                        TextBox10.Text = "Verify contact telephone is numeric and 10 digits long.";
                }
                else
                    TextBox10.Text = "At least 1 contact telephone is required.";
            }
            else
                TextBox10.Text = "Error retrieving hospital ID.";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginHospital.aspx");
        }
    }
}