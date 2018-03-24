using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using DAL;

namespace CindyShopp
{
    public partial class ListProducts : System.Web.UI.Page
    {
        ProductCategoryBLL cateBLL = new ProductCategoryBLL();
        ProductBLL prodBLL = new ProductBLL();
        public bool haveChild = true;

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                string cid = Request.QueryString["cid"].ToString();
                rptCategory.DataSource = cateBLL.SelectParent();
                rptCategory.DataBind();

                rptFeatureProducts.DataSource = prodBLL.SelectCategoryProduct(cid);
                rptFeatureProducts.DataBind();
            }
        }

        protected void rptCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater rptChilden = (Repeater)e.Item.FindControl("rptChilds");
            HiddenField hdId = (HiddenField)e.Item.FindControl("hdParentID");
            if (cateBLL.SelectChildByParentID(int.Parse(hdId.Value)).Count == 0) haveChild = false;
            rptChilden.DataSource = cateBLL.SelectChildByParentID(int.Parse(hdId.Value));
            rptChilden.DataBind();
        }

        protected void rptFeatureProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Add")
            {
                string proID = e.CommandArgument.ToString();
                var p = prodBLL.GetProductByProductID(proID);
                DataTable dtCart = (DataTable)Session["Cart"] as DataTable;
                DataRow dtRow = dtCart.Rows.Find(proID);
                if (dtRow != null)
                {
                    dtRow["Quantity"] = (int)dtRow["Quantity"] + 1;
                }
                else
                {
                    dtCart.Rows.Add(p.ProductID, p.ProductName, p.ImagePath, p.UnitPrice, 1, p.UnitPrice);
                }
                Session["Cart"] = dtCart;
                //Response.Redirect("/ShoppingCart.aspx");
            }
        }
    }
}