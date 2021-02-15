using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace js
{
    public partial class homepage : System.Web.UI.Page
    {
        void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["accountType"] != null)
            {
                if (Session["accountType"].ToString() == "customer")
                {
                    MasterPageFile = "~/unitedMasterPage2.master";
                }
                else if (Session["accountType"].ToString() == "seller")
                {
                    MasterPageFile = "~/unitedMasterPage3.master";
                }
            }
            else
            {
                MasterPageFile = "~/unitedMasterPage.master";
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
 
        }
    }
}