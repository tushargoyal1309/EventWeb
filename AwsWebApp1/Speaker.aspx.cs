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
    public partial class Speaker : System.Web.UI.Page
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
                TableName = "Speaker",

            };
            var eventid = Session["EventId"].ToString();
            var response = client.Scan(request);
            List<SpeakerData> speakerList = new List<SpeakerData>();
            foreach (Dictionary<string, AttributeValue> item in response.ScanResult.Items)
            {
                if (eventid == item["eventId"].S)
                {
                    // Process the result.
                    SpeakerData speaker = new SpeakerData();
                    speaker.eventId = item["eventId"].S;
                    speaker.speakerName = item["speakerName"].S;
                    speaker.email = item["email"].S;
                    speaker.designation = item["designation"].S;
                    speaker.biography = item["biography"].S;
                    speaker.imageUrl = item["imageUrl"].S;
                    speaker.organization = item["organization"].S;
                    speakerList.Add(speaker);
                }

                Console.WriteLine(item);
            }
            DataTable dt = ToDataTable(speakerList);

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

            speakerData.DataSource = dt;
            speakerData.DataBind();
        }

        protected void speakerData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            speakerData.PageIndex = e.NewPageIndex;
            dt = GetData();
            speakerData.DataSource = dt;
            speakerData.DataBind();
        }

        protected void speakerData_SelectedIndexChanged(object sender, EventArgs e)
        {
            divMain.Visible = false;
            divEdit.Visible = true;
            Label Id = (Label)(speakerData.SelectedRow.FindControl("eventId"));
            Label speakerName = (Label)(speakerData.SelectedRow.FindControl("speakerName"));
            Label mail = (Label)(speakerData.SelectedRow.FindControl("email"));
            Label designation = (Label)(speakerData.SelectedRow.FindControl("designation"));
            Label biography = (Label)(speakerData.SelectedRow.FindControl("biography"));
            Label imageUrl = (Label)(speakerData.SelectedRow.FindControl("imageUrl"));
            Label org = (Label)(speakerData.SelectedRow.FindControl("organization"));
            string eventId = Id.Text;
            string name = speakerName.Text;
            string eMail = mail.Text;
            string Designation = designation.Text;
            string Biography = biography.Text;
            string Url = imageUrl.Text;
            string Org = org.Text;
            // string speakerName = Speaker.Text;
            txtBio.Value = Biography;
            txtDesignation.Text = Designation;
            txtmail.Text = eMail;
            Image.ImageUrl = Url;
            txtOrganisation.Text = Org;
            txtSpeakerName.Text = name;
            EventId.Text = eventId;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (file.PostedFile != null)
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
                string emailNew = txtmail.Text;
                // string imageNotUpdated = Image.ImageUrl;
                string newName = txtSpeakerName.Text;
                string orgNew = txtOrganisation.Text;
                string eventId = EventId.Text;
                AmazonDynamoDBClient client = new AmazonDynamoDBClient();
                string tableName = "Speaker";

                var request = new UpdateItemRequest
                {
                    TableName = tableName,
                    Key = new Dictionary<string, AttributeValue>() { { "eventId", new AttributeValue { S = eventId } }, { "email", new AttributeValue { S = emailNew } } },
                    ExpressionAttributeNames = new Dictionary<string, string>()
    {
        {"#oldBio", "biography"},
        {"#oldDesignation", "designation"},
        {"#oldImage", "imageUrl"},
        {"#oldName", "speakerName"},
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
            }
            else
            {
                string bioNew = txtBio.Value;
                string desigNew = txtDesignation.Text;
                string emailNew = txtmail.Text;
                // string imageNotUpdated = Image.ImageUrl;
                string newName = txtSpeakerName.Text;
                string orgNew = txtOrganisation.Text;
                string eventId = EventId.Text;
                AmazonDynamoDBClient client = new AmazonDynamoDBClient();
                string tableName = "Speaker";

                var request = new UpdateItemRequest
                {
                    TableName = tableName,
                    Key = new Dictionary<string, AttributeValue>() { { "eventId", new AttributeValue { S = eventId } }, { "email", new AttributeValue { S = emailNew } } },
                    ExpressionAttributeNames = new Dictionary<string, string>()
    {
        {"#oldBio", "biography"},
        {"#oldDesignation", "designation"},
        //{"#oldImage", "imageUrl"},
        {"#oldName", "speakerName"},
        {"#oldOrganisation", "organization"},
        //{"#P", "Price"},
        //{"#NA", "NewAttribute"},
        //{"#I", "ISBN"}
    },
                    ExpressionAttributeValues = new Dictionary<string, AttributeValue>()
    {
        {":newBiography",new AttributeValue {S = bioNew}},
        {":newDesignation",new AttributeValue {S = desigNew}},
       // {":newImage",new AttributeValue {S = imageNew}},
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
            }
           
        }

        protected void newSpeaker_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateSpeaker.aspx");
        }

        protected void btncancle_Click(object sender, EventArgs e)
        {
            divEdit.Visible = false;
            divMain.Visible = true;
        }

       
    }
}