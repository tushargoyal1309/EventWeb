using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AwsWebApp1.Models
{
    public class AnnouncementData
    {
        public string announcementId { get; set; }
        public string eventId { get; set; }
        public string publishTime { get; set; }
        public string text { get; set; }
    }
}