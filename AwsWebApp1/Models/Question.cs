using Amazon.ECS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AwsWebApp1.Models
{
    public class QuestionData
    {
        public List<int> answerers { get; set; }
        public string correctAnswer { get; set; }
        public string questionType { get; set; }
        public string eventId { get; set; }
        public string optionA { get; set; }
        public string optionB { get; set; }
        public string optionC { get; set; }
        public string optionD { get; set; }
        public string options { get; set; }
        public string question { get; set; }
        public string questionId { get; set; }
    }

    //public class keyvalue
    //{
    //    public string key { get; set; }
    //    public string value { get; set; }
    //}
}