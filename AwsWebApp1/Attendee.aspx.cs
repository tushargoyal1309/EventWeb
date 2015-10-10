using Amazon;
using Amazon.DynamoDBv2;
using Amazon.DynamoDBv2.Model;
using Amazon.S3;
using Amazon.S3.Model;
using Amazon.S3.Transfer;
using AwsWebApp1.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AwsWebApp1
{
    public partial class Attende : System.Web.UI.Page
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
                TableName = "Attendee",

            };
            var eventid = Session["EventId"].ToString(); 
            var response = client.Scan(request);
            List<Attendee> attendeeList = new List<Attendee>();
            foreach (Dictionary<string, AttributeValue> item in response.ScanResult.Items)
            {
                if (eventid == item["eventId"].S)
                {
                    // Process the result.
                    Attendee attendeeNew = new Attendee();
                    attendeeNew.biography = item["biography"].S;
                    attendeeNew.designation = item["designation"].S;
                    attendeeNew.email = item["email"].S;
                    attendeeNew.eventId = item["eventId"].S;
                    attendeeNew.imageUrl = item["imageUrl"].S;
                    attendeeNew.name = item["name"].S;
                    attendeeNew.organization = item["organization"].S;
                    attendeeList.Add(attendeeNew);
                }
                //Console.WriteLine(item);
            }
            dt = ToDataTable(attendeeList);

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

            attendee.DataSource = dt;
            attendee.DataBind();
        }

        protected void attendee_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            attendee.PageIndex = e.NewPageIndex;
            dt = GetData();
            attendee.DataSource = dt;
            attendee.DataBind();

        }

        protected void attendee_SelectedIndexChanged(object sender, EventArgs e)
        {
            divMain.Visible = false;
            divEdit.Visible = true;
            Label Bio = (Label)(attendee.SelectedRow.FindControl("biography"));
            Label Designation = (Label)(attendee.SelectedRow.FindControl("designation"));
            Label Mail = (Label)(attendee.SelectedRow.FindControl("email"));
            Label Id = (Label)(attendee.SelectedRow.FindControl("eventId"));
            Label Name = (Label)(attendee.SelectedRow.FindControl("name"));
            Label Org = (Label)(attendee.SelectedRow.FindControl("organization"));
            Label Url = (Label)(attendee.SelectedRow.FindControl("imageUrl"));
            string biography = Bio.Text;
            string desig = Designation.Text;
            string email = Mail.Text;
            string eventId = Id.Text;
            string name = Name.Text;
            string org = Org.Text;
            string image = Url.Text;
            txtBio.Value = biography;
            txtDesignation.Text = desig;
            txtEmail.Text = email;
            txtEventId.Text = eventId;
            Image.ImageUrl = image;
            txtName.Text = name;
            txtOrganisation.Text = org;
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (file.PostedFile != null && file.PostedFile.FileName != "")
            {
                //string FileName = Path.GetFileName(file.PostedFile.FileName);
                string fileToBackup = file.PostedFile.FileName;
                string fileName = file.FileName;// test file
                string myBucketName = "isbils"; //your s3 bucket name goes here
                string s3DirectoryName = "";
                // string s3FileName = @"mybackupFile uploaded in 10-1-2016.png";
                string Url = "https://s3.amazonaws.com/" + myBucketName + "/" + fileName;
                string imageNew = Url;
                AmazonUploader myUploader = new AmazonUploader();
                myUploader.sendMyFileToS3(fileToBackup, myBucketName, s3DirectoryName, file.PostedFile.InputStream, file.PostedFile.FileName);
                string bioNew = txtBio.Value;
                string desigNew = txtDesignation.Text;
                string emailNew = txtEmail.Text;
                //string imageNotUpdated = Image.ImageUrl;
                string newName = txtName.Text;
                string orgNew = txtOrganisation.Text;
                string eventId = txtEventId.Text;
                AmazonDynamoDBClient client = new AmazonDynamoDBClient();
                string tableName = "Attendee";

                var request = new UpdateItemRequest
                {
                    TableName = tableName,
                    Key = new Dictionary<string, AttributeValue>() { { "eventId", new AttributeValue { S = eventId } }, { "email", new AttributeValue { S = emailNew } } },
                    ExpressionAttributeNames = new Dictionary<string, string>()
    {
        {"#oldBio", "biography"},
        {"#oldDesignation", "designation"},
        {"#oldImage", "imageUrl"},
        {"#oldName", "name"},
        {"#oldOrganisation", "organization"},
        //{"#P", "Price"},
        //{"#NA", "NewAttribute"},
        //{"#I", "ISBN"}
    },
                    ExpressionAttributeValues = new Dictionary<string, AttributeValue>()
    {
        {":newBiography",new AttributeValue {S = bioNew}},
        {":newDesignation",new AttributeValue {S = desigNew}},
        {":newImage",new AttributeValue {S = imageNew}},
        {":newName",new AttributeValue {S = newName}},
        {":newOrganisation",new AttributeValue {S = orgNew}},
       // {":newattr",new AttributeValue {S = "someValue"}},
    },

                    // This expression does the following:
                    // 1) Adds two new authors to the list
                    // 2) Reduces the price
                    // 3) Adds a new attribute to the item
                    // 4) Removes the ISBN attribute from the item
                    UpdateExpression = "SET #oldBio = :newBiography, #oldDesignation = :newDesignation, #oldImage = :newImage, #oldName = :newName, #oldOrganisation = :newOrganisation"
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
            else
            {
                string bioNew = txtBio.Value;
                string desigNew = txtDesignation.Text;
                string emailNew = txtEmail.Text;
                //string imageNotUpdated = Image.ImageUrl;
                string newName = txtName.Text;
                string orgNew = txtOrganisation.Text;
                string eventId = txtEventId.Text;
                AmazonDynamoDBClient client = new AmazonDynamoDBClient();
                string tableName = "Attendee";

                var request = new UpdateItemRequest
                {
                    TableName = tableName,
                    Key = new Dictionary<string, AttributeValue>() { { "eventId", new AttributeValue { S = eventId } }, { "email", new AttributeValue { S = emailNew } } },
                    ExpressionAttributeNames = new Dictionary<string, string>()
    {
        {"#oldBio", "biography"},
        {"#oldDesignation", "designation"},
       // {"#oldImage", "imageUrl"},
        {"#oldName", "name"},
        {"#oldOrganisation", "organization"},
        //{"#P", "Price"},
        //{"#NA", "NewAttribute"},
        //{"#I", "ISBN"}
    },
                    ExpressionAttributeValues = new Dictionary<string, AttributeValue>()
    {
        {":newBiography",new AttributeValue {S = bioNew}},
        {":newDesignation",new AttributeValue {S = desigNew}},
        //{":newImage",new AttributeValue {S = imageNew}},
        {":newName",new AttributeValue {S = newName}},
        {":newOrganisation",new AttributeValue {S = orgNew}},
       // {":newattr",new AttributeValue {S = "someValue"}},
    },

                    // This expression does the following:
                    // 1) Adds two new authors to the list
                    // 2) Reduces the price
                    // 3) Adds a new attribute to the item
                    // 4) Removes the ISBN attribute from the item
                    UpdateExpression = "SET #oldBio = :newBiography, #oldDesignation = :newDesignation, #oldName = :newName, #oldOrganisation = :newOrganisation"
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
           
        }

        protected void newAttendee_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateAttendee.aspx");
        }

        protected void btncancle_Click(object sender, EventArgs e)
        {
            divEdit.Visible = false;
            divMain.Visible = true;
        }
    }
}

