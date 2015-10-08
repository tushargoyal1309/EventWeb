using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AwsWebApp1.Models
{
    public class Answers
    {
        public string eventId { get; set; }
        public string userName { get; set; }
        public string answeredQuestions { get; set; }
        public string answersByUser { get; set; }
        public string rightChoice { get; set; }
    }
}