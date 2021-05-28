using Npgsql;
using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace Proyecto_BD
{
    public class Conexion
    {
        public static bool finished1;
        public static bool finished2;
        public static bool finished3;
        public static bool finished4;
        public static bool finished5;
        public static bool finished6;

        public static NpgsqlConnection AgregarConexion()
        {
            NpgsqlConnection con;
            try
            {
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
                NpgsqlCommand cmd = new NpgsqlCommand("SELECT hospital_name FROM hospital order by id_hospital desc", con);
                NpgsqlDataReader rd = cmd.ExecuteReader();

                while (rd.Read())
                {
                    dd.Items.Add(rd["hospital_name"].ToString());
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
                NpgsqlCommand cmd = new NpgsqlCommand("SELECT hospital_name , address , latitude, longitude, district, province, hospital_type, moph_number" +
                    " FROM hospital order by id_hospital desc", con);
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
        public static void EnumFunds(DropDownList dd)
        {
            try
            {
                NpgsqlConnection con = AgregarConexion();
                NpgsqlCommand cmd = new NpgsqlCommand("select unnest(enum_range(null::funds_enum))", con);
                NpgsqlDataReader rd = cmd.ExecuteReader();

                while (rd.Read())
                {
                    dd.Items.Add(rd["unnest"].ToString());
                }
                rd.Close();
                con.Close();
            }
            catch (Exception)
            {
            }
        }
        public static void EnumHospitalType(DropDownList dd)
        {
            try
            {
                NpgsqlConnection con = AgregarConexion();
                NpgsqlCommand cmd = new NpgsqlCommand("select unnest(enum_range(null::hospital_type_enum))", con);
                NpgsqlDataReader rd = cmd.ExecuteReader();

                while (rd.Read())
                {
                    dd.Items.Add(rd["unnest"].ToString());
                }
                rd.Close();
                con.Close();
            }
            catch (Exception)
            {
            }
        }
        public static void EnumResourceType(DropDownList dd)
        {
            try
            {
                NpgsqlConnection con = AgregarConexion();
                NpgsqlCommand cmd = new NpgsqlCommand("select unnest(enum_range(null::resource_type_enum))", con);
                NpgsqlDataReader rd = cmd.ExecuteReader();

                while (rd.Read())
                {
                    dd.Items.Add(rd["unnest"].ToString());
                }
                rd.Close();
                con.Close();
            }
            catch (Exception)
            {
            }
        }
        public static void MophList(DropDownList dd, string hospital_name)
        {
            try
            {
                NpgsqlConnection con = AgregarConexion();
                NpgsqlCommand cmd = new NpgsqlCommand("select moph_number from hospital h where h.hospital_name='" + hospital_name + "'", con);
                NpgsqlDataReader rd = cmd.ExecuteReader();

                while (rd.Read())
                {
                    dd.Items.Add(rd["moph_number"].ToString());
                }
                rd.Close();
                con.Close();
            }
            catch (Exception)
            {
            }
        }
        public static void id_VM (DropDownList dd)
        {
            try
            {
                NpgsqlConnection con = AgregarConexion();
                NpgsqlCommand cmd = new NpgsqlCommand(String.Format("select id_personel_vm, employee_name from personel_vm;"), con);
                NpgsqlDataReader rd = cmd.ExecuteReader();
                dd.DataSource = rd;
                dd.DataValueField = "id_personel_vm";
                dd.DataTextField = "employee_name";
                dd.DataBind();
                con.Close();
            }
            catch (Exception)
            {
            }
        }
        public static int ObtenerId(string moph)
        {
            int res = -1;

            try
            {
                NpgsqlConnection con = Conexion.AgregarConexion();
                NpgsqlCommand cmd = new NpgsqlCommand(String.Format("select id_hospital from hospital h where h.moph_number='{0}'", moph), con);
                NpgsqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    res = rd.GetInt32(0);
                    con.Close();
                }
                rd.Close();
            }
            catch (Exception)
            {
            }

            return res;
        }
        public static void LlenarContactos(DropDownList dd, string id_hospital)
        {
            try
            {
                NpgsqlConnection con = AgregarConexion();
                NpgsqlCommand cmd = new NpgsqlCommand(String.Format("select id_telephone, contact_name from telephone where id_hospital = '{0}'", id_hospital), con);
                NpgsqlDataReader rd = cmd.ExecuteReader();
                dd.DataSource = rd;
                dd.DataValueField = "id_telephone";
                dd.DataTextField = "contact_name";
                dd.DataBind();
                con.Close();
            }
            catch (Exception)
            {
            }
        }
        
        public static void DatosContactos(GridView gv, string id_hospital)
        {
            try
            {
                NpgsqlConnection con = AgregarConexion();
                NpgsqlCommand cmd = new NpgsqlCommand(String.Format("select contact_name, telephone, phone_type, " +
                    "active from telephone where id_hospital = '{0}' order by active desc ", id_hospital), con);
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