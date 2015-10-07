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
            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            Amazon.DynamoDBv2.DocumentModel.Table table = Amazon.DynamoDBv2.DocumentModel.Table.LoadTable(client, "Sponsor");

            var book = new Document();
            book["description"] = description.Text;
            book["eventId"] = EventId.Text;
            book["logoUrl"] = file.Text;
            book["name"] = Name.Text;
            book["sno"] = sno.Text;
            book["type"] = Type.Text;
            
            table.PutItem(book);
            Response.Redirect("Sponsor.aspx");
        }
	}
}