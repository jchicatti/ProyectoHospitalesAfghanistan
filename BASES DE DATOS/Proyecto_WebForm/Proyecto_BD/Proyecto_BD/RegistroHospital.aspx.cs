using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_BD
{
    public partial class Registro_Hospital : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Conexion.LlenarHospitales(DropDownList1);
                Conexion.InventarioTotal(GridView1);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String nombre = TextBox1.Text;
            String dom = TextBox2.Text;
            String tel = TextBox3.Text;
            String moph = TextBox13.Text;
            String numero_1 = TextBox3.Text;
            String numero_2 = TextBox6.Text;
            String numero_3 = TextBox8.Text;
            String nombre_1 = TextBox5.Text;
            String nombre_2 = TextBox7.Text;
            String nombre_3 = TextBox9.Text;
            String tipo_1 = DropDownList8.Text;
            String tipo_2 = DropDownList7.Text;
            String tiepo_3 = DropDownList6.Text;
            String latitud = TextBox10.Text;
            String longitud = TextBox11.Text;
            String altitud = TextBox12.Text;
            String tipo_hospital = DropDownList3.Text;
            String distrito = DropDownList2.Text;

            if (!nombre.Equals("") && !dom.Equals("") && !tel.Equals("") && !moph.Equals(""))
            {
                Hospital c = new Hospital(nombre, dom, tel, moph);
                Label1.Text = c.AgregaHospital();
                Session["Nombre"] = nombre;
                Response.Redirect("Formulario1.aspx");
            }
            else
            {
                Label1.Text = "Fields required.";
            }
            //Response.Redirect(".");
        }
    }
}