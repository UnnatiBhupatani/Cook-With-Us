using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class SignUp : System.Web.UI.Page
{
    string CNS = ConfigurationManager.ConnectionStrings["cnstr"].ToString();
    String QRY = string.Empty;
    SqlConnection CNN;
    SqlCommand CMD;

    bool isadmin=false;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["IsAdmin"] != null)
        {
            isadmin = bool.Parse(Session["IsAdmin"].ToString());
            if (isadmin)
                btnsignup.Text = "Create Admin";
        }
    }
    protected void btnsignup_Click(object sender, EventArgs e)
    {
        if (txtpass.Text.Equals(txtconfpass.Text))
        {
            QRY = "insert into tbl_User values(";
            QRY += " (SELECT MAX([U_id]) + 1 FROM tbl_User), ";
            QRY += "'" + txtuser.Text + "',";
            QRY += "" + txtcont.Text + ",";
            if (rdbmale.Checked == true)
            {
                QRY += "'Male', ";
            }
            else
            {
                QRY += "'Female', ";
            }
            QRY += "'" + txtpass.Text + "',";
            if(isadmin==true)
                QRY += "'TRUE',";
            else
                QRY += "'FALSE',";
            QRY += "'TRUE'";
            QRY += ")";

            CNN = new SqlConnection(CNS);
            CMD = new SqlCommand(QRY, CNN);

            CNN.Open();
            CMD.ExecuteNonQuery();
            CNN.Close();

            Response.Write("<script>alert('Your Account Is Created')</script>");
            txtuser.Text = "";
            txtcont.Text = "";
            txtpass.Text = "";
            txtconfpass.Text = "";
            
            if(isadmin)
                Response.Redirect("home.aspx");
            else
                Response.Redirect("Login.aspx");

        }
        
            
             else
            {
                Response.Write("<script>alert('password and Confirm password must be same')</script>");
               
                txtuser.Text="";
                txtcont.Text="";
                txtpass.Text="";
                txtconfpass.Text="";

                
            }

        }
    protected void btncancle_Click(object sender, EventArgs e)
    {
        txtuser.Text = "";
        txtcont.Text = "";
        txtpass.Text = "";
        txtconfpass.Text = "";
    }
}
