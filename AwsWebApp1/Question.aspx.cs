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
using System.Web.UI.HtmlControls;
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

            List<string> keys = Request.Form.AllKeys.Where(key => key.Contains("txtOptions")).ToList();
            int i = 0;
            foreach (string key in keys)
            {
                this.CreateTextBox("txtOptions" + i);
                i++;
            }
        }

        protected void GetTextBoxValues(object sender, EventArgs e)
        {
            string message = "";
            foreach (TextBox textBox in pnlEdit.Controls.OfType<TextBox>())
            {
                message += textBox.ID + ": " + textBox.Text + "\\n";
            }
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "alert('" + message + "');", true);
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
                    string testRemoveComa = string.Empty;

                    foreach (var itemNew in item["options"].M)
                    {

                        if (item["options"].M.Count > 1)
                        {
                            test1234 += itemNew.Value.S + ",";

                        }

                    }
                    testRemoveComa = test1234.Remove(test1234.Length - 1);
                    question.options = testRemoveComa;
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
            pnlEdit.Visible = true;
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
            txtQuestionEdit.Text = name;
            txtCorrectanswer.Text = rightAnswer;
            txtQuestionType.Text = typeOfQuestion;
            txtOptions.Text = choices;

            string[] optionsCount = choices.Split(',');

            for (int i = 0; i < optionsCount.Count(); i++)
            {
                TextBox txt = new TextBox();
                txt.ID = "txtOptions" + i;
                txt.ClientIDMode = ClientIDMode.Static;
                txt.Text = optionsCount[i].ToString();
                Session["ctrlCount"] = optionsCount.Count();
                pnlEdit.Controls.Add(txt);
            }

            //pnlEdit.Controls.Add(new TextBox());

        }

        private void CreateTextBox(string id)
        {
            TextBox txt = new TextBox();
            txt.ID = id;
            pnlEdit.Controls.Add(txt);

            Literal lt = new Literal();
            lt.Text = "<br />";
            pnlEdit.Controls.Add(lt);
        }



        protected void AddTextBox(object sender, EventArgs e)
        {
            //  int index = pnlEdit.Controls.OfType<TextBox>().ToList().Count + 1;
            // this.CreateTextBox("txtOptions" + index);
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            string questionNew = txtQuestionEdit.Text;
            string eventNew = eId.Text;
            string questionIdNew = lblquestionId.Text;
            string newCorrectAnswer = txtCorrectanswer.Text;
            string newType = txtQuestionType.Text;
            string newChoices = txtOptions.Text;

            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            string tableName = "QuizQuestion";

            int count = Convert.ToInt16(Session["ctrlCount"]);

            string message = "";
            int iCount = 0;
            int iNewCount = 0;
            List<string> txtOptionsList = new List<string>();
            foreach (TextBox textBox in pnlEdit.Controls.OfType<TextBox>())
            {
                iCount = iCount + 1;
                if (iCount > 4)
                {
                    if (textBox.ID == "txtOptions" + iNewCount)
                    {
                        iNewCount = iNewCount + 1;
                        message = textBox.Text;
                    }
                }
                txtOptionsList.Add(message);
            }

            string alpha = "ABCDEFGHIJKLMNOPQRSTUVQXYZ";

            Dictionary<string, AttributeValue> tttt = new Dictionary<string, AttributeValue>();
            int alphabet = 0;
            for (int i = 4; i < txtOptionsList.Count - 1; i++)
            {
                AttributeValue attribute = new AttributeValue();
                attribute.S = txtOptionsList[i];
                tttt.Add(alpha[alphabet].ToString().ToLower(), attribute);
                alphabet = alphabet + 1;
            }

            var request = new UpdateItemRequest
            {
                TableName = tableName,
                Key = new Dictionary<string, AttributeValue>() { { "eventId", new AttributeValue { S = eventNew } }, { "questionId", new AttributeValue { S = questionIdNew } } },
                ExpressionAttributeNames = new Dictionary<string, string>()
    {
        {"#oldQuestion", "question"},
        {"#oldCorrectAnswer", "correctAnswer"},
        {"#oldOptions", "options"},
    },
                ExpressionAttributeValues = new Dictionary<string, AttributeValue>()
    {
        {":newQuestion",new AttributeValue {S = questionNew}},
        {":newCorrectAnswer",new AttributeValue {S = newCorrectAnswer}},
        {":newOptions",new AttributeValue 
        {
            M = tttt
        }}
    },

                UpdateExpression = "SET #oldQuestion = :newQuestion, #oldCorrectAnswer = :newCorrectAnswer, #oldOptions = :newOptions"
            };
            var response = client.UpdateItem(request);
            //After updating the data in db.

            pnlEdit.Visible = false;
            divMain.Visible = true;

            BindData();
        }


    }

}
