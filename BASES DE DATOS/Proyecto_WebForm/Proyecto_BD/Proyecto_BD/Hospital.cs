using Npgsql;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Proyecto_BD
{
    public class Hospital
    {
        public int idHospital { get; set; }
        public String name { get; set; }
        public String adress { get; set; }
        public String contact { get; set; }
        public String moph { get; set; }

        public Hospital()
        {
        }

        public Hospital(string name, string adress, string contact, string moph)
        {
            this.name = name;
            this.adress = adress;
            this.contact = contact;
            this.moph = moph;
        }

        public String AgregaHospital()
        {
            String res;
            int contID;

            try
            {
                String query = "SELECT max(idHospital) FROM encuesta.hospital";
                NpgsqlConnection con = Conexion.AgregarConexion();
                NpgsqlCommand cmd = new NpgsqlCommand(query, con);
                NpgsqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    try
                    {
                        contID = rd.GetInt32(0);
                        con.Close();
                    }
                    catch (Exception)
                    {
                        contID = 0;
                    }
                }
                else
                    contID = 0;
                contID++;

                NpgsqlConnection con2 = Conexion.AgregarConexion();
                String query2 = String.Format("INSERT INTO encuesta.hospital VALUES({0},'{1}','{2}','{3}','{4}')",
                    contID, this.name, this.adress, this.contact, this.moph);
                NpgsqlCommand cmd2 = new NpgsqlCommand(query2, con2);
                int a = cmd2.ExecuteNonQuery();
                if (a > 0)
                    res = "Registration succesful!";
                else
                    res = "Connection error";
            }
            catch (Exception e)
            {
                res = e.Message;
            }

            return res;
        }
        
        /*public int ObtenerId()
        {
            int res = -1;

            try
            {
                SqlConnection con = Conexion.AgregarConexion();
                SqlCommand cmd = new SqlCommand(String.Format("SELECT idCliente FROM cliente WHERE nombre='{0}'", this.name), con);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    res = rd.GetInt32(0);
                    con.Close();
                }
                rd.Close();
            }
            catch (Exception)
            { }

            return res;
        }*/
    }
}