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
            if (inId.Value != "" && startTime.Text != "" && endTime.Text != "" && name.Text != "" && speakerName.Text != "")
            {
                AmazonDynamoDBClient client = new AmazonDynamoDBClient();
                Amazon.DynamoDBv2.DocumentModel.Table table = Amazon.DynamoDBv2.DocumentModel.Table.LoadTable(client, "Session");

                var book = new Document();
                book["eventId"] = inId.Value;
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