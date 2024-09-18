using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class MasterPage : System.Web.UI.MasterPage
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IsAdmin"] != null)
        {
            bool isadmin = bool.Parse(Session["IsAdmin"].ToString());
            if (isadmin == true)
            {
                AdminLink.Visible = true;
                SignUpLink.InnerText = "Create Admin";
            }
            else
                SignUpLink.Visible = false;
           
        }
        if (Session["U_id"] != null)
        {
            linkaccount.Visible = true;
            LogoutLink.Visible = true;
            LoginLink.Visible = false;
            
        }

    }
    
}