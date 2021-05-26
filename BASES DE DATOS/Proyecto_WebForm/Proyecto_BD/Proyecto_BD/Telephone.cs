using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto_BD
{
    public class Telephone
    {
        private int id_telephone { get; set; }
        private string telephone { get; set; }
        private string contact_name { get; set; }
        private string phone_type { get; set; }
        private int id_hospital { get; set; }
        private bool isActive { get; set; }

        public Telephone(string telephone, string contact_name, string phone_type, int id_hospital)
        {
            this.telephone = telephone;
            this.contact_name = contact_name;
            this.phone_type = phone_type;
            this.id_hospital = id_hospital;
        }

        public String AddTelephone()
        {
            String res;

            try
            {
                NpgsqlConnection con2 = Conexion.AgregarConexion();
                String query2 = String.Format("insert into telephone(telephone, contact_name, phone_type, id_hospital, active) values('{0}', '{1}', '{2}', {3}, true)",
                    this.telephone, this.contact_name, this.phone_type, this.id_hospital);
                NpgsqlCommand cmd2 = new NpgsqlCommand(query2, con2);
                int a = cmd2.ExecuteNonQuery();
                if (a > 0)
                    res = "\n Telephone added succesfully!";
                else
                    res = "Connection error";
                con2.Close();
            }
            catch (Exception e)
            {
                res = e.Message;
            }
            return res;
        }
        public static void ChangeStatus(string id_telephone)
        {
            int status = -1;

            try
            {
                NpgsqlConnection con = Conexion.AgregarConexion();
                String query = String.Format("select cast(active as int) from telephone where id_telephone = '{0}'", id_telephone);
                NpgsqlCommand cmd = new NpgsqlCommand(query, con);
                NpgsqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    status = rd.GetInt32(0);
                    con.Close();
                }
                rd.Close();


                if (status == 0)
                {
                    NpgsqlConnection con2 = Conexion.AgregarConexion();
                    String query2 = String.Format("update telephone set active = true where id_telephone = '{0}'", id_telephone);
                    NpgsqlCommand cmd2 = new NpgsqlCommand(query2, con2);
                    cmd2.ExecuteNonQuery();
                    con2.Close();
                }
                else 
                {
                    NpgsqlConnection con2 = Conexion.AgregarConexion();
                    String query2 = String.Format("update telephone set active = false where id_telephone = '{0}'", id_telephone);
                    NpgsqlCommand cmd2 = new NpgsqlCommand(query2, con2);
                    cmd2.ExecuteNonQuery();
                    con2.Close();
                }

            }

            catch (Exception)
            {

            }
        }
    }
}