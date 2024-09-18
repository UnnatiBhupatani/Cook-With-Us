using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Recipe_Master : System.Web.UI.Page
{
    string ImgId, ImgName;
    string QRY = string.Empty;
    string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ToString();
    SqlConnection CNN;
    SqlCommand CMD;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        ImgId = Request.QueryString["ImgId"].ToString();
        ImgName = Request.QueryString["ImgName"].ToString();
        RcpImg.ImageUrl = "Handler.ashx?myID="+ImgId;
        lblrecname.Text = ImgName;
        LoadData();
        LoadIngredients();
    }
    void LoadIngredients()
    {
        QRY = "SELECT DISTINCT ING.ING_name, RIM.ING_qty FROM ";
        QRY += "tbl_Rec_Master RM, ";
        QRY += "tbl_RecIng_Master RIM, ";
        QRY += "ING_master ING ";
        QRY += "WHERE ";
        QRY += "RM.RM_id = RIM.RM_id AND ";
        QRY += "RIM.ING_id = ING.ING_id AND ";
        QRY += "RM.IMG_id = "+ImgId+" AND ";
        QRY += "RM.RM_isact='TRUE' AND ";
        QRY += "RIM.RIM_isact = 'TRUE' AND ";
        QRY += "ING.ING_isact='TRUE'";

        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        DataSet DS_Img = new DataSet();
        SqlDataAdapter DA = new SqlDataAdapter(CMD);
        DA.Fill(DS_Img);
        rptring.DataSource = DS_Img.Tables[0];
        rptring.DataBind();
    }
    void LoadData()
    {
        QRY = "SELECT RM_preparetime, RM_desc, RM_method ";
        QRY += "FROM tbl_Rec_Master ";
        QRY += "WHERE IMG_id="+ImgId;
        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY,CNN);
        CNN.Open();
        SqlDataReader DR = CMD.ExecuteReader();
        while (DR.Read())
        {
            lblprepare.Text = DR["RM_preparetime"].ToString();
            lbldescription.Text = DR["RM_desc"].ToString();
            lblmethod.Text = DR["RM_method"].ToString();
        }
        DR.Close();
        CNN.Close();
        CMD.Dispose();
    }
}