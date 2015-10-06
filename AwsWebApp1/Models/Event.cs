using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AwsWebApp1.Models
{
    public class Event
    {
        public string description1 { get; set; }
        public string endDate { get; set; }
        public string eventId { get; set; }
        public string eventName { get; set; }
        public string organiserName { get; set; }
        public string startDate { get; set; }
        public string venue { get; set; }

    }
}