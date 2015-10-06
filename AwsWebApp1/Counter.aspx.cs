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
    public partial class Counter : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             AmazonDynamoDBClient client = new AmazonDynamoDBClient();
            // string tableName = "Attendee";
            var request = new ScanRequest
            {
                TableName = "Counter",

            };
            var response = client.Scan(request);
            List<CounterData> counterDataList = new List<CounterData>();
            foreach (Dictionary<string, AttributeValue> item in response.ScanResult.Items)
            {
                // Process the result.
                CounterData counter = new CounterData();
                counter.Businessid = Convert.ToInt32(item["Businessid"].N);
                counter.MenIn = Convert.ToInt32(item["DataCount"].M["MenIn"].N);
                counter.MenOut = Convert.ToInt32(item["DataCount"].M["MenOut"].N);
                counter.WomenIn = Convert.ToInt32(item["DataCount"].M["WomenIn"].N);
                counter.WomenOut = Convert.ToInt32(item["DataCount"].M["WomenOut"].N);
                counter.deviceToken = item["deviceToken"].S;
                counter.latitude = float.Parse(item["latitude"].N);
                counter.longitude = float.Parse(item["longitude"].N);
                counter.totalpeople = Convert.ToInt32(item["totalpeople"].N);
                counter.totalproducts = Convert.ToInt32(item["totalproducts"].N);
                counter.totalvehicles = Convert.ToInt32(item["totalvehicles"].N);
                counterDataList.Add(counter);

                Console.WriteLine(item);
            }
            DataTable dt = ToDataTable(counterDataList);
            counterData.DataSource = dt;
            counterData.DataBind();
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

        protected void counterData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }
        }
    }
