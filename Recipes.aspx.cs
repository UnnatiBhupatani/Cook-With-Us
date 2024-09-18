using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Recipes : System.Web.UI.Page
{

     string QRY = string.Empty;
     string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ToString();
     SqlConnection CNN = null;
     SqlCommand CMD = null;
     SqlDataAdapter DA = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindImage();
            LoadCat();
        }
    }
    void BindImage()
    {
        DataSet DS_Img = new DataSet();
        CNN = new SqlConnection(cnStr);
        QRY = "SELECT IMG_id,IMG_name FROM tbl_Image_Master WHERE IMG_isact='True'";
        CMD = new SqlCommand(QRY, CNN);
        SqlDataAdapter DA = new SqlDataAdapter(CMD);
        DA.Fill(DS_Img);
        rptrRec.DataSource = DS_Img.Tables[0];
        rptrRec.DataBind();
    }
    void BinddFilteredImage(string cat)
    {
        DataSet DS_Img = new DataSet();
        CNN = new SqlConnection(cnStr);
        QRY = "SELECT IMG_id,IMG_name FROM tbl_Image_Master WHERE IMG_isact='True' AND IMG_id IN ";
        QRY += "(SELECT IMG_id FROM tbl_Rec_Master WHERE RM_isact='TRUE' AND FCM_id IN ";
        QRY += "(SELECT FCM_id FROM tbl_FoodCat_Master WHERE FCM_name='" + cat + "' AND FCM_isact='TRUE'))";
        CMD = new SqlCommand(QRY, CNN);
        SqlDataAdapter DA = new SqlDataAdapter(CMD);
        DA.Fill(DS_Img);
        rptrRec.DataSource = DS_Img.Tables[0];
        rptrRec.DataBind();
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {


    }
    protected void rptrRec_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Like")
        {
            if (Session["U_id"] != null)
            {
                int uid = int.Parse(Session["U_id"].ToString());

                QRY = "INSERT INTO tbl_AddToLike VALUES( ";
                QRY += "(SELECT MAX(LU_id)+1 FROM tbl_AddToLike), ";
                QRY += uid + ", ";
                QRY += "(SELECT RM_id FROM tbl_Rec_Master WHERE IMG_id=" + e.CommandArgument + "), ";
                QRY += "'TRUE' ";
                QRY += ") ";
                CNN = new SqlConnection(cnStr);
                CMD = new SqlCommand(QRY, CNN);
                CNN.Open();
                CMD.ExecuteNonQuery();
                CNN.Close();
                CMD.Dispose();
            }
            else
            {
              //  Response.Write("<script>alert('You Are Not Loged In! ')</script>");
                Response.Redirect("Login.aspx");
            }

        }
    }

    void LoadCat()
    {
        drpcat.Items.Clear();
        QRY = "SELECT FCM_ID, FCM_name  FROM tbl_FoodCat_Master WHERE FCM_isact = 'TRUE' ORDER BY FCM_name";
        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        SqlDataReader DR = CMD.ExecuteReader();
        if (DR.HasRows)
        {
            while (DR.Read())
            {
                ListItem LI = new ListItem();
                LI.Value = DR.GetValue(0).ToString();
                LI.Text = DR.GetValue(1).ToString();
                drpcat.Items.Add(LI);

                LI = null;
            }
        }
        DR.Close();
        DR.Dispose();
        CMD.Dispose();
        CNN.Close();
        drpcat.SelectedIndex = 0;
    }
    protected void drpcat_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpcat.SelectedIndex > 0)
            BinddFilteredImage(drpcat.SelectedItem.Text.ToString());
        else if (drpcat.SelectedIndex == 0)
            BindImage();
    }
}