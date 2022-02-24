using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Web.Script.Serialization;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Net;
namespace JQueryEx
{
    public partial class _Default : System.Web.UI.Page
    {
        MySqlConnection mySQLConn = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            //GetAllImages();
            string validateFn;
            validateFn = "javascript:return validateInput({0});";
            validateFn = string.Format(validateFn, txtNames1.ClientID);
            btnKeyboard.Attributes.Add("onClick", "javascript:return toggle();");
            btnSearch.Attributes.Add("onClick", validateFn);
           // txtNames1.Attributes.Add("onFocus", "txtboxFocus(this)");
            txtNames1.Attributes.Add("onkeypress","javascript:return addCharKeyPress(this, event,engToTam);");
            txtNames1.Attributes.Add("onkeyDown","javascript:toggleLangMode(event);keyDownBorder(this);");
            txtNames1.Attributes.Add("onkeyup", "javascript:keyUpBorder(this)");

            
            if (!Page.IsPostBack)
            {
                string strConn = System.Configuration.ConfigurationSettings.AppSettings["mysqlconstr"].ToString();
                try
                {
                    mySQLConn = new MySqlConnection(strConn);
                    if (mySQLConn.State != ConnectionState.Open)
                        mySQLConn.Open();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: Failed to create a database connection. \n{0}", ex.Message);
                    return;
                }
            }
        }

        protected void getResult()
        {
            string term;
            string results;
            string blueItalicfont = "&nbsp;<font color='blue'><I>";
            string blueItalicfontEnd = "</I></font>";
            string strFont;

            string onespaceHTML = "&nbsp;";
            string twospaceHTML = "&nbsp;&nbsp;";
            string threespaceHTML = "&nbsp;&nbsp;&nbsp;";
            string fourspaceHTML = "&nbsp;&nbsp;&nbsp;&nbsp;";
            string fivespaceHTML = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";

            string linebreak = "<br />";
            string resultimage = "";

            strFont = "&nbsp;<font color='{0}'>";

            string engFont = "</font>";
            results = "";
            term = txtNames1.Value.ToString().Trim();

            string strSelect = "SELECT distinct Name,ResultText,Image FROM tblTamilWords where Name = '" + term + "' order by ID";

            // Create the dataset and add the Categories table to it:
            DataSet myDataSet = new DataSet();
            string strConn = System.Configuration.ConfigurationSettings.AppSettings["mysqlconstr"].ToString();
            //lblMessages.Text = strConn;
            try
            {
                mySQLConn = new MySqlConnection(strConn);
                if (mySQLConn.State != ConnectionState.Open)
                    mySQLConn.Open();

                //lblMessages.Text += mySQLConn.State.ToString(); 
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: Failed to create a database connection. \n{0}", ex.Message);
                return;
            }

            try
            {
                if (mySQLConn != null)
                {
                    MySqlCommand mySQLCommand = new MySqlCommand(strSelect, mySQLConn);
                    MySqlDataReader rdr = mySQLCommand.ExecuteReader();

                    //lblMessages.Text += rdr.HasRows.ToString();

                    while (rdr.Read())
                    {
                        results = results + linebreak + rdr["ResultText"].ToString();
                        resultimage = rdr["Image"].ToString();
                    }
                    if (!rdr.HasRows)
                    {
                        lblResults.Text = "No results found";
                    }
                    else
                    {
                        results = results.Replace("<Red>", string.Format(strFont, "Red")).Replace("</Red>", engFont);
                        results = results.Replace("<Blue_Italic>", blueItalicfont).Replace("</Blue_Italic>", blueItalicfontEnd);
                        results = results.Replace("<Green>", string.Format(strFont, "Green")).Replace("</Green>", engFont);
                        results = results.Replace("<Italics>", "<I>").Replace("</Italics>", "</I>");
                        results = results.Replace("<One_Space>", onespaceHTML);
                        results = results.Replace("<Double_Space>", twospaceHTML);
                        results = results.Replace("<Three_Space>", threespaceHTML);
                        results = results.Replace("<Four_Space>", fourspaceHTML);
                        results = results.Replace("<Five_Space>", fivespaceHTML);
                        results = results.Replace("<myfirstfont_13>", "<font size='4'>");
                        results = results.Replace("</myfirstfont_13>", "</font>");
                        results = results.Replace("<Super>", "<Sup>");
                        results = results.Replace("</Super>", "</Sup>");
                        
                        results = results.Replace("<Italics>", "<I>").Replace("</Italics>", "</I>");

                        
                        //results = results.Replace(linebreakKey, linebreak);
                        lblResults.Text = results.ToString();
                        DisplayResultImage(resultimage);
                        //DisplayResultImagetxt(resultimagetxt);
                        //images\results\குரங்கு.jpg|குரங்கு|images\results\கீரி.jpg|கீரி

                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: Failed to retrieve the required data from the DataBase.\n{0}", ex.Message);
                return;
            }
            finally
            {
                mySQLConn.Close();
            }

        }

        protected void DisplayResultImage(string resultimage)
        {
            Image newimg = new Image();
            
            string imgName = "http://casefundingsoftware.com\\images\\results\\" + resultimage;
            
            newimg.ImageUrl = imgName;

            if (CheckImageResult(resultimage))
            {
                divimages.Controls.Add(newimg);
            }

        }

        private bool FindImageResult(string resultimage)
        {
            bool ret;//=false;
            
            ret = File.Exists(resultimage);

            //string imageName = Server.MapPath(resultimage);
            lblMessages.Text = ret.ToString();
            //int fileSize = (int)new System.IO.FileInfo(resultimage).Length;
            //ret = CheckImageResult(resultimage);
            //lblMessages.Text += ret.ToString();
            
            //lblMessages.Text = resultimage;
            //lblMessages.Text += ret.ToString();
            return ret;
        }

        private bool CheckImageResult(string resultimage)
        {
            WebRequest request = WebRequest.Create(Server.MapPath("~/") + "/images/results/" + resultimage);
            
//          HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(resultimage);
            request.Method = "HEAD";
            
            try
            {
                request.GetResponse();
                return true;
            }
            catch
            {
                return false;
            }
        }


        private void GetAllImages()
        {
            string path = "http:\\casefundingsoftware.com\\images\\results\\";

            Uri uri = new Uri(path);
            string filename = System.IO.Path.GetFileName(uri.AbsolutePath);

            /*string[] files = Directory.GetFiles(path);
            foreach (string name in files)
            {
                lblMessages.Text += Environment.NewLine + name.ToString();
            }
             * */


        
        }

        //protected void DisplayResultImage(string resultimage)
        //{
        //    //string[] imgs = resultimage.Split('|');
        //    //foreach (string img in imgs)
        //    //{
        //    //    if (img != null)
        //    //    {
        //    //        Image newimg = new Image();
        //    //        newimg.ImageUrl = img.Split('~')[0].ToString();
        //    //        divimages.Controls.Add(newimg);
        //    //        Label lbl = new Label();
        //    //        lbl.Text = img.Split('~')[1].ToString();
        //    //        divimages.Controls.Add(lbl);
        //    //    }
        //    //}
        //}

        protected void DisplayResultImagetxt(string resultimagetxt)
        {
            string[] txts = resultimagetxt.Split('|');
            foreach (string txt in txts)
            {
                if (txt != null)
                {
                    Label lbl = new Label();
                    lbl.Text = txt;
                    divimages.Controls.Add(lbl);
                }
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            getResult();
            //DisplayWord();
            //DisplayHTML();
        }

        protected void DisplayHTML_InIFrame()
        {
            string fileName;
            fileName = Server.MapPath("அம்மா.html").ToString();
        }

        protected void btnSearch_Click1(object sender, EventArgs e)
        {

        }

        protected void btnKeyboard_Click(object sender, EventArgs e)
        {
            /*if()
            {
                //onkeypress="return addCharKeyPress(this, event,engToTam);" onkeyDown="toggleLangMode(event);keyDownBorder(this);" onkeyup="keyUpBorder(this)"
                txtNames1.Attributes.Add("onkeypress","javascript:return addCharKeyPress(this, event,engToTam);");
                txtNames1.Attributes.Add("onkeyDown","javascript:toggleLangMode(event));keyDownBorder(this);");
                txtNames1.Attributes.Add("onkeyup","keyUpBorder(this)");
            }
            else
            {
                txtNames1.Attributes.Remove("onkeypress");
                txtNames1.Attributes.Remove("onkeyDown");
                txtNames1.Attributes.Remove("onkeyup");
            }*/
        }

        #region Hiddencode
        //protected void DisplayHTML()
        //{ 
        //    string fileName;
        //    fileName = Server.MapPath("அம்மா.docx").ToString();
        //    StreamReader sr  = new StreamReader(fileName);
        //    ltrl_Html.Text = sr.ReadToEnd();
        //}

        ////protected void DisplayWord()
        //{
        //    object missingType = Type.Missing;
        //    object readOnly = true;
        //    object isVisible = false;
        //    object documentFormat = 8;
        //    object fileName;
        //    fileName = Server.MapPath("அம்மா.docx").ToString();
        //    string randomName = DateTime.Now.Ticks.ToString();
            
        //    object htmlFilePath = Server.MapPath("~/Temp/") + randomName + ".htm";
        //    string directoryPath = Server.MapPath("~/Temp/") + randomName + "_files";

        //    //Upload the word document and save to Temp folder
        //    //FileUpload1.SaveAs(Server.MapPath("~/Temp/") + Path.GetFileName(FileUpload1.PostedFile.FileName));
        //    //object fileName = FileUpload1.PostedFile.FileName;

        //    //Open the word document in background
        //    ApplicationClass applicationclass = new ApplicationClass();
        //    applicationclass.Documents.Open(ref fileName,ref missingType,
        //                                    ref readOnly,
        //                                    ref missingType, ref missingType,
        //                                    ref missingType, ref missingType, ref missingType,
        //                                    ref missingType, ref missingType, ref isVisible,
        //                                    ref missingType, ref missingType, ref missingType,
        //                                    ref missingType, ref missingType);
        //    applicationclass.Visible = false;
        //    Document document = applicationclass.ActiveDocument;
            //Method 1
            //document.ActiveWindow.Selection.WholeStory();
            //document.ActiveWindow.Selection.Copy();
            //lblResults.Text = document.Content.Text;

            //Method 2
            //int i = 1;
            //foreach (Microsoft.Office.Interop.Word.Paragraph objParagraph in document.Paragraphs)
            //{
            //    try
            //    {
            //        lblResults.Text += document.Paragraphs[i].Range.Text;
            //    }
            //    catch (Exception ex)
            //    {
            //        throw ex;
            //    }
            //    i++;
            //}

            ////Save the word document as HTML file
            //document.SaveAs(ref htmlFilePath, ref documentFormat, ref missingType,
            //                ref missingType, ref missingType, ref missingType,
            //                ref missingType, ref missingType, ref missingType,
            //                ref missingType, ref missingType, ref missingType,
            //                ref missingType, ref missingType, ref missingType,
            //                ref missingType);

            //Close the word document
            //document.Close(ref missingType, ref missingType, ref missingType);

            //Delete the Uploaded Word File
            //File.Delete(Server.MapPath("~/Temp/") + Path.GetFileName(FileUpload1.PostedFile.FileName));

            //Read the Html File as Byte Array and Display it on browser
            //byte[] bytes;
            //using (FileStream fs = new FileStream(fileName.ToString(), FileMode.Open, FileAccess.Read))
            //{
            //    BinaryReader reader = new BinaryReader(fs);
            //    bytes = reader.ReadBytes((int)fs.Length);
            //    fs.Close();
            //}
            //lblResults.Text = bytes.ToString();
            //Response.Flush();

            ////Delete the Html File
            //File.Delete(htmlFilePath.ToString());
            //foreach (string file in Directory.GetFiles(directoryPath))
            //{
            //    File.Delete(file);
            //}
            //Directory.Delete(directoryPath);
        //Response.End();
        #endregion

    }

}
