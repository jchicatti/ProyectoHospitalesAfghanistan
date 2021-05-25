using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_BD
{
    public partial class LoginHospital1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DropDownList2.SelectedIndex = 0;
            if (!IsPostBack)
            {
                DropDownList2.SelectedIndex = 0;
                string hospital_name = DropDownList1.SelectedValue;
                DropDownList2.Items.Clear();
                Conexion.LlenarHospitales(DropDownList1);
                Conexion.InventarioTotal(GridView1);
                Conexion.MophList(DropDownList2, hospital_name);
            }
            string name = DropDownList1.SelectedValue;
            Conexion.MophList(DropDownList2, name);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["id_hospital_update"] = Conexion.ObtenerId(DropDownList2.SelectedValue);
            Response.Redirect("Formulario1.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Session["id_hospital_update"] = Conexion.ObtenerId(DropDownList2.SelectedValue);
            Session["hospital_name"] = DropDownList1.SelectedValue;
            Response.Redirect("UpdateContacto.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string hospital_name = DropDownList1.SelectedValue;
            DropDownList2.Items.Clear();
            Conexion.MophList(DropDownList2, hospital_name);
        }
    }
}