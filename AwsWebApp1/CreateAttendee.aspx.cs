using Amazon.DynamoDBv2;
using Amazon.DynamoDBv2.DocumentModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AwsWebApp1
{
    public partial class CreateAttendee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Attendee.aspx");
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            if (file.PostedFile != null && inId.Value != "" && Email.Text != "" && Biography.Text != "" && Designation.Text != "" && Name.Text != "" && Organization.Text != "")
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
                // string FileExtension = System.IO.Path.GetExtension(file.FileName);

                AmazonDynamoDBClient client = new AmazonDynamoDBClient();
                Amazon.DynamoDBv2.DocumentModel.Table table = Amazon.DynamoDBv2.DocumentModel.Table.LoadTable(client, "Attendee");

                var book = new Document();
                book["eventId"] = inId.Value;
                book["email"] = Email.Text;
                book["biography"] = Biography.Text;
                book["designation"] = Designation.Text;
                book["name"] = Name.Text;
                book["organization"] = Organization.Text;
                book["imageUrl"] = imageNew;
                table.PutItem(book);
                Response.Redirect("Attendee.aspx");

            }
            else
            {
                string script = "alert(\"Please fill all the data.\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }
        }
    }
}