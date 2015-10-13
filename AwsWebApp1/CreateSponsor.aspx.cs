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
    public partial class CreateSponsor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Sponsor.aspx");
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            if (file.PostedFile != null && inId.Value != "" && description.Text != "" && Name.Text != "" && sno.Text != "" && Type.Text != "")
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
                string FileExtension = System.IO.Path.GetExtension(file.FileName).Replace(".", "").ToLower();
                if (FileExtension == "jpg" || FileExtension == "png")
                {
                    AmazonDynamoDBClient client = new AmazonDynamoDBClient();
                    Amazon.DynamoDBv2.DocumentModel.Table table = Amazon.DynamoDBv2.DocumentModel.Table.LoadTable(client, "Sponsor");
                    var book = new Document();
                    book["description"] = description.Text;
                    book["eventId"] = inId.Value;
                    book["logoUrl"] = Url;
                    book["name"] = Name.Text;
                    book["sno"] = sno.Text;
                    book["type"] = Type.Text;

                    table.PutItem(book);
                    Response.Redirect("Sponsor.aspx");
                    string script = "alert(\"Successfully created the Sponsor.\");";
                    ScriptManager.RegisterStartupScript(this, GetType(),
                                          "ServerControlScript", script, true);
                }
                else
                {
                    string script = "alert(\"Please choose a file with extension 'png' or 'jpg'.\");";
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