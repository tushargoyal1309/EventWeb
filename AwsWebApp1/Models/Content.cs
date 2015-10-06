using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AwsWebApp1.Models
{
    public class ContentData
    {
        public string contentId { get; set; }
        public string eventId { get; set; }
        public string fileType { get; set; }
        public string name { get; set; }
        public string contentUrl { get; set; }

    }
}