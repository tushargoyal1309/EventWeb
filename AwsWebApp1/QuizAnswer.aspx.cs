using Amazon.DynamoDBv2;
using Amazon.DynamoDBv2.Model;
using AwsWebApp1.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AwsWebApp1
{
    public partial class QuizAnswer : System.Web.UI.Page
    {
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            dt = new DataTable();
            dt = GetData();

            gvQuizAnswer.DataSource = dt;
            gvQuizAnswer.DataBind();
        }


        DataTable GetData()
        {
            AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            var request = new ScanRequest
            {
                TableName = "QuizAnswer",
            };
            var eventid = Session["EventId"].ToString();
            var response = client.Scan(request);
            List<Answers> answersList = new List<Answers>(); 
            foreach (Dictionary<string, AttributeValue> item in response.ScanResult.Items)
            {
                if (eventid == item["eventId"].S)
                {
                    // Process the result.
                    Answers answers = new Answers();
                    answers.userName = item["username"].S;
                    if (item.ContainsKey("answeredQuestion"))
                    {
                        string test1234 = string.Empty;
                        string testRemoveComa = string.Empty;
                        string correctAnswers = string.Empty;
                        string testRemoveComaFromAnswers = string.Empty;
                        string realCorrectAnswers = string.Empty;
                        string removeComaFromRealCorrectAnswers = string.Empty;
                        foreach (var itemNew in item["answeredQuestion"].M)
                        {
                            if (item["answeredQuestion"].M.Count > 0)
                            {
                                test1234 += itemNew.Key + "#";
                                correctAnswers += itemNew.Value.S + ",";
                                var requestNew = new ScanRequest
            {
                TableName = "QuizQuestion",
            };
                    var responseForAnswer = client.Scan(requestNew);
                    foreach (Dictionary<string, AttributeValue> itemQuestion in responseForAnswer.ScanResult.Items)
                    {
                        if(itemNew.Key == itemQuestion["question"].S)
                        {
                            
                            if (itemQuestion.ContainsKey("correctAnswer"))
                            {
                               // answers.rightChoice = itemQuestion["correctAnswer"].S;
                                realCorrectAnswers += itemQuestion["correctAnswer"].S + ",";
                                removeComaFromRealCorrectAnswers = realCorrectAnswers.Remove(realCorrectAnswers.Length - 1);
                            }
                        }
                    }
                            }

                        }
                        testRemoveComa = test1234.Remove(test1234.Length - 1);
                        testRemoveComaFromAnswers = correctAnswers.Remove(correctAnswers.Length - 1);
                        answers.answeredQuestions = testRemoveComa;
                        answers.answersByUser = testRemoveComaFromAnswers;
                        answers.rightChoice = removeComaFromRealCorrectAnswers;
                    }
                    
                     answersList.Add(answers);
                }
                //Console.WriteLine(item);
            }
           
            
            //    //Console.WriteLine(item);
            //}
            dt = ToDataTable(answersList);

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

        protected void gvQuizAnswer_SelectedIndexChanged(object sender, EventArgs e)
        {
            divMain.Visible = false;
            divEdit.Visible = true;
            Label lblId = (Label)(gvQuizAnswer.SelectedRow.FindControl("lbluserId"));
            Label questionsLabel = (Label)(gvQuizAnswer.SelectedRow.FindControl("lblQuestions"));
            Label answersLabel = (Label)(gvQuizAnswer.SelectedRow.FindControl("lblAnswers"));
            Label lblAnswer = (Label)(gvQuizAnswer.SelectedRow.FindControl("lblCorrectAnswer"));
            string uId = lblId.Text;
            string questionData = questionsLabel.Text;
            string answerData = answersLabel.Text;
            string answer = lblAnswer.Text;
            lblName.Text = uId;
            //lblRightAnswer.Text = answer;
            string[] questions = questionData.Split('#');

            for (int i = 0; i < questions.Count(); i++)
            {
                Literal lt = new Literal();
                lt.Text = "<br />";
                divEdit.Controls.Add(lt);

                TextBox ques = new TextBox();
                ques.ReadOnly = true;
                ques.Width = 700;
                ques.ID = "txtQuestions" + i;
                ques.ClientIDMode = ClientIDMode.Static;
                ques.Text = questions[i].ToString();
                // Session["ctrlCount"] = optionsCount.Count();
                divEdit.Controls.Add(ques);

                Literal lt3 = new Literal();
                lt3.Text = "<br />";
                divEdit.Controls.Add(lt3);

            }

            Literal lt5 = new Literal();
            lt5.Text = "<br />";
            divEdit.Controls.Add(lt5);

            Label gap = new Label();
            gap.Font.Bold = true;
            gap.Text = "Answers Respectively:";
            // Session["ctrlCount"] = optionsCount.Count();
            divEdit.Controls.Add(gap);

            Literal lt4 = new Literal();
            lt4.Text = "<br />";
            divEdit.Controls.Add(lt4);
            string[] answers = answerData.Split(',');

            for (int i = 0; i < answers.Count(); i++)
            {
                Literal lt1 = new Literal();
                lt1.Text = "<br />";
                divEdit.Controls.Add(lt1);

                TextBox ans = new TextBox();
                ans.Width = 100;
                ans.ReadOnly = true;
                ans.ID = "txtAnswers" + i;
                ans.ClientIDMode = ClientIDMode.Static;
                ans.Text = answers[i].ToString();
                // Session["ctrlCount"] = optionsCount.Count();
                divEdit.Controls.Add(ans);

                Literal lt2 = new Literal();
                lt2.Text = "<br />";
                divEdit.Controls.Add(lt2);
            }
            Literal lt6 = new Literal();
            lt6.Text = "<br />";
            divEdit.Controls.Add(lt6);

            Label gap2 = new Label();
            gap2.Font.Bold = true;
            gap2.Text = "Correct Answers Of Objective questions only:";
            // Session["ctrlCount"] = optionsCount.Count();
            divEdit.Controls.Add(gap2);

            Literal lt7 = new Literal();
            lt7.Text = "<br />";
            divEdit.Controls.Add(lt7);
            string[] realAnswers = answer.Split(',');

            for (int i = 0; i < realAnswers.Count(); i++)
            {
                Literal lt = new Literal();
                lt.Text = "<br />";
                divEdit.Controls.Add(lt);

                TextBox anss = new TextBox();
                anss.ReadOnly = true;
                anss.Width = 700;
                anss.ID = "txtCorrectAnswers" + i;
                anss.ClientIDMode = ClientIDMode.Static;
                anss.Text = realAnswers[i].ToString();
                // Session["ctrlCount"] = optionsCount.Count();
                divEdit.Controls.Add(anss);

                Literal lt3 = new Literal();
                lt3.Text = "<br />";
                divEdit.Controls.Add(lt3);

            }
        }
    }
}