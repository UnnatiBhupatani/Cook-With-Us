using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ShowUserRec : System.Web.UI.Page
{
    string QRY = string.Empty;
    string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ToString();
    SqlConnection CNN = null;
    SqlCommand CMD = null;
    SqlDataAdapter DA = null;


    void BindMyGrid()
    {
        if (Session["U_id"] != null)
        {
            int uid = int.Parse(Session["U_id"].ToString());

            QRY = "SELECT RM_id, RIM.FCM_name, IMG_id, RM_name, RM_preparetime, RM_desc, RM_method ";
            QRY += "FROM tbl_Rec_Master RM, tbl_FoodCat_Master RIM  WHERE  RM.FCM_id = RIM.FCM_id AND RM.U_id=" + uid + " AND  ";
            QRY += "RM_isact = 'True' AND RM_id>0";
            QRY += "ORDER BY RM_id";

            CNN = new SqlConnection(cnStr);
            CMD = new SqlCommand(QRY, CNN);
            CNN.Open();
            SqlDataAdapter DA = new SqlDataAdapter(CMD);
            DataSet DS = new DataSet();
            DA.Fill(DS);
            dtGrd_rec.DataSource = DS.Tables[0];
            dtGrd_rec.DataBind();
            CMD.Dispose();

        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindMyGrid();
    }
}