using Amazon.DynamoDBv2;
using Amazon.DynamoDBv2.Model;
using AwsWebApp1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AwsWebApp1
{
    class LinkColumn : ITemplate
    {
        public void InstantiateIn(System.Web.UI.Control container)
        {

            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            // string tableName = "Attendee";
            var request = new ScanRequest
            {
                TableName = "QuizQuestion",

            };
            var response = client.Scan(request);
            List<QuestionData> questionDataList = new List<QuestionData>();
            foreach (Dictionary<string, AttributeValue> item in response.ScanResult.Items)
            {
                // Process the result.

                QuestionData question = new QuestionData();
                if (item.ContainsKey("options"))
                {
                        foreach (var itemNew in item["options"].M)
                        {
                            Label link = new Label();
                            link.ID = "linkmodel";
                            container.Controls.Add(link);
                            link.Text = itemNew.Value.S;
                            //Label value = questionData.FindControl("options") as Label;
                            ////testM = itemNew.Key.ToString();
                            //value.Text = itemNew.Value.S;
                        }
                }
                
            }
            
        }
    }
}