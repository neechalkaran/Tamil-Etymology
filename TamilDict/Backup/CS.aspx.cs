using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Script.Serialization;
using System.Data;
using System.Data.OleDb;
using MySql.Data.MySqlClient;

public partial class _Default : System.Web.UI.Page 
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

[System.Web.Services.WebMethod]
public static string GetCurrentTime(string name)
{
    //return "Hello " + name + Environment.NewLine + "The Current Time is: " + DateTime.Now.ToString();
    MySqlConnection mySQLConn = null;
    List<string> names = new List<string>();

    string strSelect = "SELECT distinct Name FROM tblTamilWords where Name like '" + name + "%'";
    try
    {
        string strConn = System.Configuration.ConfigurationSettings.AppSettings["mysqlconstr"].ToString();
        mySQLConn = new MySqlConnection(strConn);
        if (mySQLConn.State != ConnectionState.Open)
            mySQLConn.Open();

        MySqlCommand mySQLCommand = new MySqlCommand(strSelect, mySQLConn);
        MySqlDataReader rdr = mySQLCommand.ExecuteReader();
        while (rdr.Read())
        {
            names.Add(rdr["Name"].ToString());
        }
        
        JavaScriptSerializer js = new JavaScriptSerializer();
        return(js.Serialize(names));
    }
    catch (Exception ex)
    {
        Console.WriteLine("Error: Failed to retrieve the required data from the DataBase.\n{0}", ex.Message);
        return "Error";
    }
    finally
    {
        mySQLConn.Close();
    }
}
}
