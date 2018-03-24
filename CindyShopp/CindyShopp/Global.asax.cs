using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace CindyShopp
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            DataTable dtCart = new DataTable();
            dtCart.Columns.Add("ID", typeof(string));
            dtCart.Columns.Add("Name", typeof(string));
            dtCart.Columns.Add("Image", typeof(string));
            dtCart.Columns.Add("Price", typeof(float));
            dtCart.Columns.Add("Quantity", typeof(int));
            dtCart.Columns["Quantity"].DefaultValue = 1;
            dtCart.Columns.Add("Amount", typeof(float), "Price * Quantity");
            dtCart.PrimaryKey = new DataColumn[] { dtCart.Columns[0] };
            Session["Cart"] = dtCart;
        }
    }
}