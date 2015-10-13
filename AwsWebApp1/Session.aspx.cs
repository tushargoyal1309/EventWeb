using Amazon.DynamoDBv2;
using Amazon.DynamoDBv2.Model;
using AwsWebApp1.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AwsWebApp1
{
    public partial class Session : System.Web.UI.Page
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
                TableName = "Session",

            };
            var eventid = Session["EventId"].ToString();
            var response = client.Scan(request);
            List<SessionData> sessionList = new List<SessionData>();
            foreach (Dictionary<string, AttributeValue> item in response.ScanResult.Items)
            {
                if (eventid == item["eventId"].S)
                {
                    // Process the result.
                    SessionData session = new SessionData();
                    session.eventId = item["eventId"].S;
                    session.name = item["name"].S;
                    session.startTime = item["startTime"].S;
                    session.endTime = item["endTime"].S;
                    if (item.ContainsKey("speakerName"))
                    {
                        session.speakerName = item["speakerName"].S;
                    }
                    //session.endTime = item["speakerName"].S;
                    sessionList.Add(session);
                }

                Console.WriteLine(item);
            }
            DataTable dt = ToDataTable(sessionList);

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

            sessionData.DataSource = dt;
            sessionData.DataBind();
        }

        protected void sessionData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            sessionData.PageIndex = e.NewPageIndex;
            dt = GetData();
            sessionData.DataSource = dt;
            sessionData.DataBind();

        }
        protected void sessionData_SelectedIndexChanged(object sender, EventArgs e)
        {
            divMain.Visible = false;
            divEdit.Visible = true;
            Label Id = (Label)(sessionData.SelectedRow.FindControl("eventId"));
            Label Name = (Label)(sessionData.SelectedRow.FindControl("name"));
            Label Start = (Label)(sessionData.SelectedRow.FindControl("startTime"));
            Label End = (Label)(sessionData.SelectedRow.FindControl("endTime"));
            Label Speaker = (Label)(sessionData.SelectedRow.FindControl("speaker"));
            string name = Name.Text;
            string startTime = Start.Text;
            string endTime = End.Text;
            string eventId = Id.Text;
            string speakerName = Speaker.Text;
            lblStart.Text = startTime;
            txtEnd.Text = endTime;
            txtName.Text = name;
            lblId.Text = eventId;
            txtspeaker.Text = speakerName;
           // speakername.Text = speakerName;
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string startNew = lblStart.Text;
            //CultureInfo ci = new CultureInfo("en-US");
            DateTime test = Convert.ToDateTime(txtEnd.Text);
            string endNew = test.ToString("dd/MM/yyyy HH:mm tt");
            string nameNew = txtName.Text;
            string eventId = lblId.Text;
            string speaker = txtspeaker.Text;
            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            string tableName = "Session";

            var request = new UpdateItemRequest
            {
                TableName = tableName,
                Key = new Dictionary<string, AttributeValue>() { { "eventId", new AttributeValue { S = eventId } }, { "startTime", new AttributeValue { S = startNew } } },
                ExpressionAttributeNames = new Dictionary<string, string>()
    {
        {"#oldEnd", "endTime"},
        {"#oldName", "name"},
        {"#oldSpeakerName", "speakerName"},
        //{"#P", "Price"},
        //{"#NA", "NewAttribute"},
        //{"#I", "ISBN"}
    },
                ExpressionAttributeValues = new Dictionary<string, AttributeValue>()
    {
        {":newEnd",new AttributeValue {S = endNew}},
        {":newName",new AttributeValue {S = nameNew}},
        {":newSpeakerName",new AttributeValue {S = speaker}},
       // {":newattr",new AttributeValue {S = "someValue"}},
    },

                // This expression does the following:
                // 1) Adds two new authors to the list
                // 2) Reduces the price
                // 3) Adds a new attribute to the item
                // 4) Removes the ISBN attribute from the item
                UpdateExpression = "SET #oldEnd = :newEnd, #oldName = :newName, #oldSpeakerName = :newSpeakerName"
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

       
        protected void newSession_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateSession.aspx");
        }

        protected void btncancle_Click(object sender, EventArgs e)
        {
            Response.Redirect("Session.aspx");
        }

       

        
    }
}