using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
namespace BLL
{
    public class ProductCategoryBLL
    {
        ModelDataContext db = new ModelDataContext();

        public List<tblProductCategory> SelectParent()
        {
            return db.tblProductCategories.Where(pc => pc.CateParentsID == null).ToList();
        }

        public List<tblProductCategory> SelectChildByParentID(int parentID)
        {
            return db.tblProductCategories.Where(pc => pc.CateParentsID == parentID).ToList();
        }
    }
}
