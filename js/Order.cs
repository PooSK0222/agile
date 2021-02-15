using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace js
{
    public class Order
    {
        public string productId;
        public string date;
        public string time;


        public Order(string productId, string date, string time)
        {
            this.productId = productId;
            this.date = date;
            this.time = time;
        }
    }
}