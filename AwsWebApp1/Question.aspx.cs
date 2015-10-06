using Amazon.DynamoDBv2;
using Amazon.DynamoDBv2.Model;
using AwsWebApp1.Models;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AwsWebApp1
{
    public partial class Question : System.Web.UI.Page
    {
        DataTable dt;
        int count;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        DataTable GetData()
        {
            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            // string tableName = "Attendee";
            var request = new ScanRequest
            {
                TableName = "QuizQuestion",

            };
            var response = client.Scan(request);
            List<QuestionData> questionDataList = new List<QuestionData>();
            //var template = new TemplateField();
            //template.HeaderText = "Options";
            //template.ItemTemplate = new LinkColumn();
            //questionData.Columns.Add(template);
            foreach (Dictionary<string, AttributeValue> item in response.ScanResult.Items)
            {
                // Process the result.

                QuestionData question = new QuestionData();
                if (item.ContainsKey("correctAnswer"))
                {
                    question.correctAnswer = item["correctAnswer"].S;
                }
                question.eventId = item["eventId"].S;
                question.question = item["question"].S;
                question.questionId = item["questionId"].S;
                question.questionType = item["questionType"].S;

                if (item.ContainsKey("options"))
                {
                    string test1234 = string.Empty;
                    foreach (var itemNew in item["options"].M)
                    {

                        test1234 += itemNew.Value.S;

                    }
                    question.options = test1234;
                }
                questionDataList.Add(question);

                //Console.WriteLine(item);
            }
            DataTable dt = ToDataTable(questionDataList);

            return dt;
        }
        public static DataTable ToDataTable<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);

            //Get all the properties
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                //Setting column names as Property names
                dataTable.Columns.Add(prop.Name);
            }
            foreach (T item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {
                    //inserting property values to datatable rows
                    values[i] = Props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }
            //put a breakpoint here and check datatable
            return dataTable;
        }
        private void BindData()
        {
            dt = new DataTable();
            dt = GetData();

            questionData.DataSource = dt;
            questionData.DataBind();
        }

        protected void questionData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void questionData_SelectedIndexChanged(object sender, EventArgs e)
        {
            divMain.Visible = false;
            divEdit.Visible = true;
            Label correct = (Label)(questionData.SelectedRow.FindControl("correctAnswer"));
            Label answerOptions = (Label)(questionData.SelectedRow.FindControl("options"));
            Label id = (Label)(questionData.SelectedRow.FindControl("eventId"));
            Label questionName = (Label)(questionData.SelectedRow.FindControl("question"));
            Label questionId = (Label)(questionData.SelectedRow.FindControl("questionId"));
            Label type = (Label)(questionData.SelectedRow.FindControl("lblQuestionType"));
            string qId = questionId.Text;
            string eveId = id.Text;
            string rightAnswer = correct.Text;
            string choices = answerOptions.Text;
            string name = questionName.Text;
            string typeOfQuestion = type.Text;
            eId.Text = eveId;
            lblquestionId.Text = qId;
            questionEdit.Text = name;
            correctanswer.Text = rightAnswer;
            questionType.Text = typeOfQuestion;
            txtOptions.Text = choices;

        }

        protected void Update_Click(object sender, EventArgs e)
        {
                string questionNew = questionEdit.Text;
                string eventNew = eId.Text;
                string questionIdNew = lblquestionId.Text;
                string newCorrectAnswer = correctanswer.Text;
                string newType = questionType.Text;
            string newChoices = txtOptions.Text;
                //string newOptionA = optionA.Text;
                //string newOptionB = optionB.Text;
                //string newOptionC = optionC.Text;
                //string newOptionD = optionD.Text;
                AmazonDynamoDBClient client = new AmazonDynamoDBClient();
                string tableName = "QuizQuestion";

                var request = new UpdateItemRequest
                {
                    TableName = tableName,
                    Key = new Dictionary<string, AttributeValue>() { { "eventId", new AttributeValue { S = eventNew } }, { "questionId", new AttributeValue { S = questionIdNew } } },
                    ExpressionAttributeNames = new Dictionary<string, string>()
    {
        {"#oldQuestion", "question"},
        {"#oldCorrectAnswer", "correctAnswer"},
        {"#oldOptions", "options"},
        //{"#oldEndDate", "endDate"},
        //{"#oldOrganiserName", "organiserName"},
        //{"#oldVenue", "venue"},
        //{"#P", "Price"},
        //{"#NA", "NewAttribute"},
        //{"#I", "ISBN"}
    },
                    ExpressionAttributeValues = new Dictionary<string, AttributeValue>()
    {
        {":newQuestion",new AttributeValue {S = questionNew}},
        {":newCorrectAnswer",new AttributeValue {S = newCorrectAnswer}},
        {":newOptions",new AttributeValue 
        {
            M = new Dictionary<string, AttributeValue>
        {
            //{ "a", new AttributeValue { S = newOptionA } },
            //{ "b", new AttributeValue { S = newOptionB } },
            //{ "c", new AttributeValue { S = newOptionC } },
            //{ "d", new AttributeValue { S = newOptionD } },
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
        }
        }}
    },

                    // This expression does the following:
                    // 1) Adds two new authors to the list
                    // 2) Reduces the price
                    // 3) Adds a new attribute to the item
                    // 4) Removes the ISBN attribute from the item
                    UpdateExpression = "SET #oldQuestion = :newQuestion, #oldCorrectAnswer = :newCorrectAnswer, #oldOptions = :newOptions"
                };
                var response = client.UpdateItem(request);
                //After updating the data in db.

                divEdit.Visible = false;
                divMain.Visible = true;

                BindData();
            }


        }

    }
