using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AwsWebApp1.Models
{
    public class LoginCredential
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public string eventId { get; set; }
    }
}