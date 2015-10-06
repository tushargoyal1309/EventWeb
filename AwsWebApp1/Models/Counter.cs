using Amazon.ECS.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AwsWebApp1.Models
{
    public class CounterData
    {
        public int Businessid { get; set; }
        public int MenIn { get; set; }
        public int MenOut { get; set; }
        public int WomenIn { get; set; }
        public int WomenOut { get; set; }
        public List<KeyValuePair<string,int>> DataCount { get; set; }
        public string deviceToken { get; set; }
        public float latitude { get; set; }
        public float longitude { get; set; }
        public int totalpeople { get; set; }
        public int totalproducts { get; set; }
        public int totalvehicles { get; set; }
    }
    public class keyvalue
    {
        public string key { get; set; }
        public string value { get; set; }
    }
}