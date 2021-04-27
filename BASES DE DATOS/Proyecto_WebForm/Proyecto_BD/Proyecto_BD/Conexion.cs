using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace Proyecto_BD
{
    public class Conexion
    {
        static readonly string defaultQuery = "SELECT idHospital AS 'Reg. Number', name AS 'Name', contact AS 'Contact', moph AS 'MOPH Number' FROM hospital";
        public static SqlConnection AgregarConexion()
        {
            SqlConnection con;
            try
            {
                con = new SqlConnection("Data Source=JCHICATT\\SQLEXPRESS;Initial Catalog=encuesta;Integrated Security=True");
                con.Open();
            }
            catch (Exception)
            {
                con = null;
            }
            return con;
        }

        public static void LlenarHospitales(DropDownList dd)
        {
            try
            {
                SqlConnection con = AgregarConexion();
                SqlCommand cmd = new SqlCommand("SELECT name FROM hospital", con);
                SqlDataReader rd = cmd.ExecuteReader();

                while (rd.Read())
                {
                    dd.Items.Add(rd["name"].ToString());
                }
                rd.Close();
                con.Close();
            }
            catch (Exception)
            {
            }
        }
        public static void InventarioTotal(GridView gv)
        {
            try
            {
                SqlConnection con = AgregarConexion();
                SqlCommand cmd = new SqlCommand(defaultQuery, con);
                SqlDataReader rd = cmd.ExecuteReader();
                gv.DataSource = rd;
                gv.DataBind();
                rd.Close();
            }
            catch (Exception)
            {
            }
        }

    }
}