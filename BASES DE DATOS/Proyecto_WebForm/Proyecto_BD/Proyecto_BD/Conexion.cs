using Npgsql;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace Proyecto_BD
{
    public class Conexion
    {
        static readonly string defaultQuery = "SELECT * FROM hospital";
        public static NpgsqlConnection AgregarConexion()
        {
            NpgsqlConnection con;
            try
            {
                //con = new NpgsqlConnection("Data Source=JCHICATT\\SQLEXPRESS;Initial Catalog=encuesta;Integrated Security=True");
                con = new NpgsqlConnection("Host=localhost;database=bla;user id=postgres;password=admin");
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
                NpgsqlConnection con = AgregarConexion();
                NpgsqlCommand cmd = new NpgsqlCommand("SELECT hospital_name FROM hospital", con);
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
                NpgsqlCommand cmd = new NpgsqlCommand("SELECT * FROM hospital", con);
                NpgsqlDataReader rd = cmd.ExecuteReader();
                gv.DataSource = rd;
                gv.DataBind();
                rd.Close();
            }
            catch (Exception)
            {
            }
        }
        public static void LlenarProvincias(DropDownList dd)
        {
            try
            {
                NpgsqlConnection con = AgregarConexion();
                NpgsqlCommand cmd = new NpgsqlCommand("SELECT province_name FROM Province", con);
                NpgsqlDataReader rd = cmd.ExecuteReader();

                while (rd.Read())
                {
                    dd.Items.Add(rd["province_name"].ToString());
                }
                rd.Close();
                con.Close();
            }
            catch (Exception)
            {
            }
        }
        public static void LlenarDistritos(DropDownList dd)
        {
            try
            {
                NpgsqlConnection con = AgregarConexion();
                NpgsqlCommand cmd = new NpgsqlCommand("SELECT district_name FROM district", con);
                NpgsqlDataReader rd = cmd.ExecuteReader();

                while (rd.Read())
                {
                    dd.Items.Add(rd["district_name"].ToString());
                }
                rd.Close();
                con.Close();
            }
            catch (Exception)
            {
            }
        }
    }
}