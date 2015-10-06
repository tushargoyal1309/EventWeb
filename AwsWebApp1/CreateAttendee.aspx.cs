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
            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            Amazon.DynamoDBv2.DocumentModel.Table table = Amazon.DynamoDBv2.DocumentModel.Table.LoadTable(client, "Attendee");

            var book = new Document();
            book["eventId"] = EventId.Text;
            book["Email"] = Email.Text;
            book["Biography"] = Biography.Text;
            book["designation"] = Designation.Text;
            book["Name"] = Name.Text;
            book["organization"] = Organization.Text;
           
            table.PutItem(book);
            Response.Redirect("Events.aspx");
        }
	}
}