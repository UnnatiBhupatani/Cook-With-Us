using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AddIngrediants : System.Web.UI.Page
{

    string QRY = string.Empty;
    string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ToString();
    SqlConnection CNN = null;
    SqlCommand CMD = null;
    SqlDataAdapter DA = null;



    void BindMyGrid()
    {
        QRY = "SELECT ING_id, ING_name ";
        QRY += "FROM ING_master WHERE ";
        QRY += "ING_isact = 'True' AND ING_id>0";
        QRY += "ORDER BY ING_id";

        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        SqlDataAdapter DA = new SqlDataAdapter(CMD);
        DataSet DS = new DataSet();
        DA.Fill(DS);
        dtGrd_ing.DataSource = DS.Tables[0];
        dtGrd_ing.DataBind();
        CMD.Dispose();

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        BindMyGrid();
    }


    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        {
            QRY = "INSERT INTO ING_master values(";
            QRY += "(SELECT MAX([ING_id]) + 1 FROM ING_master), ";
            QRY += "'" + txting.Text + "', ";
            QRY += "'TRUE'";
            QRY += ")";
            CNN = new SqlConnection(cnStr);
            CMD = new SqlCommand(QRY, CNN);

            CNN.Open();
            CMD.ExecuteNonQuery();
            CNN.Close();
            CMD.Dispose();
            BindMyGrid();
            txting.Text = "";
        }
    }
    protected void dtGrd_ing_RowEditing(object sender, GridViewEditEventArgs e)
    {
        dtGrd_ing.EditIndex = e.NewEditIndex;
        BindMyGrid();
    }
    protected void dtGrd_ing_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        QRY = "UPDATE ING_master SET ING_name='" + ((TextBox)dtGrd_ing.Rows[e.RowIndex].Cells[1].FindControl("lblINGname")).Text + "' ";
        QRY += "WHERE ING_id=" + dtGrd_ing.Rows[e.RowIndex].Cells[0].Text;

        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        CMD.ExecuteNonQuery();
        CNN.Close();
        dtGrd_ing.EditIndex = -1;
        BindMyGrid();
    }
    protected void dtGrd_ing_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        dtGrd_ing.EditIndex = -1;
        BindMyGrid();
    }
    protected void dtGrd_ing_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        QRY = "UPDATE ING_master SET ING_isact = 'FALSE' WHERE ING_id=" + dtGrd_ing.Rows[e.RowIndex].Cells[0].Text.ToString();
        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        CMD.ExecuteNonQuery();
        CNN.Close();
        BindMyGrid();
    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        txting.Text = "";
    }
}