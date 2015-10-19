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
    public partial class Announcement : System.Web.UI.Page
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
                TableName = "Announcement",

            };
            var eventid = Session["EventId"].ToString();
            var response = client.Scan(request);
            List<AnnouncementData> announcementList = new List<AnnouncementData>();
            foreach (Dictionary<string, AttributeValue> item in response.ScanResult.Items)
            {
                if (eventid == item["eventId"].S)
                {
                    // Process the result.
                    AnnouncementData announcement = new AnnouncementData();
                    announcement.announcementId = item["announcementId"].S;
                    announcement.eventId = item["eventId"].S;
                    announcement.publishTime = item["publishTime"].S;
                    announcement.text = item["text"].S;
                    announcementList.Add(announcement);
                }

                Console.WriteLine(item);
            }
            DataTable dt = ToDataTable(announcementList);

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

            announcementData.DataSource = dt;
            announcementData.DataBind();
        }

        protected void announcementData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            announcementData.PageIndex = e.NewPageIndex;
            dt = GetData();
            announcementData.DataSource = dt;
            announcementData.DataBind();
        }

        protected void announcementData_SelectedIndexChanged(object sender, EventArgs e)
        {
            divMain.Visible = false;
            divEdit.Visible = true;
            Label announcementId = (Label)(announcementData.SelectedRow.FindControl("announcementId"));
            Label eventId = (Label)(announcementData.SelectedRow.FindControl("eventId"));
            Label publishTime = (Label)(announcementData.SelectedRow.FindControl("publishTime"));
            Label randomText = (Label)(announcementData.SelectedRow.FindControl("text"));
            // Label Speaker = (Label)(sessionData.SelectedRow.FindControl("speaker"));
            string aId = announcementId.Text;
            string eveId = eventId.Text;
            string pubishtime = publishTime.Text;
            string text = randomText.Text;
            // string speakerName = Speaker.Text;
           // PublishTime.Text = pubishtime;
            HfDateid.Value = pubishtime;
            Text.Text = text;
            EventId.Text = eveId;
            AnnouncementId.Text = aId;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            DateTime pTime = Convert.ToDateTime(PublishTime.Text);
            string newPublishTime = pTime.ToString("dd/MM/yyyy HH:mm tt");
            string newText = Text.Text;
            string aId = AnnouncementId.Text;
            string eventId = EventId    .Text;
            // string speaker = speakername.Text;
            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            string tableName = "Announcement";

            var request = new UpdateItemRequest
            {
                TableName = tableName,
                Key = new Dictionary<string, AttributeValue>() { { "eventId", new AttributeValue { S = eventId } }, { "announcementId", new AttributeValue { S = aId } } },
                ExpressionAttributeNames = new Dictionary<string, string>()
    {
        {"#oldPublishTime", "publishTime"},
        {"#oldText", "text"},
       // {"#oldSpeakerName", "speakerName"},
        //{"#P", "Price"},
        //{"#NA", "NewAttribute"},
        //{"#I", "ISBN"}
    },
                ExpressionAttributeValues = new Dictionary<string, AttributeValue>()
    {
        {":newPublishTime",new AttributeValue {S = newPublishTime}},
        {":newText",new AttributeValue {S = newText}},
        //{":newSpeakerName",new AttributeValue {S = speaker}},
       // {":newattr",new AttributeValue {S = "someValue"}},
    },

                // This expression does the following:
                // 1) Adds two new authors to the list
                // 2) Reduces the price
                // 3) Adds a new attribute to the item
                // 4) Removes the ISBN attribute from the item
                UpdateExpression = "SET #oldPublishTime = :newPublishTime, #oldText = :newText"
            };
            var response = client.UpdateItem(request);
            //After updating the data in db.

            divEdit.Visible = false;
            divMain.Visible = true;

            BindData();
            string script = "alert(\"Successfully updated.\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script, true);
        }

        protected void newAnnouncement_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateAnnouncement.aspx");
        }

        protected void btncancle_Click(object sender, EventArgs e)
        {
            divEdit.Visible = false;
            divMain.Visible = true;
        }

       
       
    }
}