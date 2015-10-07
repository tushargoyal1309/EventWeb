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
	public partial class CreateAnnouncement : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Announcement.aspx");
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            Amazon.DynamoDBv2.DocumentModel.Table table = Amazon.DynamoDBv2.DocumentModel.Table.LoadTable(client, "Announcement");

            var book = new Document();
            book["AnnouncementId"] = AnnouncementId.Text;
            book["EventId"] = EventId.Text;
            book["PublishTime"] = PublishTime.Text;
            book["Text"] = txtText.Text;
            
            table.PutItem(book);
            Response.Redirect("Announcement.aspx");
        }
	}
}