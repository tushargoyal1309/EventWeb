using Amazon.DynamoDBv2;
using Amazon.DynamoDBv2.Model;
using AwsWebApp1.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AwsWebApp1
{
    public partial class Sponsor : System.Web.UI.Page
    {
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        DataTable GetData()
        {
            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            // string tableName = "Attendee";
            var request = new ScanRequest
            {
                TableName = "Sponsor",

            };
            var eventid = Session["EventId"].ToString();
            var response = client.Scan(request);
            List<SponsorData> sponsorList = new List<SponsorData>();
            foreach (Dictionary<string, AttributeValue> item in response.ScanResult.Items)
            {
                if (eventid == item["eventId"].S)
                {
                    // Process the result.
                    SponsorData sponsor = new SponsorData();
                    sponsor.sno = item["sno"].S;
                    sponsor.eventId = item["eventId"].S;
                    sponsor.name = item["name"].S;
                    sponsor.type = item["type"].S;
                    sponsor.logoUrl = item["logoUrl"].S;
                    sponsor.description = item["description"].S;
                    sponsorList.Add(sponsor);
                }

                Console.WriteLine(item);
            }
            DataTable dt = ToDataTable(sponsorList);

            return dt;
        }
        public static DataTable ToDataTable<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);

            //Get all the properties
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                //Setting column names as Property names
                dataTable.Columns.Add(prop.Name);
            }
            foreach (T item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {
                    //inserting property values to datatable rows
                    values[i] = Props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }
            //put a breakpoint here and check datatable
            return dataTable;
        }

        private void BindData()
        {
            dt = new DataTable();
            dt = GetData();

            sponsorData.DataSource = dt;
            sponsorData.DataBind();
        }

        protected void sponsorData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void sponsorData_SelectedIndexChanged(object sender, EventArgs e)
        {
            divMain.Visible = false;
            divEdit.Visible = true;
            Label Sno = (Label)(sponsorData.SelectedRow.FindControl("sno"));
            Label eventId = (Label)(sponsorData.SelectedRow.FindControl("eventId"));
            Label Name = (Label)(sponsorData.SelectedRow.FindControl("name"));
            Label Type = (Label)(sponsorData.SelectedRow.FindControl("type"));
            Label logoUrl = (Label)(sponsorData.SelectedRow.FindControl("logoUrl"));
            Label desc = (Label)(sponsorData.SelectedRow.FindControl("description"));
            string SerialNo = Sno.Text;
            string eveId = eventId.Text;
            string name = Name.Text;
            string Url = logoUrl.Text;
            string type = Type.Text;
            string Desc = desc.Text;
            // string speakerName = Speaker.Text;
            Description.Value = Desc;
            logo.ImageUrl = Url;
            txtEventId.Text = eveId;
            sno.Text = SerialNo;
            txtEventName.Text = name;
            txttype.Text = type;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string newDescription = Description.Value;
            string newSponsorType = txttype.Text;
            string newSponsorName = txtEventName.Text;
            string eventId = txtEventId.Text;
            string Sno = sno.Text;
            string Url = logo.ImageUrl;
            // string speaker = speakername.Text;
            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            string tableName = "Sponsor";

            var request = new UpdateItemRequest
            {
                TableName = tableName,
                Key = new Dictionary<string, AttributeValue>() { { "eventId", new AttributeValue { S = eventId } }, { "logoUrl", new AttributeValue { S = Url } } },
                ExpressionAttributeNames = new Dictionary<string, string>()
    {
        {"#oldDescription", "description"},
        {"#oldname", "name"},
        {"#oldtype", "type"},
        {"#oldsno", "sno"},
       // {"#oldSpeakerName", "speakerName"},
        //{"#P", "Price"},
        //{"#NA", "NewAttribute"},
        //{"#I", "ISBN"}
    },
                ExpressionAttributeValues = new Dictionary<string, AttributeValue>()
    {
        {":newDescription",new AttributeValue {S = newDescription}},
        {":newname",new AttributeValue {S = newSponsorName}},
        {":newtype",new AttributeValue {S = newSponsorType}},
        {":newsno",new AttributeValue {S = Sno}},
        //{":newSpeakerName",new AttributeValue {S = speaker}},
       // {":newattr",new AttributeValue {S = "someValue"}},
    },

                // This expression does the following:
                // 1) Adds two new authors to the list
                // 2) Reduces the price
                // 3) Adds a new attribute to the item
                // 4) Removes the ISBN attribute from the item
                UpdateExpression = "SET #oldDescription = :newDescription, #oldname = :newname, #oldtype = :newtype, #oldsno = :newsno"
            };
            var response = client.UpdateItem(request);
            //After updating the data in db.

            divEdit.Visible = false;
            divMain.Visible = true;

            BindData();
        }

        protected void btncancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("Sponsor.aspx");
        }

        protected void newSponsor_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateSponsor.aspx");
        }

       }
}