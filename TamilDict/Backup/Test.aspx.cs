using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Web.Script.Serialization;
using System.Data;
using System.Data.OleDb;
using System.Data.Odbc;
using MySql.Data.MySqlClient;

namespace JQueryEx
{
    public partial class Test : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("Test");
            FetchRecs();
        }

        protected void FetchRecsDSN()
        {
            OdbcConnection odbcConn;
            odbcConn = new OdbcConnection("Dsn=TamilDictMySQL");

            if (odbcConn.State != ConnectionState.Open)
                odbcConn.Open();
            // Create the dataset and add the Categories table to it:
            DataSet myDataSet = new DataSet();
            string strSelect = "SELECT distinct Name FROM tblTamilWords";
            OdbcCommand myComm = new OdbcCommand(strSelect, odbcConn);
            OdbcDataReader rdr = myComm.ExecuteReader();

            while (rdr.Read())
            {
                Response.Write("<BR>" + rdr["Name"].ToString());
            }

        }

        protected void FetchRecs()
        {
            MySqlConnection mySQLConn;
            string strConn = System.Configuration.ConfigurationSettings.AppSettings["mysqlconstr"].ToString();
            Response.Write(strConn);
            mySQLConn = new MySqlConnection(strConn);
            if (mySQLConn.State != ConnectionState.Open)
                mySQLConn.Open();
            Response.Write(mySQLConn.State.ToString());
            // Create the dataset and add the Categories table to it:
            DataSet myDataSet = new DataSet();
            string strSelect = "SELECT Name FROM TamilDict.tblTamilWords WHERE (Name = 'பிங்கலம்')";

            MySqlCommand mySQLCommand = new MySqlCommand(strSelect, mySQLConn);
            MySqlDataReader rdr = mySQLCommand.ExecuteReader();

            while (rdr.Read())
            {
                Response.Write("<BR>" + rdr["Name"].ToString());
            }

        }
    }
}
