using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.Services;
using System.Configuration;
namespace JQueryEx
{
    public partial class AutoCompTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        [WebMethod]
        public static string[] GetCustomers(string prefix)
        {
            List<string> customers = new List<string>();
            using (MySqlConnection conn = new MySqlConnection())
            {
                conn.ConnectionString = System.Configuration.ConfigurationSettings.AppSettings["mysqlconstr"].ToString(); ;

                using (MySqlCommand cmd = new MySqlCommand())
                {
                    cmd.CommandText = "SELECT distinct Name FROM tblTamilWords where Name like '" + prefix + "%'";
                    cmd.Connection = conn;
                    conn.Open();
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            customers.Add(sdr["Name"].ToString());//string.Format("{0}-{1}", sdr["ContactName"], sdr["CustomerId"]));
                        }
                    }
                    conn.Close();
                }
            }
            return customers.ToArray();
        }

       [WebMethod]
        public static List<string> GetNames(string term)
        {
           MySqlConnection mySQLConn = null;
            List<string> City = new List<string>();
            try
            {
                string strConn = System.Configuration.ConfigurationSettings.AppSettings["mysqlconstr"].ToString();
                mySQLConn = new MySqlConnection(strConn);
                mySQLConn.Open();
                string strSelect = "SELECT distinct Name FROM tblTamil Words where Name like '" + term + "%'";
                MySqlCommand mySQLCommand = new MySqlCommand(strSelect, mySQLConn);
                MySqlDataReader rdr = mySQLCommand.ExecuteReader();
                while (rdr.Read())
                {
                    City.Add(rdr.GetString(0));
                }

                //return City;
            }
            catch (Exception ex)
            {
                
               Console.WriteLine("Error: Failed to retrieve the required data from the DataBase.\n{0}", ex.Message);
            }
            finally
            {
                mySQLConn.Close();
            }
            return City;
        }
    }
}
