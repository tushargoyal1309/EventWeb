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
            if (description.Text != "" && end.Text != "" && inId.Value != "" && Name.Text != "" && oName.Text != "" && start.Text != "" && venue.Text != "")
            {
                AmazonDynamoDBClient client = new AmazonDynamoDBClient();
                Amazon.DynamoDBv2.DocumentModel.Table table = Amazon.DynamoDBv2.DocumentModel.Table.LoadTable(client, "Event");

                var book = new Document();
                book["description1"] = description.Text;
                //DateTime date2 = Convert.ToDateTime(end.Text);
                //string endDate = date2.ToString("dd/MM/yyyy");
                book["endDate"] = end.Text;
                book["eventId"] = inId.Value;
                book["eventName"] = Name.Text;
                book["organiserName"] = oName.Text;
                //DateTime date1 = Convert.ToDateTime(start.Text);
                //string startDate = date1.ToString("dd/MM/yyyy");
                book["startDate"] = start.Text;
                book["venue"] = venue.Text;

                table.PutItem(book);
                Response.Redirect("Events.aspx");
                string script = "alert(\"Successfully created the Event.\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }
            else
            {
                string script = "alert(\"Please fill all the data correctly.\");";
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