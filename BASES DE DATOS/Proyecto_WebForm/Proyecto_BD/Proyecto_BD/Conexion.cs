using Npgsql;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Windows;

namespace Proyecto_BD
{
    public class Conexion
    {
        static readonly string defaultQuery = "SELECT idHospital, name, contact, moph FROM encuesta.hospital";
        public static NpgsqlConnection AgregarConexion()
        {
            NpgsqlConnection con;
            try
            {
                //con = new NpgsqlConnection("Data Source=JCHICATT\\SQLEXPRESS;Initial Catalog=encuesta;Integrated Security=True");
                con = new NpgsqlConnection("Host=localhost;database=postgres;user id=postgres;password=admin");
                con.Open();
            }
            catch (Exception ex)
            {
                con = null;
                MessageBox.Show(""+ex);
            }
            return con;
        }

        public static void LlenarHospitales(DropDownList dd)
        {
            try
            {
                NpgsqlConnection con = AgregarConexion();
                NpgsqlCommand cmd = new NpgsqlCommand("SELECT name FROM hospital", con);
                NpgsqlDataReader rd = cmd.ExecuteReader();

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
                NpgsqlConnection con = AgregarConexion();
                NpgsqlCommand cmd = new NpgsqlCommand(defaultQuery, con);
                NpgsqlDataReader rd = cmd.ExecuteReader();
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