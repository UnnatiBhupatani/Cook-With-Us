using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class UserAddRecipe : System.Web.UI.Page
{
    string QRY = string.Empty;
    string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ToString();
    SqlConnection CNN = null;
    SqlCommand CMD = null;
    SqlDataAdapter DA = null;

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



    void loading()
    {
        dtGrd_Ing.DataSource = null;

        DataTable DT_Ing = new DataTable();
        DT_Ing.Columns.Add("Sr");
        DT_Ing.Columns.Add("Ing_ID");
        DT_Ing.Columns.Add("Ing_Name");

        for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        {
            if (CheckBoxList1.Items[i].Selected)
            {
                //DT_Ing.Rows.Add(DT_Ing.Rows.Count + 1, CheckBoxList1.Items[i].Value.ToString(), CheckBoxList1.Items[i].Text.ToString(), " ");
                DT_Ing.Rows.Add(DT_Ing.Rows.Count + 1, CheckBoxList1.Items[i].Value.ToString(), CheckBoxList1.Items[i].Text.ToString());
            }
        }
        dtGrd_Ing.DataSource = DT_Ing;
        dtGrd_Ing.DataBind();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            LoadCat();
    }
    protected void btaddncat_Click(object sender, EventArgs e)
    {
        QRY = "INSERT INTO tbl_FoodCat_Master values(";
        QRY += "(SELECT MAX([FCM_id]) + 1 FROM tbl_FoodCat_Master), ";
        QRY += "'" + txtcat.Text + "', ";
        QRY += "'TRUE'";
        QRY += ")";
        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);

        CNN.Open();
        CMD.ExecuteNonQuery();
        CNN.Close();
        CMD.Dispose();
        LoadCat();
        txtcat.Text = "";
    }
    protected void btnadding_Click(object sender, EventArgs e)
    {
        {
            QRY = "INSERT INTO ING_master values(";
            QRY += "(SELECT MAX([ING_id]) + 1 FROM ING_master), ";
            QRY += "'" + txtadding.Text + "', ";
            QRY += "'TRUE'";
            QRY += ")";
            CNN = new SqlConnection(cnStr);
            CMD = new SqlCommand(QRY, CNN);

            CNN.Open();
            CMD.ExecuteNonQuery();
            CNN.Close();
            CMD.Dispose();
            
            txtadding.Text = "";
        }
    }
    protected void btning_Click(object sender, EventArgs e)
    {
        loading();
    }
    protected void btnaddrec_Click(object sender, EventArgs e)
    {
        int uid = int.Parse(Session["U_id"].ToString());

        byte[] imgbyte = new byte[flimg.PostedFile.ContentLength];
        flimg.PostedFile.InputStream.Read(imgbyte, 0, imgbyte.Length);

        QRY = "INSERT INTO tbl_Image_Master VALUES (";
        QRY += "(SELECT MAX(IMG_id) + 1 FROM tbl_Image_Master), ";
        QRY += "@img, ";
        QRY += "'" + txtRname.Text + "', ";
        QRY += "'TRUE'";
        QRY += ")";
        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        CMD.Parameters.AddWithValue("@img", imgbyte);
        CMD.ExecuteNonQuery();
        CMD.Dispose();
        //CNN.Close();

        QRY = "insert into tbl_Rec_Master values(";
        QRY += " (SELECT MAX(RM_id) + 1 FROM tbl_Rec_Master), ";
        QRY += "'" + drpcat.SelectedValue + "',";
        QRY += "(SELECT MAX(IMG_id) FROM tbl_Image_Master),";
        QRY += uid + ", ";
        QRY += "'" + txtRname.Text + "',";
        QRY += "'" + txtrtime.Text + "',";
        QRY += "'" + txtrdes.Text + "',";
        QRY += "'" + Textarea1.InnerText + "',";
        QRY += "'TRUE'";
        QRY += ")";
        CMD = new SqlCommand(QRY, CNN);
        CMD.ExecuteNonQuery();
        CMD.Dispose();


        for (int i = 0; i < dtGrd_Ing.Rows.Count; i++)
        {
            string QTY = ((TextBox)dtGrd_Ing.Rows[i].Cells[3].FindControl("txtQty")).Text;
            string INGID = ((Label)dtGrd_Ing.Rows[i].Cells[1].FindControl("txtIng_Id")).Text;

            QRY = "insert into tbl_RecIng_Master values (";
            QRY += " (SELECT MAX(RIM_id) + 1 FROM tbl_RecIng_Master), ";
            QRY += " (SELECT MAX(RM_id) FROM tbl_Rec_Master), ";
            QRY += "'" + INGID + "',";
            QRY += "'" + QTY + "',";
            QRY += "'TRUE'";
            QRY += ")";

            CMD = new SqlCommand(QRY, CNN);
            CMD.ExecuteNonQuery();
            CMD.Dispose();
        }
        CNN.Close();
        txtrdes.Text = "";
        txtRname.Text = "";
        txtrtime.Text = "";
        Textarea1.InnerText = "";
        txtadding.Text = "";
        txtcat.Text = "";
    }
    protected void btncamrec_Click(object sender, EventArgs e)
    {
        txtrdes.Text = "";
        txtRname.Text = "";
        txtrtime.Text = "";
        Textarea1.InnerText = "";
        txtadding.Text = "";
        txtcat.Text = "";
    }
}