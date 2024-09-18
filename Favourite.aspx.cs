using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Favourite : System.Web.UI.Page
{

    string QRY = string.Empty;
    string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ToString();
     SqlConnection CNN = null;
     SqlCommand CMD = null;
     SqlDataAdapter DA = null;

     void BindImage()
     {
         if (Session["U_id"] != null)
         {
             int uid = int.Parse(Session["U_id"].ToString());
             DataSet DS_Img = new DataSet();
             CNN = new SqlConnection(cnStr);
             QRY = "SELECT IM.IMG_id, IM.IMG_name FROM tbl_Image_Master IM, tbl_AddToLike AL, tbl_Rec_Master RM ";
             QRY += "WHERE RM.IMG_id=IM.IMG_id AND ";
             QRY += "RM.RM_id=AL.RM_id AND ";
             QRY += "AL.LU_isact='TRUE' AND ";
             QRY += "AL.U_id=" + uid + " AND ";
             QRY += "IM.IMG_isact='TRUE'";
             CMD = new SqlCommand(QRY, CNN);
             SqlDataAdapter DA = new SqlDataAdapter(CMD);
             DA.Fill(DS_Img);
             rptrRec.DataSource = DS_Img.Tables[0];
             rptrRec.DataBind();
         }
         else
         {
             lblmes.Visible=true;
             lblmes.Text = "No Favourites Item Is Added";
      
         }
     }

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        BindImage();
    }
    protected void rptrRec_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            if (Session["U_id"] != null)
            {
                int uid = int.Parse(Session["U_id"].ToString());

                QRY = "DELETE FROM tbl_AddToLike ";
                QRY += "WHERE U_id="+uid+" AND ";
                QRY += "RM_id IN ( ";
                QRY += "SELECT RM_id FROM tbl_Rec_Master WHERE IMG_id="+e.CommandArgument;
                QRY += " )";
                CNN = new SqlConnection(cnStr);
                CMD = new SqlCommand(QRY, CNN);
                CNN.Open();
                CMD.ExecuteNonQuery();
                CNN.Close();
                CMD.Dispose();
                BindImage();
            }
        }
    }
}