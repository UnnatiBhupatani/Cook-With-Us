using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Ingrediants : System.Web.UI.Page
{
    string QRY = string.Empty;
    string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ToString();
    SqlConnection CNN = null;
    SqlCommand CMD = null;
    SqlDataAdapter DA = null;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        int count=0;
        string ing="";
        int x=0;

        for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        {
            if (CheckBoxList1.Items[i].Selected)
            {
                count++;
            }
        }

        for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        {
            if (CheckBoxList1.Items[i].Selected)
            {
                ing += "'" + CheckBoxList1.Items[i].Text + "'";
                x++;
                if (x != count)
                    ing += ", ";
            }
            lbldising.Text = ing;
        }
    }
    protected void btnfindrec_Click(object sender, EventArgs e)
    {
        if (lbldising.Text != string.Empty)
        {
            QRY = "SELECT IM.IMG_id, IM.IMG_name, RM.RM_name FROM tbl_Rec_Master RM, tbl_Image_Master IM ";
            QRY += "WHERE RM.IMG_id=IM.IMG_id AND RM.RM_Id IN ( ";
            QRY += "SELECT DISTINCT RM_id FROM tbl_RecIng_Master ";
            QRY += "WHERE ING_id IN ( ";
            QRY += "SELECT ING_id FROM ING_master ";
            QRY += "WHERE ING_name IN (" + lbldising.Text + ")))";
            DataSet DS_Img = new DataSet();
            CNN = new SqlConnection(cnStr);
            CMD = new SqlCommand(QRY, CNN);
            SqlDataAdapter DA = new SqlDataAdapter(CMD);
            DA.Fill(DS_Img);
            rptrRec.DataSource = DS_Img.Tables[0];
            rptrRec.DataBind();
        }
        else
        {
            rptrRec.DataSource = null;
            rptrRec.DataBind();
        }
    }
}