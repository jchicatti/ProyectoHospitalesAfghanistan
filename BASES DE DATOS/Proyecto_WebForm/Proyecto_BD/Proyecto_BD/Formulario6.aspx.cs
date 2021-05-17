using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_BD
{
    public partial class Formulario6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PostLog();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["logF6"] = ChangeLog();
            Response.Redirect("Formulario5.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["logF6"] = ChangeLog();
            Response.Redirect("FormularioResumen.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx");
        }
        private List<string> ChangeLog()
        {
            List<string> log = new List<string>
            {
                DropDownList1.SelectedIndex.ToString(),
                DropDownList1.SelectedValue,
                DropDownList2.SelectedIndex.ToString(),
                DropDownList2.SelectedValue,
                DropDownList3.SelectedIndex.ToString(),
                DropDownList3.SelectedValue,
                DropDownList4.SelectedIndex.ToString(),
                DropDownList4.SelectedValue
            };

            return log;
        }
        private void PostLog()
        {
            List<string> log;
            if (Session["logF6"] != null)
            {
                log = (List<string>)Session["logF6"];
                DropDownList1.SelectedIndex = Convert.ToInt32(log[0]);
                DropDownList2.SelectedIndex = Convert.ToInt32(log[2]);
                DropDownList3.SelectedIndex = Convert.ToInt32(log[4]);
                DropDownList4.SelectedIndex = Convert.ToInt32(log[6]);
            }
        }
        private void AttemptMainInsert()
        {
            List<string> logF1 = (List<string>)Session["logF1"];
            List<string> logF2 = (List<string>)Session["logF2"];
            List<string> logF3 = (List<string>)Session["logF3"];
            List<string> logF4 = (List<string>)Session["logF4"];
            List<string> logF5 = (List<string>)Session["logF5"];
            List<string> logF6 = (List<string>)Session["logF6"];

            if (logF1 != null && logF2 != null && logF3 != null && logF4 != null && logF5 != null && logF6 != null)
            {
                //TABLA: Update_hospital
                string name_responder = "John Doe";
                int id_personel_vm = 1;
                int id_hospital = (int)Session["id_hospital_update"];
                int id_questionnare_status = 1;
                int id_problem_status = 1;
                int id_action_status = 1;
                string funds = logF3[1];
                string additional_comments = "Sample Text";

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

                if(isNumeric1 && isNumeric2 && isNumeric3 && isNumeric4 && isNumeric5 && isNumeric6 && isNumeric7 && isNumeric8 && isNumeric9 && isNumeric10 && isNumeric11)
                {

                }

                //TABLA: Protocol
                int screening = Convert.ToInt32(logF3[4]);
                int awareness = Convert.ToInt32(logF3[5]);
                bool isNumeric12 = int.TryParse(logF4[2], out int avg_text_result);
                int testcapacity = Convert.ToInt32(logF3[6]);
                int tracking = Convert.ToInt32(logF3[7]);
                int moph_report = 0;

                if(ib(screening) && ib(awareness) && isNumeric12 && ib(testcapacity) 
                    && ib(tracking) && ib(moph_report))
                {

                }

                //TABLA: Personel
                bool isNumeric13 = int.TryParse(logF5[0], out int no_doctors);
                bool isNumeric14 = int.TryParse(logF5[1], out int no_paramedics);
                if(isNumeric13 && isNumeric14)
                {

                }


                //TABLA: COVID_Cases
                bool isNumeric15 = int.TryParse(logF4[3], out int symptomatics);
                bool isNumeric16 = int.TryParse(logF4[4], out int positives);
                bool isNumeric17 = int.TryParse(logF4[5], out int icu);
                bool isNumeric18 = int.TryParse(logF4[6], out int covid_deaths);
                bool isNumeric19 = int.TryParse(logF4[7], out int non_covid_deaths);
                bool isNumeric20 = int.TryParse(logF4[8], out int covid_recovered);
                bool isNumeric21 = int.TryParse(logF3[8], out int phc_referred);

                if(isNumeric15 && isNumeric16 && isNumeric17 && isNumeric18 && isNumeric19 && isNumeric20 && isNumeric21)
                {

                }
            }
        }
        private bool ib(int b)
        {
            return b == 0 || b == 1;
        }
        private bool tof(int b)
        {
            return b == 1;
        }
    }
}