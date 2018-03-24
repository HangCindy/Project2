using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class ProductBLL
    {
        ModelDataContext db = new ModelDataContext();

        public List<tblProduct> SelectFeatureProduct()
        {
            return db.tblProducts.OrderByDescending(p => p.Viewed).ToList();
        }

        public tblProduct GetProductByProductID(string productID)
        {
            return db.tblProducts.SingleOrDefault(p => p.ProductID == productID);
        }

        public List<tblProduct> SelectCategoryProduct(string cid)
        {
            return db.tblProducts.Where(p => p.CateID.ToString() == cid).ToList();
        }
    }
}
