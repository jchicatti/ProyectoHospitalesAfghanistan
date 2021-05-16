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
        private int idHospital { get; set; }
        private string name { get; set; }
        private string address { get; set; }
        private double latitude { get; set; }
        private double longitude { get; set; }
        private int district { get; set; }
        private int province { get; set; }
        private string type { get; set; }
        private string moph { get; set; }

        public Hospital()
        {
        }

        public Hospital(string name, string address, double latitude, double longitude, int district, int province, string type, string moph)
        {
            this.name = name;
            this.address = address;
            this.latitude = latitude;
            this.longitude = longitude;
            this.district = district;
            this.province = province;
            this.type = type;
            this.moph = moph;
        }

        public String AgregaHospital()
        {
            String res;
            int contID;

            try
            {
                NpgsqlConnection con2 = Conexion.AgregarConexion();
                String query2 = String.Format("INSERT INTO Hospital (hospital_name, address, latitude, longitude, district, province, hospital_type, MOPH_number) " +
                    "VALUES('{0}','{1}',{2},{3},{4},{5},'{6}','{7}')",
                    this.name, this.address, this.latitude, this.longitude,
                    this.district, this.province, this.type, this.moph);
                NpgsqlCommand cmd2 = new NpgsqlCommand(query2, con2);
                int a = cmd2.ExecuteNonQuery();
                if (a > 0)
                {
                    String query = "SELECT max(id_hospital) FROM Hospital";
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
                    res = "Registration succesful!" + " ID: " + contID;
                }
                else
                    res = "Connection error";
            }
            catch (Exception e)
            {
                res = e.Message;
            }

            return res;
        }
    }
}