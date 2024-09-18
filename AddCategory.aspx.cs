using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AddCategory : System.Web.UI.Page
{

    string QRY = string.Empty;
    string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ToString();
    SqlConnection CNN = null;
    SqlCommand CMD = null;
    SqlDataAdapter DA = null;   
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
            BindMyGrid();
    }

    void BindMyGrid()
    {
        QRY = "SELECT FCM_id, FCM_name ";
        QRY += "FROM tbl_FoodCat_Master WHERE ";
        QRY += "FCM_isact = 'True' AND FCM_id>0";
        QRY += "ORDER BY FCM_id";

        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        SqlDataAdapter DA = new SqlDataAdapter(CMD);
        DataSet DS = new DataSet();
        DA.Fill(DS);
        dtGrd_cat.DataSource = DS.Tables[0];
        dtGrd_cat.DataBind();
        CMD.Dispose();

    }


    protected void Button1_Click(object sender, EventArgs e)
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
        BindMyGrid();
        txtcat.Text = "";
    }
    protected void dtGrd_cat_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //string mycatname = ((TextBox)dtGrd_cat.Rows[e.NewEditIndex].Cells[1].FindControl("lblFCName")).Text;
        //BindMyGrid();
        //dtGrd_cat.EditIndex = e.NewEditIndex;
        //dtGrd_cat.Columns[dtGrd_cat.Columns.Count - 1].Visible = false;
        dtGrd_cat.EditIndex = e.NewEditIndex;
        BindMyGrid();
    }
    protected void dtGrd_cat_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //dtGrd_cat.EditIndex = -1;
        //BindMyGrid();
        //dtGrd_cat.Columns[dtGrd_cat.Columns.Count - 1].Visible = true;
        QRY = "UPDATE tbl_FoodCat_Master SET FCM_name='" + ((TextBox)dtGrd_cat.Rows[e.RowIndex].Cells[1].FindControl("lblFCName")).Text + "' ";
        QRY += "WHERE FCM_Id=" + dtGrd_cat.Rows[e.RowIndex].Cells[0].Text;

        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        CMD.ExecuteNonQuery();
        CNN.Close();
        dtGrd_cat.EditIndex = -1;
        BindMyGrid();
    }
    protected void dtGrd_cat_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        dtGrd_cat.EditIndex = -1;
        BindMyGrid();
    }
    protected void dtGrd_cat_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        QRY = "UPDATE tbl_FoodCat_Master SET FCM_isact = 'FALSE' WHERE FCM_id=" + dtGrd_cat.Rows[e.RowIndex].Cells[0].Text.ToString();
        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        CMD.ExecuteNonQuery();
        CNN.Close();
        BindMyGrid();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        txtcat.Text = "";
    }
}