﻿using Amazon.DynamoDBv2;
using Amazon.DynamoDBv2.DocumentModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AwsWebApp1
{
	public partial class CreateSpeaker : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Speaker.aspx");
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            if (flFile.PostedFile != null)
            {
                //string FileName = Path.GetFileName(file.PostedFile.FileName);
                string fileToBackup = flFile.PostedFile.FileName;
                string fileName = flFile.FileName;// test file
                string myBucketName = "isbils"; //your s3 bucket name goes here
                string s3DirectoryName = "";
                // string s3FileName = @"mybackupFile uploaded in 10-1-2016.png";
                string Url = "https://s3.amazonaws.com/" + myBucketName + "/" + fileName;
                string imageNew = Url;
                AmazonUploader myUploader = new AmazonUploader();
                myUploader.sendMyFileToS3(fileToBackup, myBucketName, s3DirectoryName, flFile.PostedFile.InputStream, flFile.PostedFile.FileName);
                // string FileExtension = System.IO.Path.GetExtension(file.FileName);

                AmazonDynamoDBClient client = new AmazonDynamoDBClient();
                Amazon.DynamoDBv2.DocumentModel.Table table = Amazon.DynamoDBv2.DocumentModel.Table.LoadTable(client, "Speaker");

                //var book = new Document();

                var book = new Document();
                book["eventId"] = EventId.Text;
                book["speakerName"] = SpeakerName.Text;
                book["email"] = Email.Text;
                book["designation"] = Designation.Text;
                book["biography"] = Biography.Text;
                book["imageUrl"] = Url;
                book["organization"] = Organization.Text;

                table.PutItem(book);
                Response.Redirect("Speaker.aspx");
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