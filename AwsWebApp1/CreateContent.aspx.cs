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
    public partial class CreateContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContentPage.aspx");
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            if (file.PostedFile != null && inEid.Value != "" && inCId.Value != "" && FileType.Text != "" && Name.Text != "")
            {
                //string FileName = Path.GetFileName(file.PostedFile.FileName);
                string fileToBackup = file.PostedFile.FileName;
                string fileName = file.FileName;// test file
                string myBucketName = "isbils"; //your s3 bucket name goes here
                string s3DirectoryName = "";
                // string s3FileName = @"mybackupFile uploaded in 10-1-2016.png";
                string Url = "https://s3.amazonaws.com/" + myBucketName + "/" + fileName;
                string contentNew = Url;
                AmazonUploader myUploader = new AmazonUploader();
                myUploader.sendMyFileToS3(fileToBackup, myBucketName, s3DirectoryName, file.PostedFile.InputStream, file.PostedFile.FileName);
                string FileExtension = System.IO.Path.GetExtension(file.FileName).Replace(".", "").ToLower();
                if (FileExtension == FileType.Text.ToLower())
                {
                    AmazonDynamoDBClient client = new AmazonDynamoDBClient();
                    Amazon.DynamoDBv2.DocumentModel.Table table = Amazon.DynamoDBv2.DocumentModel.Table.LoadTable(client, "Content");

                    var book = new Document();
                    book["eventId"] = inEid.Value;
                    book["contentId"] = inCId.Value;
                    book["fileType"] = FileType.Text;
                    book["name"] = Name.Text;
                    book["contentUrl"] = Url;
                    //book["Name"] = Name.Text;
                    //book["organization"] = Organization.Text;

                    table.PutItem(book);
                    Response.Redirect("ContentPage.aspx");
                }
                else
                {
                    string script = "alert(\"Please fill correct File type for the file you've choosen.\");";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);
                }
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