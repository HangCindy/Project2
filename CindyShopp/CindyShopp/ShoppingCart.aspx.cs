using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CindyShopp
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        static DataTable dtCart = new DataTable();

        protected void Load_Data()
        {
            dtCart = (DataTable)Session["Cart"];
            gvCart.DataSource = dtCart;

            if (dtCart.Rows.Count == 0)
            {
                Label lbCart = this.FindControl("lbNoCart") as Label;
                lbNoCart.Text = "You have not chosen any product.";
                
            }
            gvCart.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_Data();
            }

        }

        protected void gvCart_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCart.EditIndex = e.NewEditIndex;
            Load_Data();
        }

        protected void gvCart_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCart.EditIndex = -1;
            Load_Data();
        }

        protected void gvCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            GridViewRow gvr = gvCart.Rows[index];
            HiddenField hdID = (HiddenField)gvr.Cells[1].FindControl("hdID");
            DataTable dtCart = Session["Cart"] as DataTable;
            DataRow r = dtCart.Rows.Find(hdID.Value);
            dtCart.Rows.Remove(r);
            Session["Cart"] = dtCart;
            Load_Data();
        }

        protected void gvCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            GridViewRow gvr = gvCart.Rows[index];
            HiddenField hdID = (HiddenField)gvr.Cells[1].FindControl("hdID");
            TextBox txtQuantity = (TextBox)gvr.Cells[3].FindControl("txtQuantity");
            DataTable dtCart = Session["Cart"] as DataTable;
            DataRow r = dtCart.Rows.Find(hdID.Value);
            r["Quantity"] = int.Parse(txtQuantity.Text);
            Session["Cart"] = dtCart;
            gvCart.EditIndex = -1;
            Load_Data();
        }
    }
}