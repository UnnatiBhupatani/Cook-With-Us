using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Login : System.Web.UI.Page
{

    static string QRY = string.Empty;
    static string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ToString();
    static SqlConnection CNN = null;
    static SqlCommand CMD = null;
    static SqlDataAdapter DA = null;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    bool isAdmin;
    int uid;
   

     protected void btnlogin_Click(object sender, EventArgs e)
     {
        
             QRY = "select * from tbl_User where ";
             QRY += "U_name = '" + txtusername.Text + "'AND ";
             QRY += "U_pass = '" + txtpassword.Text + "' AND U_isact='TRUE'";
        

         txtpassword.Focus();
         CNN = new SqlConnection(cnStr);
         CMD = new SqlCommand(QRY, CNN);
         CNN.Open();
         SqlDataReader DR = CMD.ExecuteReader();
         if (DR.Read())
         {
             isAdmin = bool.Parse(DR["IsAdmin"].ToString());
             uid = int.Parse(DR["U_id"].ToString());
             DR.Close();
             CNN.Close();
             CMD.Dispose();
             Session.Add("IsAdmin", isAdmin);
             Session.Add("U_id", uid);
             Response.Redirect("home.aspx");
         }
         else
         {
             Response.Write("<script>alert('Enter Correct User Name Or Password')</script>");
             txtusername.Text = "";
         }
     }
     protected void btncan_Click(object sender, EventArgs e)
     {
         txtusername.Text = "";
         txtpassword.Text = "";
     }
}