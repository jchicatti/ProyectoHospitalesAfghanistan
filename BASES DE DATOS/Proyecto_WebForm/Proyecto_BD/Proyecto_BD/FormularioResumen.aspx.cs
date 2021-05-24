using System;
using System.Collections.Generic;
using Npgsql;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_BD
{
    public partial class FormularioResumen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Formulario6.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBox6.Text = AttemptMainInsert();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }
        private string AttemptMainInsert()
        {
            List<string> logF1 = (List<string>)Session["logF1"];
            List<string> logF2 = (List<string>)Session["logF2"];
            List<string> logF3 = (List<string>)Session["logF3"];
            List<string> logF4 = (List<string>)Session["logF4"];
            List<string> logF5 = (List<string>)Session["logF5"];
            List<string> logF6 = (List<string>)Session["logF6"];
            String res = "";

            if (logF1 != null && logF2 != null && logF3 != null && logF4 != null && logF5 != null && logF6 != null)
            {
                if (Conexion.finished1 && Conexion.finished3 && Conexion.finished4 && Conexion.finished5)
                {
                    //TABLA: Update_hospital
                    string name_responder = "John Doe";
                    int id_personel_vm = 1;
                    int id_questionnare_status = RadioButtonList1.SelectedIndex + 1;
                    int id_hospital = (int)Session["id_hospital_update"];
                    int id_problem_status = RadioButtonList2.SelectedIndex + 1;
                    int id_action_status = RadioButtonList3.SelectedIndex + 1;
                    string funds = logF3[1];
                    string additional_comments = TextBox4.Text + " " + TextBox5.Text;

                    //TABLA: Inventory (Counts)
                    bool isNumeric1 = int.TryParse(logF6[1], out int oxygen);
                    bool isNumeric2 = int.TryParse(logF6[3], out int antipyr);
                    bool isNumeric3 = int.TryParse(logF6[5], out int anesth);
                    bool isNumeric4 = int.TryParse(logF6[7], out int alcohol);
                    bool isNumeric5 = int.TryParse(logF2[1], out int masks);
                    bool isNumeric6 = int.TryParse(logF2[3], out int gloves);
                    bool isNumeric7 = int.TryParse(logF2[5], out int hats);
                    bool isNumeric8 = int.TryParse(logF2[7], out int aprons);
                    bool isNumeric9 = int.TryParse(logF2[9], out int visors);
                    bool isNumeric10 = int.TryParse(logF2[11], out int covers);
                    bool isNumeric11 = int.TryParse(logF1[1], out int tests);
                    int[] counts = { oxygen, antipyr, anesth, alcohol, masks, gloves, hats, aprons, visors, covers, tests };

                    //TABLA: Protocol
                    int screening = Convert.ToInt32(logF3[4]);
                    int awareness = Convert.ToInt32(logF3[5]);
                    bool isNumeric12 = int.TryParse(logF4[2], out int avg_test_result);
                    int testcapacity = Convert.ToInt32(logF3[6]);
                    int tracking = Convert.ToInt32(logF3[7]);
                    int moph_report = Convert.ToInt32(logF3[3]);

                    //TABLA: Personel
                    bool isNumeric13 = int.TryParse(logF5[0], out int no_doctors);
                    bool isNumeric14 = int.TryParse(logF5[1], out int no_paramedics);

                    //TABLA: COVID_Cases
                    bool isNumeric15 = int.TryParse(logF4[3], out int symptomatics);
                    bool isNumeric16 = int.TryParse(logF4[4], out int positives);
                    bool isNumeric17 = int.TryParse(logF4[5], out int icu);
                    bool isNumeric18 = int.TryParse(logF4[6], out int covid_deaths);
                    bool isNumeric19 = int.TryParse(logF4[7], out int non_covid_deaths);
                    bool isNumeric20 = int.TryParse(logF4[8], out int covid_recovered);
                    bool isNumeric21 = int.TryParse(logF3[8], out int phc_referred);

                    //Insert update
                    NpgsqlConnection con1 = Conexion.AgregarConexion();
                    String query1 = String.Format("insert into update_hospital (name_responder, id_personel_vm, id_questionnare_status," +
                        " id_hospital, id_problem_status, id_action_status, funds, additional_comments, update_date) " +
                        "VALUES('{0}', {1}, {2}, {3}, {4}, {5}, '{6}', '{7}', (select current_timestamp))", name_responder, id_personel_vm, id_questionnare_status,
                        id_hospital, id_problem_status, id_action_status, funds, additional_comments);
                    NpgsqlCommand cmd1 = new NpgsqlCommand(query1, con1);

                    int id_update = 0;

                    if (isNumeric1 && isNumeric2 && isNumeric3 && isNumeric4 && isNumeric5 && isNumeric6 && isNumeric7 && isNumeric8 && isNumeric9 && isNumeric10 && isNumeric11
                        && isNumeric12 && isNumeric13 && isNumeric14 && isNumeric15 && isNumeric16 && isNumeric17 && isNumeric18 && isNumeric19 && isNumeric20 && isNumeric21
                        && id_questionnare_status >= 1 && id_problem_status >= 1 && id_action_status >= 1
                        && ib(screening) && ib(awareness) && ib(testcapacity) && ib(tracking) && ib(moph_report))
                        /*
                         * ib(int b) verifica que el numero sea booleano (0 o 1) osea que se hayan contestado
                         * los YES or NO del questionario. Si ib() es falso entonces no se rellenaron esos campos.
                         */ 
                        //Quitar los nuleables de aquí
                    {
                        int a = cmd1.ExecuteNonQuery();
                        if (a > 0)
                        {
                            String query = "SELECT max(id_update) FROM update_hospital uh";
                            NpgsqlConnection con = Conexion.AgregarConexion();
                            NpgsqlCommand cmd = new NpgsqlCommand(query, con);
                            NpgsqlDataReader rd = cmd.ExecuteReader();
                            if (rd.Read())
                            {
                                try
                                {
                                    id_update = rd.GetInt32(0);
                                    con.Close();
                                }
                                catch (Exception)
                                {
                                    id_update = 1;
                                }
                            }
                            else
                                id_update = 1;
                            res += "Updated succesfully! ";
                        }
                        else
                            res = "Connection error.";
                    }

                    //Else if
                    if (isNumeric13 && isNumeric14) { }

                    if (id_questionnare_status >= 1 && id_problem_status >= 1 && id_action_status >= 1) { }

                    if (isNumeric1 && isNumeric2 && isNumeric3 && isNumeric4 && isNumeric5 && isNumeric6 && isNumeric7 && isNumeric8 && isNumeric9 && isNumeric10 && isNumeric11) { }

                    if (ib(screening) && ib(awareness) && isNumeric12 && ib(testcapacity) && ib(tracking) && ib(moph_report)) { }

                    if (isNumeric15 && isNumeric16 && isNumeric17 && isNumeric18 && isNumeric19 && isNumeric20 && isNumeric21) { }

                    con1.Close();

                    //Insert protocol
                    NpgsqlConnection con3 = Conexion.AgregarConexion();
                    String query3 = String.Format("insert into protocol (id_update, covid_screening, covid_awareness, avg_test_result_time, test_capacity, covid_tracking, moph_report) " +
                        "VALUES({0}, {1}, {2}, {3}, {4}, {5}, {6})", 
                        id_update, tof(screening), tof(awareness), avg_test_result, tof(testcapacity), tof(tracking), tof(moph_report));
                    NpgsqlCommand cmd3 = new NpgsqlCommand(query3, con3);

                    //Insert personel
                    NpgsqlConnection con4 = Conexion.AgregarConexion();
                    String query4 = String.Format("insert into personel (id_update, no_doctors, no_paramedics) " +
                        "VALUES({0}, {1}, {2})",
                        id_update, no_doctors, no_paramedics);
                    NpgsqlCommand cmd4 = new NpgsqlCommand(query4, con4);

                    //Insert covid_cases
                    NpgsqlConnection con5 = Conexion.AgregarConexion();
                    String query5 = String.Format("insert into covid_cases (id_update, patients_with_symptoms, positive_patients, intensive_care, covid_deaths, non_covid_deaths, covid_recovered, phc_referred) " +
                        "VALUES({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7})",
                        id_update, symptomatics, positives, icu, covid_deaths, non_covid_deaths, covid_recovered, phc_referred);
                    NpgsqlCommand cmd5 = new NpgsqlCommand(query5, con5);

                    /*
                     * Este IF checa que sí se haya insertado un update para
                     * empezar a meterle la información ahí.
                     * 
                     */
                    if (id_update > 0) {
                        int a3 = cmd3.ExecuteNonQuery();
                        int a4 = cmd4.ExecuteNonQuery();
                        int a5 = cmd5.ExecuteNonQuery();

                        NpgsqlConnection con2 = Conexion.AgregarConexion();
                        for(int i = 0; i<counts.Length; i++)
                        {
                            res += "Producto clave. " + (i + 1) + ". ";
                            String query2 = String.Format("insert into inventory (id_update, id_product, days_remaining) VALUES({0}, {1}, {2})", id_update, i+1, counts[i]);
                            NpgsqlCommand cmd2 = new NpgsqlCommand(query2, con2);
                            int a2 = cmd2.ExecuteNonQuery();
                        }
                        con2.Close();
                    }
                    con3.Close();
                    con4.Close();
                    con5.Close();
                }
            }
            return res;
        }

        private bool ib(int b)
        {
            return b == 0 || b == 1;
        }
        private bool tof(int b)
        {
            return b == 0;
        }
    }
}