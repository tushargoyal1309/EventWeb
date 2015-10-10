using Amazon.DynamoDBv2;
using Amazon.DynamoDBv2.DocumentModel;
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
    public partial class Events : System.Web.UI.Page
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
            var request = new ScanRequest
            {
                TableName = "Event",
            };
            var eventid = Session["EventId"].ToString(); 
            var response = client.Scan(request);
            List<Event> eventList = new List<Event>();
            foreach (Dictionary<string, AttributeValue> item in response.ScanResult.Items)
            {
                if (eventid == item["eventId"].S)
                {
                    // Process the result.
                    Event eventNew = new Event();
                    eventNew.description1 = item["description1"].S;
                    eventNew.endDate = item["endDate"].S;
                    eventNew.eventId = item["eventId"].S;
                    eventNew.eventName = item["eventName"].S;
                    eventNew.organiserName = item["organiserName"].S;
                    eventNew.startDate = item["startDate"].S;
                    eventNew.venue = item["venue"].S;
                    eventList.Add(eventNew);
                }
                //Console.WriteLine(item);
            }
            dt = ToDataTable(eventList);

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

            EventData.DataSource = dt;
            EventData.DataBind();
        }


        protected void EventData_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            EventData.EditIndex = -1;
            BindData();
        }
        protected void EventData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                // Convert the row index stored in the CommandArgument
                // property to an Integer.
                int index = Convert.ToInt32(e.CommandArgument);
                //index1 = index;
                // Get the last name of the selected author from the appropriate
                // cell in the GridView control.
                GridViewRow selectedRow = EventData.Rows[index];
            }
            else if (e.CommandName == "Update")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                DataRow row = dt.Rows[index];
                string desc = row["description1"].ToString();
            }
        }
        protected void EventData_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {


            // string tushar = EventData.Rows[e.RowIndex].;
            //DataRow row = dt.Rows[index];
            //string desc = row["description1"].ToString();
            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            Amazon.DynamoDBv2.DocumentModel.Table table = Amazon.DynamoDBv2.DocumentModel.Table.LoadTable(client, "EventTest");
            //int index = Convert.ToInt32(e.CommandArgument);
            // GridViewRow selectedRow = EventData.Rows[index1];
            TextBox txtReply = (TextBox)EventData.Rows[e.RowIndex].FindControl("description1");
            var book = new Document();
            // book["description1"] = new List<string> { selectedRow.Cells[0].Text };
            book["endDate"] = new List<string> { EventData.SelectedRow.Cells[1].ToString() };
            book["eventId"] = new List<string> { EventData.SelectedRow.Cells[2].ToString() };
            book["eventName"] = new List<string> { EventData.SelectedRow.Cells[3].ToString() };
            book["organiserName"] = new List<string> { EventData.SelectedRow.Cells[4].ToString() };
            book["startDate"] = new List<string> { EventData.SelectedRow.Cells[5].ToString() };
            book["venue"] = new List<string> { EventData.SelectedRow.Cells[6].ToString() };
            table.UpdateItem(book);
        }

        protected void EventData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            EventData.PageIndex = e.NewPageIndex;
            dt = GetData();
            EventData.DataSource = dt;
            EventData.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
                string descNew = txtDesc.Value;
                string eventNew = txtEventName.Text;
                string oNewName = txtOName.Text;
                string newStartDate = txtSatrt.Text;
                string newVenue = txtVenue.Text;
                string newEndDate = txtEnd.Text;
                string eventId = txtEventId.Text;
                AmazonDynamoDBClient client = new AmazonDynamoDBClient();
                string tableName = "Event";

                var request = new UpdateItemRequest
                {
                    TableName = tableName,
                    Key = new Dictionary<string, AttributeValue>() { { "eventId", new AttributeValue { S = eventId } } },
                    ExpressionAttributeNames = new Dictionary<string, string>()
    {
        {"#oldDescription", "description1"},
        {"#oldName", "eventName"},
        {"#oldStartDate", "startDate"},
        {"#oldEndDate", "endDate"},
        {"#oldOrganiserName", "organiserName"},
        {"#oldVenue", "venue"},
        //{"#P", "Price"},
        //{"#NA", "NewAttribute"},
        //{"#I", "ISBN"}
    },
                    ExpressionAttributeValues = new Dictionary<string, AttributeValue>()
    {
        {":newDescription",new AttributeValue {S = descNew}},
        {":newName",new AttributeValue {S = eventNew}},
        {":newStartDate",new AttributeValue {S = newStartDate}},
        {":newEndDate",new AttributeValue {S = newEndDate}},
        {":newOrganiserName",new AttributeValue {S = oNewName}},
        {":newVenue",new AttributeValue {S = newVenue}},
       // {":newattr",new AttributeValue {S = "someValue"}},
    },

                    // This expression does the following:
                    // 1) Adds two new authors to the list
                    // 2) Reduces the price
                    // 3) Adds a new attribute to the item
                    // 4) Removes the ISBN attribute from the item
                    UpdateExpression = "SET #oldDescription = :newDescription, #oldName = :newName, #oldStartDate = :newStartDate, #oldEndDate = :newEndDate, #oldOrganiserName = :newOrganiserName, #oldVenue = :newVenue"
                };
                var response = client.UpdateItem(request);
                //After updating the data in db.

                divSearchResult.Visible = false;
                divMain.Visible = true;

                BindData();
                string script = "alert(\"Successfully updated.\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
        }
       

        protected void EventData_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Accessing TemplateField Column controls
            divMain.Visible = false;
            divSearchResult.Visible = true;
            Label Desc = (Label)(EventData.SelectedRow.FindControl("description1"));
            Label End = (Label)(EventData.SelectedRow.FindControl("endDate"));
            Label Id = (Label)(EventData.SelectedRow.FindControl("eventId"));
            Label Name = (Label)(EventData.SelectedRow.FindControl("eventName"));
            Label OName = (Label)(EventData.SelectedRow.FindControl("organiserName"));
            Label Start = (Label)(EventData.SelectedRow.FindControl("startDate"));
            Label Venue = (Label)(EventData.SelectedRow.FindControl("venue"));
            string description = Desc.Text;
            string endDate = End.Text;
            string eventId = Id.Text;
            string eventName = Name.Text;
            string organiserName = OName.Text;
            string startDate = Start.Text;
            string Place = Venue.Text;
            txtDesc.Value = description;
            txtEnd.Text = endDate;
            txtEventId.Text = eventId;
            txtEventName.Text = eventName;
            txtOName.Text = organiserName;
            txtSatrt.Text = startDate;
            txtVenue.Text = Place;
        }

        protected void newEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateEvents.aspx");
        }

        protected void btncancle_Click(object sender, EventArgs e)
        {
            divSearchResult.Visible = false;
            divMain.Visible = true;
        }
    }
}