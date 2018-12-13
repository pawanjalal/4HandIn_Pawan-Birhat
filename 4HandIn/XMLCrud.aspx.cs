using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;

namespace _4HandIn
{
    public partial class XMLCrud : System.Web.UI.Page
    {
        DataSet ds;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                UpdatePage();
            }

            else
            {

                if (DropDownList.SelectedIndex != 0)
                {
                    ds = new DataSet();
                    ds.ReadXml(Server.MapPath("~/MyCommercial.xml"));
                    dt = ds.Tables["Ad"];


                    foreach (DataRow r in dt.Select("NavigateUrl ='" + Convert.ToString(DropDownList.SelectedValue) + "'"))
                    //foreach (DataRow r in dt.Select("NavigateUrl = 'www.lotsofcartoons.com'"))


                    {
                        //TextBoxID.Text = r["CommercialID"].ToString();
                        TextBoxWebpage.Text = r["NavigateUrl"].ToString();
                        TextBoxPhone.Text = r["Impressions"].ToString();
                        TextBoxCompany.Text = r["AlternateText"].ToString();
                        TextBoxPicture.Text = r["ImageUrl"].ToString();
                    }

                    LabelMessage.Text = TextBoxWebpage.Text + " has been selected";

                    // selected index must be set to 0 at next page load to avoid old data to in the textbox'es
                    DropDownList.SelectedIndex = 0;

                    ButtonCreate.Enabled = false;
                    ButtonUpdate.Enabled = true;
                    ButtonDelete.Enabled = true;
                }
            }
        }

        private void UpdatePage()
        {
            DropDownList.AutoPostBack = true;
            DropDownList.Items.Clear();
            try
            {
                ds = new DataSet();

                ds.ReadXml(Server.MapPath("~/MyCommercial.xml"));

                dt = ds.Tables["Ad"];


                //LabelError.Text = (dt.Rows[0][0]).ToString();

                DropDownList.DataSource = dt;

                DropDownList.DataTextField = dt.Columns[0].ToString();
                DropDownList.DataValueField = dt.Columns[0].ToString();
                DropDownList.DataBind();

            }
            catch
            {
                //The XML File does not exist or it is empty (dt makes it possible for the reapeter to display the headline)
                // this is a method for that
                MakeNewDataSetAndDataTable();

            }
            finally
            {
                Repeater1.DataSource = dt;
                Repeater1.DataBind();

                DropDownList.Items.Insert(0, "You can choose a Ad");
            }

            //TextBoxID.Text = "bruges ikke";
            TextBoxWebpage.Text = "";
            TextBoxPhone.Text = "";
            TextBoxCompany.Text = "";
            TextBoxPicture.Text = "";
            ButtonCreate.Enabled = true;
            ButtonUpdate.Enabled = false;
            ButtonDelete.Enabled = false;
        }

        private void MakeNewDataSetAndDataTable()
        {
            ds = new DataSet("Ad");
            dt = ds.Tables.Add("Ad");
            //dt.Columns.Add("CommercialID", typeof(Int32));
            dt.Columns.Add("NavigateUrl", typeof(string));
            dt.Columns.Add("Impressions", typeof(string));
            dt.Columns.Add("AlternateText", typeof(string));
            dt.Columns.Add("MyView", typeof(Int32));
            dt.Columns.Add("ImageUrl", typeof(string));
        }

        protected void ButtonCreate_Click(object sender, EventArgs e)
        {
            try
            {
                ds = new DataSet();
                ds.ReadXml(Server.MapPath("~/MyCommercial.xml"));
                dt = ds.Tables["Ad"];
            }
            catch
            {
                // the xml file does not exist
                MakeNewDataSetAndDataTable();
            }
            if (dt == null)
            {
                // the XML file exist, but is empty
                MakeNewDataSetAndDataTable();
            }


            DataRow newrow = dt.NewRow();
            //newrow["CommercialID"] = maxCommercialID + 1;
            newrow["NavigateUrl"] = TextBoxWebpage.Text;
            newrow["Impressions"] = TextBoxPhone.Text;
            newrow["AlternateText"] = TextBoxCompany.Text;
            newrow["ImageUrl"] = TextBoxPicture.Text;
            dt.Rows.Add(newrow);

            ds.WriteXml(Server.MapPath("~/MyCommercial.xml"));

            LabelMessage.Text = TextBoxWebpage.Text + " has been created with URL ";

            UpdatePage();
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            ds = new DataSet();
            ds.ReadXml(Server.MapPath("~/MyCommercial.xml"));
            dt = ds.Tables["Ad"];

            //foreach (DataRow r in dt.Select("NavigateUrl ='" + Convert.ToString(DropDownList.SelectedValue) + "'"))
            foreach (DataRow r in dt.Select("NavigateUrl = '" + Convert.ToString(TextBoxWebpage.Text) + "'"))
            {
                //r["CommercialID"] = Convert.ToInt32(TextBoxID.Text);
                r["NavigateUrl"] = Convert.ToString(TextBoxWebpage.Text);
                r["Impressions"] = TextBoxPhone.Text;
                r["AlternateText"] = TextBoxCompany.Text;
                r["ImageUrl"] = TextBoxPicture.Text;
            }

            ds.WriteXml(Server.MapPath("~/MyCommercial.xml"));

            LabelMessage.Text = TextBoxWebpage.Text + " has been updated";
            UpdatePage();
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            ds = new DataSet();
            ds.ReadXml(Server.MapPath("~/MyCommercial.xml"));
            dt = ds.Tables["Ad"];

            //foreach (DataRow r in dt.Select("NavigateUrl = " + Convert.ToInt32(TextBoxID.Text)))
            //foreach (DataRow r in dt.Select("NavigateUrl ='" + Convert.ToInt32(DropDownList.SelectedValue) + "'")) 
            foreach (DataRow r in dt.Select("NavigateUrl = '" + Convert.ToString(TextBoxWebpage.Text) + "'"))
            {
                r.Delete();
            }

            ds.WriteXml(Server.MapPath("~/MyCommercial.xml"));

            LabelMessage.Text = TextBoxWebpage.Text + " has been deleted";
            UpdatePage();
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            LabelMessage.Text = "Input filed has been cleared";

            UpdatePage();
        }
    }
}