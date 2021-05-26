using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_BD
{
    public partial class Registro_Hospital : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                Conexion.EnumHospitalType(DropDownList2);
                Conexion.LlenarDistritos(DropDownList3);
                Conexion.LlenarProvincias(DropDownList9);
                PostLog();
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["logRH"] = ChangeLog();
            Response.Redirect("Inicio.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String nombre = TextBox1.Text;
            String dom = TextBox2.Text;
            String moph = TextBox13.Text;
            String numero_1 = TextBox3.Text;
            String numero_2 = TextBox6.Text;
            String numero_3 = TextBox8.Text;
            String nombre_1 = TextBox5.Text;
            String nombre_2 = TextBox7.Text;
            String nombre_3 = TextBox9.Text;
            String tipo_1 = DropDownList8.Text;
            String tipo_2 = DropDownList7.Text;
            String tipo_3 = DropDownList6.Text;
            String tipo_hospital = DropDownList2.Text;
            int district = DropDownList3.SelectedIndex + 1;
            int province = DropDownList9.SelectedIndex + 1;
            bool latitudeIsNum = double.TryParse(TextBox10.Text, out double latitude);
            bool longitudeIsNum = double.TryParse(TextBox11.Text, out double longitude);
            bool isNumeric1 = double.TryParse(numero_1, out _);
            bool isNumeric2 = double.TryParse(numero_2, out _);
            bool isNumeric3 = double.TryParse(numero_3, out _);

            if (!numero_1.Equals("") || !numero_2.Equals("") || !numero_3.Equals(""))
            {
                if ((isNumeric1 && numero_1.Length == 10) || (isNumeric2 && numero_2.Length == 10) || (isNumeric3 && numero_3.Length == 10))
                {
                    if (!nombre.Equals("") && !dom.Equals("") && !moph.Equals(""))
                    {
                        Hospital c = new Hospital(nombre, dom, latitude, longitude, district, province, tipo_hospital, moph);
                        bool isSimilar = c.HospitalesSimilares(GridView1);
                        if (!isSimilar)
                        {
                            string resInsert = c.AgregaHospital();
                            bool wasInserted = int.TryParse(resInsert.Substring(28), out int id_hospital);
                            TextBox14.Text = resInsert;
                            Session["id_hospital_register"] = id_hospital;
                            Session["id_hospital_update"] = id_hospital;
                            Session["logRH"] = ChangeLog();

                            //4. El MOPH es único
                            if (wasInserted)
                            {
                                if (isNumeric1 && numero_1.Length == 10)
                                {
                                    Telephone t = new Telephone(numero_1, nombre_1, tipo_1, id_hospital);
                                    TextBox14.Text += "\n" + t.AddTelephone();
                                }
                                if (isNumeric2 && numero_2.Length == 10)
                                {
                                    Telephone t = new Telephone(numero_2, nombre_2, tipo_2, id_hospital);
                                    TextBox14.Text += "\n" + t.AddTelephone();
                                }
                                if (isNumeric3 && numero_3.Length == 10)
                                {
                                    Telephone t = new Telephone(numero_3, nombre_3, tipo_3, id_hospital);
                                    TextBox14.Text += "\n" + t.AddTelephone();
                                }

                                TextBox1.Text = "";
                                TextBox2.Text = "";
                                TextBox13.Text = "";
                                TextBox3.Text = "";
                                TextBox6.Text = "";
                                TextBox8.Text = "";
                                TextBox5.Text = "";
                                TextBox7.Text = "";
                                TextBox9.Text = "";
                            }
                            else
                            {
                                TextBox14.Text = "\nVerify MOPH number is unique and hasn't been registered before.";
                            }
                        }
                        else
                        {
                            Button1.Visible = false;
                            GridView1.Visible = true;
                            Label1.Visible = true;
                            Button3.Visible = true;
                            TextBox14.Text = "";

                        }

                    }
                    else
                        TextBox14.Text = "\nHospital fields required: (NAME, ADDRESS, MOPH NUMBER).";
                }
                else
                    TextBox14.Text = "\nVerify contact telephone is numeric and 10 digits long.";
            }
            else
                TextBox14.Text = "\n At least 1 contact telephone is required.";
        }
        public List<string> ChangeLog()
        {
            List<string> log = new List<string>
            {
                "",
                TextBox1.Text,
                TextBox2.Text,
                TextBox3.Text,
                "",
                TextBox5.Text,
                TextBox6.Text,
                TextBox7.Text,
                TextBox8.Text,
                TextBox9.Text,
                TextBox10.Text,
                TextBox11.Text,
                "",
                TextBox13.Text,
                (DropDownList3.SelectedIndex).ToString(),
                (DropDownList9.SelectedIndex).ToString()
            };

            return log;
        }
        public void PostLog()
        {
            List<string> log;
            if (Session["logRH"] != null)
            {
                log = (List<string>)Session["logRH"];
                TextBox1.Text = log[1];
                TextBox2.Text = log[2];
                TextBox3.Text = log[3];
                TextBox5.Text = log[5];
                TextBox6.Text = log[6];
                TextBox7.Text = log[7];
                TextBox8.Text = log[8];
                TextBox9.Text = log[9];
                TextBox10.Text = log[10];
                TextBox11.Text = log[11];
                TextBox13.Text = log[13];
                DropDownList3.SelectedIndex = Convert.ToInt32(log[14]);
                DropDownList9.SelectedIndex = Convert.ToInt32(log[15]);
            }
        }

        protected void Button3_Click1(object sender, EventArgs e)
        {
            String nombre = TextBox1.Text;
            String dom = TextBox2.Text;
            String moph = TextBox13.Text;
            String numero_1 = TextBox3.Text;
            String numero_2 = TextBox6.Text;
            String numero_3 = TextBox8.Text;
            String nombre_1 = TextBox5.Text;
            String nombre_2 = TextBox7.Text;
            String nombre_3 = TextBox9.Text;
            String tipo_1 = DropDownList8.Text;
            String tipo_2 = DropDownList7.Text;
            String tipo_3 = DropDownList6.Text;
            String tipo_hospital = DropDownList2.Text;
            int district = DropDownList3.SelectedIndex + 1;
            int province = DropDownList9.SelectedIndex + 1;

            bool latitudeIsNum = double.TryParse(TextBox10.Text, out double latitude);
            bool longitudeIsNum = double.TryParse(TextBox11.Text, out double longitude);
            bool isNumeric1 = double.TryParse(numero_1, out _);
            bool isNumeric2 = double.TryParse(numero_2, out _);
            bool isNumeric3 = double.TryParse(numero_3, out _);


            //1. Se ingresó al menos un numero
            if (!numero_1.Equals("") || !numero_2.Equals("") || !numero_3.Equals(""))
            {
                //2. Al menos un número es válido
                if ((isNumeric1 && numero_1.Length == 10) || (isNumeric2 && numero_2.Length == 10) || (isNumeric3 && numero_3.Length == 10))
                {
                    //3. Se ingresaron datos básicos del hospital
                    if (!nombre.Equals("") && !dom.Equals("") && !moph.Equals(""))
                    {
                        Hospital c = new Hospital(nombre, dom, latitude, longitude, district, province, tipo_hospital, moph);
                        string resInsert = c.AgregaHospital();
                        bool wasInserted = int.TryParse(resInsert.Substring(28), out int id_hospital);
                        TextBox14.Text = resInsert;
                        Session["id_hospital_register"] = id_hospital;
                        Session["id_hospital_update"] = id_hospital;
                        Session["logRH"] = ChangeLog();

                        //4. El MOPH es único
                        if (wasInserted)
                        {
                            if (isNumeric1 && numero_1.Length == 10)
                            {
                                Telephone t = new Telephone(numero_1, nombre_1, tipo_1, id_hospital);
                                TextBox14.Text += t.AddTelephone();
                            }
                            if (isNumeric2 && numero_2.Length == 10)
                            {
                                Telephone t = new Telephone(numero_2, nombre_2, tipo_2, id_hospital);
                                TextBox14.Text += t.AddTelephone();
                            }
                            if (isNumeric3 && numero_3.Length == 10)
                            {
                                Telephone t = new Telephone(numero_3, nombre_3, tipo_3, id_hospital);
                                TextBox14.Text += t.AddTelephone();
                            }

                            Button1.Visible = true;
                            GridView1.Visible = false;
                            Label1.Visible = false;
                            Button3.Visible = false;

                            TextBox1.Text = "";
                            TextBox2.Text = ""; 
                            TextBox13.Text = "";
                            TextBox3.Text = "";
                            TextBox6.Text = "";
                            TextBox8.Text = "";
                            TextBox5.Text = "";
                            TextBox7.Text = "";
                            TextBox9.Text = ""; 
                        }
                        else
                        {
                            TextBox14.Text = "\nVerify MOPH number is unique and hasn't been registered before.";
                        }
                    }
                    else
                    {
                        TextBox14.Text = "\nHospital fields required: (NAME, ADDRESS, MOPH NUMBER).";
                    }
                }
                else
                {
                    TextBox14.Text = "\nVerify contact telephone is numeric and 10 digits long.";
                }

            }
            else
            {
                TextBox14.Text = "\n At least 1 contact telephone is required.";
            }
        }
    }
}