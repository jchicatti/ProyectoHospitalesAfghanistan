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
            String moph = TextBox4.Text;

            if (!nombre.Equals("") && !dom.Equals("") && !tel.Equals("") && !moph.Equals(""))
            {
                Hospital c = new Hospital(nombre, dom, tel, moph);
                Label1.Text = c.AgregaHospital();
                Session["Nombre"] = nombre;
                //Response.Redirect("Formulario1.aspx");
            }
            else
            {
                Label1.Text = "Fields required.";
            }
            //Response.Redirect(".");
        }
    }
}