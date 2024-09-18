using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AddImage : System.Web.UI.Page
{
    string QRY = string.Empty;
    string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ToString();
    SqlConnection CNN = null;
    SqlCommand CMD = null;
    SqlDataAdapter DA = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindMyGrid();
    }
    protected void btnadd_Click(object sender, EventArgs e)
    {
        byte[] imgbyte = new byte[flimg.PostedFile.ContentLength];
        flimg.PostedFile.InputStream.Read(imgbyte, 0, imgbyte.Length);

        QRY = "INSERT INTO tbl_Image_Master VALUES (";
        QRY += "(SELECT MAX(IMG_id) + 1 FROM tbl_Image_Master), ";
        QRY += "@img, ";
        QRY += "'" + txtimgname.Text + "', ";
        QRY += "'TRUE'";
        QRY += ")";

        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        CMD.Parameters.AddWithValue("@img", imgbyte);
        CMD.ExecuteNonQuery();
        CNN.Close();
        BindMyGrid();

        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        SqlDataAdapter DA = new SqlDataAdapter(CMD);
        DataSet DS = new DataSet();
        DA.Fill(DS);
        grdimg.DataSource = DS.Tables[0];
        grdimg.DataBind();
        CMD.Dispose();
    }


    void BindMyGrid()
    {
        QRY = "SELECT IMG_id, IMG, IMG_name";
        QRY += " FROM tbl_Image_Master WHERE";
        QRY += " IMG_isact = 'TRUE' AND IMG_id>0";
        QRY += "ORDER BY IMG_id";

        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        SqlDataAdapter DA = new SqlDataAdapter(CMD);
        DataSet DS = new DataSet();
        DA.Fill(DS);
        grdimg.DataSource = DS.Tables[0];
        grdimg.DataBind();
        CMD.Dispose();

    }

    protected void grdimg_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grdimg.EditIndex = e.NewEditIndex;
        BindMyGrid();
    }
    protected void grdimg_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        byte[] imgByte = null;
        FileUpload fld = (FileUpload)grdimg.Rows[e.RowIndex].Cells[1].FindControl("fldImgGrid");


        if (fld.PostedFile.ContentLength > 0)
        {
            imgByte = new byte[fld.PostedFile.ContentLength];
            fld.PostedFile.InputStream.Read(imgByte, 0, imgByte.Length);
        }
        QRY = "UPDATE tbl_Image_Master SET ";
        if (fld.PostedFile.ContentLength > 0)
        {
            QRY += "IMG = @img, ";
            //QRY += "Stud_ImgType='" + fld.PostedFile.ContentType.ToString() + "', ";
        }

        QRY += "IMG_name='" + e.NewValues["IMG_name"] + "' ";

        QRY += "WHERE IMG_id=" + grdimg.Rows[e.RowIndex].Cells[0].Text;

        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        if (fld.PostedFile.ContentLength > 0)
            CMD.Parameters.AddWithValue("@img", imgByte);

        CMD.ExecuteNonQuery();
        CNN.Close();
        grdimg.EditIndex = -1;
        BindMyGrid();



    }
    protected void grdimg_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdimg.EditIndex = -1;
        BindMyGrid();
    }
    protected void grdimg_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        QRY = "UPDATE tbl_Image_Master SET IMG_isact = 'FALSE' WHERE IMG_id=" + grdimg.Rows[e.RowIndex].Cells[0].Text.ToString();
        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        CMD.ExecuteNonQuery();
        CNN.Close();
        BindMyGrid();
    }
    protected void btncan_Click(object sender, EventArgs e)
    {
        txtimgname.Text = "";
        
    }
}