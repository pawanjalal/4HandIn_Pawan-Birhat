using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing;
using System.Net;
using System.IO;
using System.Xml;
using System.Data.SqlClient;
using System.Xml.Xsl;

namespace _4HandIn
{
    public partial class HomePage : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"data source = .\SQLEXPRESS; integrated security = true; database = MovieNames");
        SqlCommand cmd = null;
        SqlDataReader rdr = null;
        string sqlsel = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now);
            Response.Cache.SetNoServerCaching();
            Response.Cache.SetNoStore();

            // if the XML uses a namespace the XSLT must refer to this namespace
            string sourcefile = Server.MapPath("Project4.xml");
            string xslfile = Server.MapPath("Commercial.xslt");
            string destinationfile = Server.MapPath("MyCommercial.xml");

            //XML
            FileStream fs = new FileStream(destinationfile, FileMode.Create);
            XslCompiledTransform xct = new XslCompiledTransform();
            xct.Load(xslfile);
            xct.Transform(sourcefile, null, fs);
            fs.Close();

            myShowPoster();
        }

        public void myShowPoster()
        {
            try
            {
                conn.Open();
                sqlsel = "select top 3 Id, MovieName, Year, Viewed from MovieTable order by Viewed desc";
                cmd = new SqlCommand(sqlsel, conn);

                rdr = cmd.ExecuteReader();

                string s = "";

                List<string> urls = new List<string>();
                List<string> myTitle = new List<string>();
                List<string> myYear = new List<string>();
                if (rdr.HasRows)
                {
                    while (rdr.Read())
                    {
                        int movId = rdr.GetInt32(0);
                        string movTitle = rdr.GetString(1);
                        int movYear = rdr.GetInt32(2);
                        int movViewed = rdr.GetInt32(3);

                        // string posterUrl = MovieUtils.GetPosterUrlFromOmdb(movTitle);
                        MovieInfo info = GetPosterUrl(movTitle);
                        
                        urls.Add(info.ImageUrl);
                        myTitle.Add(info.LabelTitel);
                        myYear.Add(info.LabelPosterYear);
                        //s = s + "The Movie ID is: "+ movId + ", The Title is: "+ movTitle + ", The year: ("+ movYear + "), it has been viewed "+ movViewed + " times<br>";
                    }

                    ImagePoster1.ImageUrl = urls[0];
                    ImagePoster2.ImageUrl = urls[1];
                    ImagePoster3.ImageUrl = urls[2];

                    Label1Poster.Text = myTitle[0];
                    Label2Poster.Text = myTitle[1];
                    Label3Poster.Text = myTitle[2];

                    LabelPoster1.Text = myYear[0];
                    LabelPoster2.Text = myYear[1];
                    LabelPoster3.Text = myYear[2];


                }
                else
                {
                    s = "No rows found.";
                }

               

            }
            catch (Exception ex)
            {
                LabelMessages.Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }

        protected void FindMovie()
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["myMovie"] = DropDownList1.SelectedValue;
            Response.Redirect("~/Index.aspx");
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["myMovie"] = DropDownList2.SelectedValue;
            Response.Redirect("~/Index.aspx");
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["myMovie"] = DropDownList3.SelectedValue;
            Response.Redirect("~/Index.aspx");
        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["myMovie"] = DropDownList4.SelectedValue;
            Response.Redirect("~/Index.aspx");
        }

        public MovieInfo GetPosterUrl(string movieName)
        {
            MovieInfo movieInfo = new MovieInfo();
            WebClient client = new WebClient();
            string result = "";
            string myTitle = "";
            string mySelection = "";
            // if the textbox is not a empty string then go, else make mySelection = to the session["myMovie"]
            if (movieName != "") mySelection = movieName.Replace(' ', '+');
            else mySelection = (string)Session["myMovie"];

            result = client.DownloadString("http://www.omdbapi.com/?t=" + mySelection + "&apikey=" + TokenClass.token);
            movieInfo.LabelResults = result;

            string[] separatingChars = { "\":\"", "\",\"", "\":[{\"", "\"},{\"", "\"}]\"", "{\"", "\"}" };
            string[] mysplit = result.Split(separatingChars, System.StringSplitOptions.RemoveEmptyEntries);

            if (mysplit[1] != "False")
            {
                movieInfo.LabelYear += "Movie found";
                for (int i = 0; i < mysplit.Length; i++)
                {
                    if (mysplit[i] == "Poster")
                    {
                        movieInfo.ImageUrl = mysplit[++i];
                        break;
                    }
                }
                
                
                for (int i = 0; i < mysplit.Length; i++)
                {
                    if (mysplit[i] == "Title")
                    {
                        movieInfo.LabelTitel = mysplit[++i];
                        break;
                    }
                }

                for (int i = 0; i < mysplit.Length; i++)
                {
                    if (mysplit[i] == "Year")
                    {
                        movieInfo.LabelPosterYear = "(" + mysplit[++i] + ")";
                        break;
                    }
                }

            }
            return movieInfo;
        }

        protected void ButtonTopMovie1_Click(object sender, EventArgs e)
        {
            //Session["myMovieButton"] = Label1Poster.Text;
            //Response.Redirect("~/Index.aspx");
        }
    }
}