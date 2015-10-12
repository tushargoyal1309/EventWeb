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
            if (inId.Value != "" && inEid.Value != "" && PublishTime.Text != "" && txtText.Text != "")
            {
                AmazonDynamoDBClient client = new AmazonDynamoDBClient();
                Amazon.DynamoDBv2.DocumentModel.Table table = Amazon.DynamoDBv2.DocumentModel.Table.LoadTable(client, "Announcement");

                var book = new Document();
                book["announcementId"] = inId.Value;
                book["eventId"] = inEid.Value;
                book["publishTime"] = PublishTime.Text;
                book["text"] = txtText.Text;

                table.PutItem(book);
                string script = "alert(\"Successfully created the Announcement.\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
                Response.Redirect("Announcement.aspx");
                
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