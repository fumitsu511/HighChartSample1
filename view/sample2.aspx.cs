using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace HighChartSample.view
{
    public partial class sample2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string jsonString =
                @"{
                data:
                 [
                 {
                    ""value"":[
                    49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4
                    ]
                 },
                 {
                    ""value"":[
                    50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0, 50.0
                    ]
                 }
                 ]
                }";


            Options options = JsonConvert.DeserializeObject<Options>(jsonString);


            Session["options"] = JsonConvert.SerializeObject(options);
            Session["test"] = "test";
        }
    }

    public class Options
    {
        public List<Data> data { get; set; }
    }


    public class Data
    {
        public List<Decimal> value { get; set; }
    }
}