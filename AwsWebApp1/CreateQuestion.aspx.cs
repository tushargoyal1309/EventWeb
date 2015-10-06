using Amazon.DynamoDBv2;
using Amazon.DynamoDBv2.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AwsWebApp1
{
	public partial class CreateQuestion : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            // Amazon.DynamoDBv2.DocumentModel.Table table = Amazon.DynamoDBv2.DocumentModel.Table.LoadTable(client, "Event");
            client.PutItem("QuizQuestion", new Dictionary<string, AttributeValue>
{
    { "eventId", new AttributeValue { S = "1" } },
    { "questionId", new AttributeValue { S = "DataWriter" } },
    { "question", new AttributeValue { S = "What is the name of your company?" } },
    { "questionType", new AttributeValue { S = "Objective" } },
    { "correctAnswer", new AttributeValue { S = "c" } },
    { "endTime", new AttributeValue { S = "28/10/2017 4:00 PM" } }, 
    { "startTime", new AttributeValue { S = "28/10/2016 4:00 PM" } },
    { "options", new AttributeValue {
        M = new Dictionary<string, AttributeValue>
        {
            { "a", new AttributeValue { S = "Google" } },
            { "b", new AttributeValue { S = "Microsoft" } },
            { "c", new AttributeValue { S = "Motifworks" } },
            { "d", new AttributeValue { S = "Time" } },
            //{ "SampleInput", new AttributeValue {
            //    L = new List<AttributeValue>
            //    {
            //        new AttributeValue { BOOL = true },
            //        new AttributeValue { N =  "42" },
            //        new AttributeValue { NULL = true },
            //        new AttributeValue {
            //            SS = new List<string> { "apple", "orange" } }
            //    } }
            //}
        } }
    }
});
		}
	}
}