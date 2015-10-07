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
            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            Amazon.DynamoDBv2.DocumentModel.Table table = Amazon.DynamoDBv2.DocumentModel.Table.LoadTable(client, "Speaker");

            var book = new Document();
            book["EventId"] = EventId.Text;
            book["SpeakerName"] = SpeakerName.Text;
            book["Email"] = Email.Text;
            book["Designation"] = Designation.Text;
            book["Biography"] = Biography.Text;
           // book["ImageUrl"] = file.Text;
            book["Organization"] = Organization.Text;

            table.PutItem(book);
            Response.Redirect("Speaker.aspx");
        }
	}
}