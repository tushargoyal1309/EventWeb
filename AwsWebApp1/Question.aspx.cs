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
            Control c = GetPostBackControl(this.Page);

            if (c != null)
            {
                if (c.ID != "btncancle")
                {
                    List<string> keys = Request.Form.AllKeys.Where(key => key.Contains("txtOptions")).ToList();

                    int i = 0;
                    foreach (string key in keys)
                    {
                        this.CreateTextBox("txtOptions" + i);
                        i++;
                    }
                }
            }
        }

        public static Control GetPostBackControl(Page page)
        {
            Control control = null;
            string ctrlname = page.Request.Params.Get("__EVENTTARGET");
            if (ctrlname != null && ctrlname != String.Empty)
            {
                control = page.FindControl(ctrlname);

            }
            else
            {
                foreach (string ctl in page.Request.Form)
                {
                    Control c = page.FindControl(ctl);
                    if (c is System.Web.UI.WebControls.Button)
                    {
                        control = c;
                        break;
                    }
                }

            }
            return control;
        }

        DataTable GetData()
        {
            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            // string tableName = "Attendee";
            var request = new ScanRequest
            {
                TableName = "QuizQuestion",

            };
            var eventid = Session["EventId"].ToString();
            var response = client.Scan(request);
            List<QuestionData> questionDataList = new List<QuestionData>();
            //var template = new TemplateField();
            //template.HeaderText = "Options";
            //template.ItemTemplate = new LinkColumn();
            //questionData.Columns.Add(template);
            foreach (Dictionary<string, AttributeValue> item in response.ScanResult.Items)
            {
                if (eventid == item["eventId"].S)
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
                }

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
            questionData.PageIndex = e.NewPageIndex;
            dt = GetData();
            questionData.DataSource = dt;
            questionData.DataBind();
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
            //txtOptions.Text = choices;

            string[] optionsCount = choices.Split(',');

            for (int i = 0; i < optionsCount.Count(); i++)
            {
                TextBox txt = new TextBox();
                txt.ID = "txtOptions" + i;
                txt.Font.Size = 10;
                txt.ClientIDMode = ClientIDMode.Static;
                txt.Text = string.Empty;
                txt.Text = optionsCount[i].ToString();
                txt.CssClass = "form-control input-sm";
                Session["ctrlCount"] = optionsCount.Count();
                pnlOptions.Controls.Add(txt);

                Literal lt = new Literal();
                lt.Text = "<br />";
                pnlOptions.Controls.Add(lt);
            }

            //pnlEdit.Controls.Add(new TextBox());

        }

        private void CreateTextBox(string id)
        {
            TextBox txt = new TextBox();
            txt.ID = id;
            txt.ClientIDMode = ClientIDMode.Static;
            txt.CssClass = "form-control input-sm";
            pnlOptions.Controls.Add(txt);

            Literal lt = new Literal();
            lt.Text = "<br />";
            pnlOptions.Controls.Add(lt);
        }

        private void ClearCreateTextBox(string id)
        {
            TextBox txt = new TextBox();
            txt.ID = id;
            txt.ClientIDMode = ClientIDMode.Static;
            txt.CssClass = "form-control input-sm";
            txt.Text = string.Empty;
            pnlOptions.Controls.Add(txt);

            Literal lt = new Literal();
            lt.Text = "<br />";
            pnlOptions.Controls.Add(lt);
        }



        protected void AddTextBox(object sender, EventArgs e)
        {
            // int index = pnlOptions.Controls.OfType<TextBox>().ToList().Count + 1;
            // this.CreateTextBox("txtOptions" + index);
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            string questionNew = txtQuestionEdit.Text;
            string eventNew = eId.Text;
            string questionIdNew = lblquestionId.Text;
            string newCorrectAnswer = txtCorrectanswer.Text;
            string newType = txtQuestionType.Text;
            //string newChoices = txtOptions.Text;

            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            string tableName = "QuizQuestion";

            string message = "";
            int iCount = 0;
            int iNewCount = 0;
            List<string> txtOptionsList = new List<string>();

            int index = pnlOptions.Controls.OfType<TextBox>().ToList().Count();

            //TextBox textBoxLast = pnlOptions.Controls.OfType<TextBox>().LastOrDefault();

            //pnlOptions.Controls.OfType<TextBox>().ToList().Remove(textBoxLast);

            //pnlOptions.Controls.OfType<TextBox>().ToList().LastOrDefault().Visible = false;

            int getIndex = index - 1;
            foreach (TextBox textBox in pnlOptions.Controls.OfType<TextBox>())
            {
                if (!string.IsNullOrEmpty(textBox.Text))
                {
                    // iCount = iCount + 1;

                    //  if (iCount > 4)
                    {

                        if (textBox.ID == "txtOptions" + iNewCount)
                        {
                            iNewCount = iNewCount + 1;
                            message = textBox.Text;
                            txtOptionsList.Add(message);
                        }
                    }

                }
            }

            string alpha = "ABCDEFGHIJKLMNOPQRSTUVQXYZ";

            Dictionary<string, AttributeValue> attValue = new Dictionary<string, AttributeValue>();
            int alphabet = 0;
            for (int i = 0; i <= txtOptionsList.Count - 1; i++)
            {
                AttributeValue attribute = new AttributeValue();
                attribute.S = txtOptionsList[i];
                attValue.Add(alpha[alphabet].ToString().ToLower(), attribute);
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
            M = attValue
        }}
    },

                UpdateExpression = "SET #oldQuestion = :newQuestion, #oldCorrectAnswer = :newCorrectAnswer, #oldOptions = :newOptions"
            };
            var response = client.UpdateItem(request);
            //After updating the data in db.

            pnlEdit.Visible = false;
            divMain.Visible = true;

            BindData();
            string script = "alert(\"Successfully updated.\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script, true);
        }

        protected void btncancle_Click(object sender, EventArgs e)
        {
            List<string> keys = Request.Form.AllKeys.Where(key => key.Contains("txtOptions")).ToList();

            int i = 0;
            foreach (string key in keys)
            {
                this.ClearCreateTextBox("txtOptions" + i);
                i++;
            }

            pnlEdit.Visible = false;
            divMain.Visible = true;
        }

        protected void btnNewQuestion_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateQuestion.aspx");
        }


    }

}
