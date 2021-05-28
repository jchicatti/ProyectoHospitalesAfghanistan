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
        protected void Page_Load(object sender, EventArgs e) 
        {
            if (DropDownList1.Items.Count == 0)
                Conexion.id_VM(DropDownList1);
        }

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
            Button4.Visible = true;

            List<string> logF1 = (List<string>)Session["logF1"];
            List<string> logF2 = (List<string>)Session["logF2"];
            List<string> logF3 = (List<string>)Session["logF3"];
            List<string> logF4 = (List<string>)Session["logF4"];
            List<string> logF5 = (List<string>)Session["logF5"];
            List<string> logF6 = (List<string>)Session["logF6"];
            String res = ".";

            // QUESTIONNAIRE COMPLETE 
            if (logF1 != null && logF2 != null && logF3 != null && logF4 != null && logF5 != null && logF6 != null && RadioButtonList1.SelectedIndex == 0)
            {
                if (Conexion.finished1 && Conexion.finished3 && Conexion.finished4 && Conexion.finished5)
                {
                    //TABLA: Update_hospital
                    int id_personel_vm = Convert.ToInt32(DropDownList1.SelectedValue);
                    string name_responder = TextBox7.Text;

                    int id_hospital = (int)Session["id_hospital_update"];
                    string funds = logF3[1];
                    string additional_comments = TextBox5.Text;

                    // TABLA: Update_hospital -> Status Questionnaire-Problem-Action
                    // Completed
                    int id_questionnare_status = 1;
                    int id_problem_status = 1;
                    int id_action_status = 1; 

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
                        && ib(screening) && ib(awareness) && ib(testcapacity) && ib(tracking) && ib(moph_report))
                    /*
                     * ib(int b) verifica que el numero sea booleano (0 o 1) osea que se hayan contestado
                     * los YES or NO del questionario. Si ib() es falso entonces no se rellenaron esos campos.
                     */

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
                    else
                        res += "Questionnaire was not answered completely.";

                    con1.Close();

                    //Insert protocol
                    NpgsqlConnection con3 = Conexion.AgregarConexion();
                    String query3 = String.Format("insert into protocol (id_update, covid_screening, covid_awareness, avg_test_result_time, test_capacity, covid_tracking, moph_report_often) " +
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

            // QUESTIONNAIRE NOT DONE
            else if ( RadioButtonList4.SelectedIndex == 1 || (RadioButtonList1.SelectedIndex == 1 &&  RadioButtonList2.SelectedIndex != 0))
                    // Phone not answered or (Questionnaire not complete and !(Partially complete))
            {
                //TABLA: Update_hospital
                int id_personel_vm = Convert.ToInt32(DropDownList1.SelectedValue);
                string name_responder = TextBox7.Text;
                int id_hospital = (int)Session["id_hospital_update"];
                string additional_comments = TextBox5.Text;

                // TABLA: Update_hospital -> Status Questionnaire-Problem-Action
                int id_questionnare_status = 0;
                int id_problem_status = 0;
                int id_action_status = 0;

                
                if (RadioButtonList4.SelectedIndex == 1) // Phone not answered
                {
                    id_questionnare_status = 3;
                    id_problem_status = 4;
                    id_action_status = 2;
                }
                else
                {
                    if (RadioButtonList2.SelectedIndex == 1) // Wrong contact numbers
                    {
                        id_questionnare_status = 3;
                        id_problem_status = 5;
                        id_action_status = 3;
                    }
                    else if (RadioButtonList2.SelectedIndex == 2) // Doctor quit
                    {
                        id_questionnare_status = 3; 
                        id_problem_status = 6;
                        id_action_status = 3;
                    }
                    else if (RadioButtonList2.SelectedIndex == 3) // Doctor bussy
                    {
                        id_questionnare_status = 3;
                        id_problem_status = 1;
                        id_action_status = 2;
                    } 
                    else if (RadioButtonList2.SelectedIndex == 4) // Refused to speak
                    {
                        id_questionnare_status = 3;
                        id_problem_status = 3;
                        id_action_status = 4;
                    }
                            
                }

                //Insert update
                NpgsqlConnection con1 = Conexion.AgregarConexion();
                String query1 = String.Format("insert into update_hospital (name_responder, id_personel_vm, id_questionnare_status," +
                    " id_hospital, id_problem_status, id_action_status, additional_comments, update_date) " +
                    "VALUES('{0}', {1}, {2}, {3}, {4}, {5}, '{6}', (select current_timestamp))", name_responder, id_personel_vm, id_questionnare_status,
                    id_hospital, id_problem_status, id_action_status, additional_comments);
                NpgsqlCommand cmd1 = new NpgsqlCommand(query1, con1);

                int id_update = 0;

                if (id_questionnare_status >= 1 && id_problem_status >= 1 && id_action_status >= 1)
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
                con1.Close();
            }

            else 
            {
                //TABLA: Update_hospital
                int id_personel_vm = Convert.ToInt32(DropDownList1.SelectedValue);
                string name_responder = TextBox7.Text;
                int id_hospital = (int)Session["id_hospital_update"];

                string funds;
                try
                {
                    funds = logF3[1];
                }
                catch (Exception)
                {
                    funds = null;
                }

                string additional_comments = TextBox5.Text;

                    // TABLA: Update_hospital -> Status Questionnaire-Problem-Action

                    // Completed
                    int id_questionnare_status = 0;
                    int id_problem_status = 0;
                    int id_action_status = 0;

                if (RadioButtonList3.SelectedIndex == 0) // It was a test
                {
                    id_questionnare_status = 4;
                    id_problem_status = 1;
                    id_action_status = 1;
                }
                else // Questionnaire partially completed
                {
                    id_questionnare_status = 2;
                    id_problem_status = 2;
                    id_action_status = 2;
                }

                //TABLA: Inventory (Counts)

                int? oxygen = prueba_null(logF6, 1);
                int? antipyr = prueba_null(logF6, 3);
                int? anesth = prueba_null(logF6, 5);
                int? alcohol = prueba_null(logF6, 7);
                int? masks = prueba_null(logF2, 1);
                int? gloves = prueba_null(logF2, 3);
                int? hats = prueba_null(logF2, 5);
                int? aprons = prueba_null(logF2, 7);
                int? visors = prueba_null(logF2, 7);
                int? covers = prueba_null(logF2, 11);
                int? tests = prueba_null(logF1, 1);

                string[] counts = { oxygen.ToString(), antipyr.ToString(), anesth.ToString(), alcohol.ToString(), masks.ToString(),
                    gloves.ToString(), hats.ToString(), aprons.ToString(), visors.ToString(), covers.ToString(), tests.ToString() };

                for (int i = 0; i < counts.Length; i++)
                {
                    if (counts[i] == "")
                        counts[i] = "null";
                }

                //TABLA: Protocol
                int? screening = prueba_null_2(logF3, 4);
                int? awareness = prueba_null_2(logF3, 5);
                int? avg_test_result = prueba_null(logF4, 2);
                int? test_capacity = prueba_null_2(logF3,6);
                int? tracking = prueba_null_2(logF3,7);
                int? moph_report = prueba_null_2(logF3, 3);

                string[] protocol = { screening.ToString(), awareness.ToString(), avg_test_result.ToString(), test_capacity.ToString(), tracking.ToString(), moph_report.ToString() };

                for (int i = 0; i < protocol.Length; i++)
                {
                    if (protocol[i] == "")
                        protocol[i] = "null";
                }

                //TABLA: Personel
                int? no_doctor = prueba_null(logF5, 0);
                int? no_paramedics = prueba_null(logF5,1);

                string[] personel = { no_doctor.ToString(), no_paramedics.ToString() };

                for (int i = 0; i < personel.Length; i++)
                {
                    if (personel[i] == "")
                        personel[i] = "null";
                }

                //TABLA: COVID_Cases
                int? symptomatics = prueba_null(logF4,3);
                int? positives = prueba_null(logF4, 4);
                int? icu = prueba_null(logF4,5);
                int? covid_deaths = prueba_null(logF4, 6);
                int? non_covid_deaths = prueba_null(logF4,7);
                int? covid_recovered = prueba_null(logF4,8);
                int? phc_referres = prueba_null(logF3,8);

                string[] covid = { symptomatics.ToString(), positives.ToString(), icu.ToString(), covid_deaths.ToString(), non_covid_deaths.ToString(),
                    covid_recovered.ToString(), phc_referres.ToString() };

                for (int i = 0; i < covid.Length; i++)
                {
                    if (covid[i] == "")
                        covid[i] = "null";
                }

                //Insert update
                NpgsqlConnection con1 = Conexion.AgregarConexion();
                String query1;
                if (funds != null)
                {
                    query1 = String.Format("insert into update_hospital (name_responder, id_personel_vm, id_questionnare_status," +
                    " id_hospital, id_problem_status, id_action_status, funds, additional_comments, update_date) " +
                    "VALUES('{0}', {1}, {2}, {3}, {4}, {5}, '{6}', '{7}', (select current_timestamp))", name_responder, id_personel_vm, id_questionnare_status,
                    id_hospital, id_problem_status, id_action_status, funds, additional_comments);
                }
                else
                {
                    query1 = String.Format("insert into update_hospital (name_responder, id_personel_vm, id_questionnare_status," +
                    " id_hospital, id_problem_status, id_action_status, additional_comments, update_date) " +
                    "VALUES('{0}', {1}, {2}, {3}, {4}, {5}, '{6}', (select current_timestamp))", name_responder, id_personel_vm, id_questionnare_status,
                    id_hospital, id_problem_status, id_action_status, additional_comments);
                }
                NpgsqlCommand cmd1 = new NpgsqlCommand(query1, con1);

                int id_update = 0;

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

                con1.Close();

                if (id_update > 0)
                {
                    //Insert protocol
                    NpgsqlConnection con3 = Conexion.AgregarConexion();
                    String query3 = String.Format("insert into protocol (id_update, covid_screening, covid_awareness, avg_test_result_time, test_capacity, covid_tracking, moph_report_often) " +
                        "VALUES({0}, {1}, {2}, {3}, {4}, {5}, {6})", id_update, protocol[0], protocol[1], protocol[2], protocol[3], protocol[4], protocol[5]);
                    NpgsqlCommand cmd3 = new NpgsqlCommand(query3, con3);
                    int a3 = cmd3.ExecuteNonQuery();
                    con3.Close();

                    // Insert personel
                    NpgsqlConnection con4 = Conexion.AgregarConexion();
                    String query4 = String.Format("insert into personel (id_update, no_doctors, no_paramedics) " +
                        "VALUES({0}, {1}, {2})", id_update, personel[0], personel[1]);
                    NpgsqlCommand cmd4 = new NpgsqlCommand(query4, con4);
                    int a4 = cmd4.ExecuteNonQuery();
                    con4.Close();

                    // Insert covid_cases
                    NpgsqlConnection con5 = Conexion.AgregarConexion();
                    String query5 = String.Format("insert into covid_cases (id_update, patients_with_symptoms, positive_patients, intensive_care, covid_deaths, " +
                        "non_covid_deaths, covid_recovered, phc_referred) VALUES({0}, {1}, {2}, {3}, {4}, {5}, {6}, {7})",
                            id_update, covid[0], covid[1], covid[2], covid[3], covid[4], covid[5], covid[6]);
                    NpgsqlCommand cmd5 = new NpgsqlCommand(query5, con5);
                    int a5 = cmd5.ExecuteNonQuery();
                    con5.Close();

                    NpgsqlConnection con2 = Conexion.AgregarConexion();
                    for (int i = 0; i < counts.Length; i++)
                    {
                        String query2 = String.Format("insert into inventory (id_update, id_product, days_remaining) VALUES({0}, {1}, {2})", id_update, i + 1, counts[i]);
                        NpgsqlCommand cmd2 = new NpgsqlCommand(query2, con2);
                        int a2 = cmd2.ExecuteNonQuery();
                    }
                    con2.Close();
                }  
                
            }
            return res;
        }

        private int? prueba_null(List<string> lista, int i)
        {
            int? res = null;
            try
            {
                bool isNumeric = int.TryParse(lista[i], out int not_null);
                if (isNumeric)
                {
                    res = not_null;
                }
                return res;
            }
            catch (Exception)
            {
                return res;
            }
        }

        private int? prueba_null_2(List<string> lista, int i)
        {
            int? res = null;
            try
            {
                int not_null = Convert.ToInt32(lista[i]);
                if (ib(not_null))
                {
                    res = not_null;
                }
                return res;
            }
            catch (Exception)
            {
                return res;
            }
            
        }

        private bool ib(int b)
        {
            return b == 0 || b == 1;
        }
        private bool tof(int b)
        {
            return b == 0;
        }
        protected void RadioButtonList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ans = RadioButtonList3.SelectedIndex.ToString();
            if (ans.Equals("0"))
            {
                Label4.Text = "";
                TextBox7.Visible = false;
                RadioButtonList1.Items.Clear();
                RadioButtonList2.Items.Clear();
                RadioButtonList4.Items.Clear();
                Label2.Text = "You can now finish the update.";
                Label1.Text = "";
                Label3.Text = "";
            }
            else
            {
                RadioButtonList4.Items.Clear();
                Label2.Text = "Was phone answered?";
                RadioButtonList4.Items.Add("Yes");
                RadioButtonList4.Items.Add("No");
            }
        }

        protected void RadioButtonList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ans = RadioButtonList4.SelectedIndex.ToString();
            if (ans.Equals("1"))
            {
                Label4.Text = "";
                TextBox7.Visible = false;
                RadioButtonList1.Items.Clear();
                RadioButtonList2.Items.Clear();
                Label3.Text = "You can now finish the update.";
                Label1.Text = "";
            }
            else
            {
                Label4.Text = "Who answered the questions/phone?";
                TextBox7.Visible = true;
                RadioButtonList1.Items.Clear();
                Label3.Text = "Was the questionnaire completed?";
                RadioButtonList1.Items.Add("Yes");
                RadioButtonList1.Items.Add("No");
            }
        }
        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ans = RadioButtonList1.SelectedIndex.ToString();

            if (ans.Equals("0"))
            {
                RadioButtonList2.Items.Clear();
                Label1.Text = "You can now finish the update.";
            }
            else
            {
                RadioButtonList2.Items.Clear();
                Label1.Text = "Why is the questionnaire not completed?";
                RadioButtonList2.Items.Add("Some answers missing.");
                RadioButtonList2.Items.Add("Wrong contact numbers.");
                RadioButtonList2.Items.Add("Doctor no longer in this hospital.");
                RadioButtonList2.Items.Add("Doctor said he was busy at the moment.");
                RadioButtonList2.Items.Add("Doctor refused to give information or says he needs special permition.");
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }
    }
}