using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AddRecipe : System.Web.UI.Page
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

    //void BindMyGrid()
    //{
    //    QRY = "SELECT IMG_id, IMG, IMG_name";
    //    QRY += " FROM tbl_Image_Master WHERE";
    //    QRY += " IMG_isact = 'TRUE' AND IMG_id>0";
    //    QRY += "ORDER BY IMG_id";

    //    CNN = new SqlConnection(cnStr);
    //    CMD = new SqlCommand(QRY, CNN);
    //    CNN.Open();
    //    SqlDataAdapter DA = new SqlDataAdapter(CMD);


    //    DataSet DS = new DataSet();
    //    DA.Fill(DS);
    //    grdimg.DataSource = DS.Tables[0];
    //    grdimg.DataBind();
    //    CMD.Dispose();

    //}


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCat();
            //  BindMyGrid();
            CheckBoxList1.Visible = true;
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
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
    }
    protected void drpcat_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btning_Click(object sender, EventArgs e)
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



    protected void grdimg_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        //  disimg.ImageUrl = ((Image)grdimg.Rows[e.NewSelectedIndex].Cells[1].FindControl("imggrid")).ImageUrl;
    }
    protected void btnimg_Click(object sender, EventArgs e)
    {
        // grdimg.Visible = !grdimg.Visible;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        txtrdes.Text = "";
        txtRname.Text = "";
        txtrtime.Text = "";
        Textarea1.InnerText = "";
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {

        
           
    }
}