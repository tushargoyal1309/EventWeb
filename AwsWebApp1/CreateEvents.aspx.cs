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
    public partial class CreateEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            if (description.Text != null && end.Text != null && Id.Text != null && Name.Text != null && oName.Text != null && start.Text != null && venue.Text != null)
            {
                AmazonDynamoDBClient client = new AmazonDynamoDBClient();
                Amazon.DynamoDBv2.DocumentModel.Table table = Amazon.DynamoDBv2.DocumentModel.Table.LoadTable(client, "Event");

                var book = new Document();
                book["description1"] = description.Text;
                book["endDate"] = end.Text;
                book["eventId"] = Id.Text;
                book["eventName"] = Name.Text;
                book["organiserName"] = oName.Text;
                book["startDate"] = start.Text;
                book["venue"] = venue.Text;

                table.PutItem(book);
                Response.Redirect("Events.aspx");
            }
            else
            {
                string script = "alert(\"Please fill all the data.\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Events.aspx");
        }
    }
}