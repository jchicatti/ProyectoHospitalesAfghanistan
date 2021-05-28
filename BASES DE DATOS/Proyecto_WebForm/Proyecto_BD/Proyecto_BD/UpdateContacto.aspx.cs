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
            string id_hospital = Session["id_hospital_update"].ToString();
            Label3.Text = Session["hospital_name"].ToString();

            if (!IsPostBack)
            {
                Conexion.LlenarContactos(DropDownList7, id_hospital);
                Conexion.DatosContactos(GridView1, id_hospital);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String numero = TextBox8.Text;
            String nombre = TextBox9.Text;
            String tipo = DropDownList6.SelectedValue;
            bool isNumeric1 = double.TryParse(numero, out _);

            if (Session["id_hospital_update"] != null)
            {
                int id_hospital = (int)Session["id_hospital_update"];
                if (!numero.Equals(""))
                {
                    if ((isNumeric1 && numero.Length == 10))
                    {
                        if (isNumeric1 && numero.Length == 10)
                        {
                            Telephone t = new Telephone(numero, nombre, tipo, id_hospital);
                            Label1.Text = "Status: " + t.AddTelephone();
                            TextBox8.Text = "";
                            TextBox9.Text = "";
                        }
                    }
                    else
                        Label1.Text = "Status: Verify contact telephone is numeric and 10 digits long.";
                }
                else
                    Label1.Text = "Status: No contact number was provided.";
            }
            else
                Label1.Text = "Status: Error retrieving hospital ID.";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("LoginHospital.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string id_telephone = DropDownList7.SelectedValue.ToString();
            Telephone.ChangeStatus(id_telephone);
            Label2.Text = "Status: status updated successfully!";
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string id_hospital = Session["id_hospital_update"].ToString();
            DropDownList7.Items.Clear();
            Conexion.LlenarContactos(DropDownList7, id_hospital);
            Conexion.DatosContactos(GridView1, id_hospital);
            Label2.Text = "Status: ";
        }

        protected void Button5_Click(object sender, EventArgs e)
        {

        }
    }
}