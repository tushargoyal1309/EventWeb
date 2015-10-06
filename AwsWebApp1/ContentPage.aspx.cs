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
    public partial class ContentPage : System.Web.UI.Page
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
                TableName = "Content",

            };
            var response = client.Scan(request);
            List<ContentData> contentDataList = new List<ContentData>();
            foreach (Dictionary<string, AttributeValue> item in response.ScanResult.Items)
            {
                // Process the result.
                ContentData content = new ContentData();
                content.contentId = item["contentId"].S;
                content.eventId = item["eventId"].S;
                content.fileType = item["fileType"].S;
                content.name = item["name"].S;
               // content.name = item["contentUrl"].S;
                contentDataList.Add(content);

                Console.WriteLine(item);
            }
            DataTable dt = ToDataTable(contentDataList);

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

            contentData.DataSource = dt;
            contentData.DataBind();
        }

        protected void contentData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void contentData_SelectedIndexChanged(object sender, EventArgs e)
        {
            divMain.Visible = false;
            divEdit.Visible = true;
            Label contentId = (Label)(contentData.SelectedRow.FindControl("contentId"));
            Label eventId = (Label)(contentData.SelectedRow.FindControl("eventId"));
            Label Type = (Label)(contentData.SelectedRow.FindControl("fileType"));
            Label Name = (Label)(contentData.SelectedRow.FindControl("name"));
           // Label fileUrl = (Label)(contentData.SelectedRow.FindControl("contentUrl"));
            string cId = contentId.Text;
            string eveId = eventId.Text;
            string fileType = Name.Text;
           // string Url = fileUrl.Text;
            string fileName = Name.Text;
            // string speakerName = Speaker.Text;
            contentId.Text = cId;
            //fileupload.Text = Url;
            txtId.Text = eveId;
            filetype.Text = fileType;
            name.Text = fileName;
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
                //string Url = "https://s3.amazonaws.com/" + myBucketName + "/" + fileName;
                //string imageNew = Url;
                AmazonUploader myUploader = new AmazonUploader();
                myUploader.sendMyFileToS3(fileToBackup, myBucketName, s3DirectoryName, file.PostedFile.InputStream, file.PostedFile.FileName);
                string FileExtension = System.IO.Path.GetExtension(file.FileName); 
                string newFileType = filetype.Text;
                string newName = name.Text;
                string eventId = txtId.Text;
                string cId = contentId.Text;
                if(FileExtension == newFileType)
                {
                    AmazonDynamoDBClient client = new AmazonDynamoDBClient();
                    string tableName = "Content";

                    var request = new UpdateItemRequest
                    {
                        TableName = tableName,
                        Key = new Dictionary<string, AttributeValue>() { { "eventId", new AttributeValue { S = eventId } }, { "contentId", new AttributeValue { S = cId } } },
                        ExpressionAttributeNames = new Dictionary<string, string>()
    {
        //{"#oldUrl", "contentUrl"},
        {"#oldFileName", "name"},
        {"#oldFileType", "fileType"},
       // {"#oldSpeakerName", "speakerName"},
        //{"#P", "Price"},
        //{"#NA", "NewAttribute"},
        //{"#I", "ISBN"}
    },
                        ExpressionAttributeValues = new Dictionary<string, AttributeValue>()
    {
        //{":newUrl",new AttributeValue {S = newFile}},
        {":newFileName",new AttributeValue {S = newName}},
        {":newFileType",new AttributeValue {S = newFileType}},
        //{":newSpeakerName",new AttributeValue {S = speaker}},
       // {":newattr",new AttributeValue {S = "someValue"}},
    },

                        // This expression does the following:
                        // 1) Adds two new authors to the list
                        // 2) Reduces the price
                        // 3) Adds a new attribute to the item
                        // 4) Removes the ISBN attribute from the item
                        UpdateExpression = "SET #oldFileName = :newFileName, #oldFileType = :newFileType"
                    };
                    var response = client.UpdateItem(request);
                    //After updating the data in db.

                    divEdit.Visible = false;
                    divMain.Visible = true;

                    BindData();
                }
                else
                {
                    string script = "alert(\"Please fill correct File type for the file you've choosen.\");";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);
                }
                
                // string speaker = speakername.Text;
               
            }
            else
            {
                string script = "alert(\"Please select a file to upload.\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }
           
        }
    }
}