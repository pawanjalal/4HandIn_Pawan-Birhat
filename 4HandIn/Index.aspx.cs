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

namespace _4HandIn
{
    public partial class Index : System.Web.UI.Page
    {

        SqlConnection conn = new SqlConnection(@"data source = .\SQLEXPRESS; integrated security = true; database = MovieNames");
        SqlCommand cmd = null;
        SqlDataReader rdr = null;
        string sqlsel = "";
        string mySelection = null;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.PreviousPage != null)
            {
                var previousControl = Page.PreviousPage.FindControl("TextBoxInput");
                if (previousControl is TextBox)
                {
                    var previousTextBox = (TextBox)previousControl;
                    TextBoxInput.Text = previousTextBox.Text;
                    FindMovieAndUpdateDatabase(TextBoxInput.Text);
                }
            }
            else if (Session["myMovie"] != null)
            {
                TextBoxInput.Text = (string)Session["myMovie"];
                FindMovieAndUpdateDatabase(TextBoxInput.Text);
                Session.Clear();
            }
        }

        protected void ButtonFindMovie_Click(object sender, EventArgs e)
        {
            FindMovieAndUpdateDatabase(TextBoxInput.Text);
        }

        private void FindMovieAndUpdateDatabase(string movieName)
        {
            FindMovie(TextBoxInput.Text);
            UpdateViewCount(TextBoxInput.Text);
        }

        protected void ButtonJoke_Click(object sender, EventArgs e)
        {
            WebRequest request = HttpWebRequest.Create("http://api.icndb.com/jokes/random");
            WebResponse response = request.GetResponse();
            StreamReader reader = new StreamReader(response.GetResponseStream());

            string Joke_JSON = reader.ReadToEnd();
            Joke myJoke = Newtonsoft.Json.JsonConvert.DeserializeObject<Joke>(Joke_JSON);
            LabelJoke.Text = myJoke.value.joke;
        }

        public MovieInfo FindMovie(string movieName)
        {
            WebClient client = new WebClient();
            string result = "";
            string myYear = "";
            string myActors = "";
            string myAwards = "";
            // if the textbox is not a empty string then go, else make mySelection = to the session["myMovie"]
            if (movieName != "") mySelection = movieName.Replace(' ', '+');
            else mySelection = (string)Session["myMovie"];
            


            result = client.DownloadString("http://www.omdbapi.com/?t=" + mySelection + "&apikey=" + TokenClass.token);
            LabelResults.Text = result;

            string[] separatingChars = { "\":\"", "\",\"", "\":[{\"", "\"},{\"", "\"}]\"", "{\"", "\"}" };
            string[] mysplit = result.Split(separatingChars, System.StringSplitOptions.RemoveEmptyEntries);

            if (mysplit[1] != "False")
            {
                LabelYear.Text = "Movie found";

                for (int i = 0; i < mysplit.Length; i++)
                {
                    if (mysplit[i] == "Poster")
                    {
                        ImagePoster.ImageUrl = mysplit[++i];
                        break;
                    }
                }
                LabelYear.Text = ImagePoster.ImageUrl.ToString();

                LabelResults.Text = "<b>Ratings : </b>";
                for (int i = 0; i < mysplit.Length; i++)
                {
                    if (mysplit[i] == "Ratings")
                    {
                        while (mysplit[++i] == "Source")
                        {
                            if (mysplit[i - 1] != "Ratings") LabelResults.Text += "; ";
                            LabelResults.Text += mysplit[i + 3] + " from " + mysplit[i + 1];
                            i = i + 3;
                        }
                        break;
                    }

                }

                for (int i = 0; i < mysplit.Length; i++)
                {
                    if (mysplit[i] == "Year")
                    {
                        myYear = mysplit[++i];
                        break;
                    }
                }
                LabelYear.Text = "<b>Year : </b>" + myYear;

                for (int i = 0; i < mysplit.Length; i++)
                {
                    if (mysplit[i] == "Actors")
                    {
                        myActors = mysplit[++i];
                        break;
                    }
                }
                LabelActors.Text = "<b>Actors : </b>" + myActors;

                for (int i = 0; i < mysplit.Length; i++)
                {
                    if (mysplit[i] == "Awards")
                    {
                        myAwards = mysplit[++i];
                        break;
                    }
                }
                LabelAwards.Text = "<b>Awards : </b>" + myAwards;
            }
            return new MovieInfo()
            {
                LabelActors = LabelActors.Text,
                LabelAwards = LabelAwards.Text,
                LabelYear = LabelYear.Text,
                ImageUrl = ImagePoster.ImageUrl,
                LabelResults = LabelResults.Text
            };
        }

        private void UpdateViewCount(string movieName)
        {
            conn.Open();
            sqlsel = "select Id from MovieTable where UPPER(MovieName) = " + "'" + movieName.ToUpper() + "'";
            cmd = new SqlCommand(sqlsel, conn);

            rdr = cmd.ExecuteReader();

            string s = "";
            if (rdr.HasRows && rdr.Read())
            {
                int movId = rdr.GetInt32(0);
                rdr.Close();
                UpdateViewCount(movId);

            }
            conn.Close();
        }

        private void UpdateViewCount(int movId)
        {
            sqlsel = "update MovieTable SET Viewed = Viewed + 1 WHERE Id = " + movId;
            cmd = new SqlCommand(sqlsel, conn);
            cmd.ExecuteNonQuery();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HomePage.aspx");
        }
    }

    public class MovieInfo
    {
        public string LabelResults { get; set; }
        public string LabelActors { get; set; }
        public string ImageUrl { get; set; }
        public string LabelAwards { get; set; }
        public string LabelYear { get; set; }
        public string LabelTitel { get; set; }
        public string LabelPosterYear { get; set; }
    }

    public class Value
    {
        public int id { get; set; }
        public string joke { get; set; }
    }

    public class Joke
    {
        public string type { get; set; }
        public Value value { get; set; }
    }

}