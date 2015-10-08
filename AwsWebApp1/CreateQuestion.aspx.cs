﻿using Amazon.DynamoDBv2;
using Amazon.DynamoDBv2.DocumentModel;
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
            if (!IsPostBack)
            {

            }

            List<string> keys = Request.Form.AllKeys.Where(key => key.Contains("txtOptions")).ToList();
            int i = 1;
            foreach (string key in keys)
            {
                this.CreateTextBox("txtOptions" + i);
                i++;
            }
        }

        private void CreateTextBox(string id)
        {
            TextBox txt = new TextBox();
            txt.ID = id;
            txt.ClientIDMode = ClientIDMode.Static;
            txt.CssClass = "form-control input-sm";
            divTest.Controls.Add(txt);

            Literal lt = new Literal();
            lt.Text = "<br />";
            divTest.Controls.Add(lt);
        }

        protected void btnAddMore_Click(object sender, EventArgs e)
        {
            //int index = divTest.Controls.OfType<TextBox>().ToList().Count + 1;
            //this.CreateTextBox("txtOptions" + index);
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            try
            {

                string message = "";
                int iCount = 0;
                int iNewCount = 0;
                List<string> txtOptionsList = new List<string>();
                foreach (TextBox textBox in divTest.Controls.OfType<TextBox>())
                {
                    if (!string.IsNullOrEmpty(textBox.Text))
                    {
                        if (textBox.ID == "txtOptions" + iNewCount)
                        {
                            iNewCount = iNewCount + 1;
                            message = textBox.Text;
                        }
                        txtOptionsList.Add(message);
                    }
                }
                //txtOptionsList.Remove(txtOptionsList[txtOptionsList.Count() - 1]);

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
                AmazonDynamoDBClient client = new AmazonDynamoDBClient();
                // Amazon.DynamoDBv2.DocumentModel.Table table = Amazon.DynamoDBv2.DocumentModel.Table.LoadTable(client, "Event");
                client.PutItem("QuizQuestion", new Dictionary<string, AttributeValue>

            {
    { "eventId", new AttributeValue { S = txtEventId.Text } },
    { "questionId", new AttributeValue { S = txtQuestionId.Text } },
    { "question", new AttributeValue { S = txtQuestion.Text } },
    { "questionType", new AttributeValue { S = ddlQuestionType.SelectedItem.Text } },
    { "correctAnswer", new AttributeValue { S = txtCorrectAnswer.Text } },
    //{ "endTime", new AttributeValue { S = "28/10/2017 4:00 PM" } }, 
    //{ "startTime", new AttributeValue { S = "28/10/2016 4:00 PM" } },
    { "options", new AttributeValue {
        M = attValue 
    }
    }
});
                Response.Redirect("Question.aspx");

            }
            catch (Exception ex)
            {

                throw;
            }
        }

        protected void ddlQuestionType_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlQuestionType_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (ddlQuestionType.SelectedIndex == 0)
            {
                divOptions.Visible = true;
            }
            else
            {
                divOptions.Visible = false;
                divDescriptive.Visible = true;
            }
        }
    }
}