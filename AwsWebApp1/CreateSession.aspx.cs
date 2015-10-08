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
    public partial class CreateSession : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Session.aspx");
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            if (eventId.Text != null && startTime.Text != null && endTime.Text != null && name.Text != null && speakerName.Text != null)
            {
                AmazonDynamoDBClient client = new AmazonDynamoDBClient();
                Amazon.DynamoDBv2.DocumentModel.Table table = Amazon.DynamoDBv2.DocumentModel.Table.LoadTable(client, "Session");

                var book = new Document();
                book["eventId"] = eventId.Text;
                book["startTime"] = startTime.Text;
                book["endTime"] = endTime.Text;
                book["name"] = name.Text;
                book["speakerName"] = speakerName.Text;


                table.PutItem(book);
                Response.Redirect("Session.aspx");
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