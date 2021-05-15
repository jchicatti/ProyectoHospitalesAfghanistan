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
            PostLog();
            if (!IsPostBack)
            {
                Conexion.LlenarHospitales(DropDownList1);
                Conexion.InventarioTotal(GridView1);
                Conexion.LlenarDistritos(DropDownList3);
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["log"] = ChangeLog();
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
                Session["log"] = ChangeLog();
                Response.Redirect("Formulario1.aspx");
            }
            else
            {
                Label1.Text = "Fields required.";
            }
        }
        public List<string> ChangeLog()
        {
            List<string> log = new List<string>
            {
                "",
                TextBox1.Text,
                TextBox2.Text,
                TextBox3.Text,
                //TextBox4.Text,
                "",
                TextBox5.Text,
                TextBox6.Text,
                TextBox7.Text,
                TextBox8.Text,
                TextBox9.Text,
                TextBox10.Text,
                TextBox11.Text,
                TextBox12.Text
            };

            return log;
        }
        public void PostLog()
        {
            List<string> log;
            if (Session["log"] != null)
            {
                log = (List<string>)Session["log"];
                TextBox1.Text = log[1];
                TextBox2.Text = log[2];
                TextBox3.Text = log[3];
                //TextBox4.Text = log[4];
                TextBox5.Text = log[5];
                TextBox6.Text = log[6];
                TextBox7.Text = log[7];
                TextBox8.Text = log[8];
                TextBox9.Text = log[9];
                TextBox10.Text = log[10];
                TextBox11.Text = log[11];
                TextBox12.Text = log[12];
            }
        }
    }
}