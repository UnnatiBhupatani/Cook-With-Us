using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class assets_Account : System.Web.UI.Page
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
            QRY = "SELECT U_id, U_name, U_cont, U_gen, U_pass ";
            QRY += "FROM tbl_User WHERE ";
            QRY += "U_id = "+uid+" AND U_id>0";
            QRY += "ORDER BY U_id";

            CNN = new SqlConnection(cnStr);
            CMD = new SqlCommand(QRY, CNN);
            CNN.Open();
            SqlDataAdapter DA = new SqlDataAdapter(CMD);
            DataSet DS = new DataSet();
            DA.Fill(DS);
            dtGrd_acc.DataSource = DS.Tables[0];
            dtGrd_acc.DataBind();
            CMD.Dispose();
        }

    }


    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
            BindMyGrid();
    }
    protected void dtGrd_acc_RowEditing(object sender, GridViewEditEventArgs e)
    {
        dtGrd_acc.EditIndex = e.NewEditIndex;
        BindMyGrid();
    }
    protected void dtGrd_acc_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        QRY = "UPDATE tbl_User SET ";
        QRY += "U_name='" + ((TextBox)dtGrd_acc.Rows[e.RowIndex].Cells[1].FindControl("txtuname")).Text + "', ";
        QRY += "U_cont='" + ((TextBox)dtGrd_acc.Rows[e.RowIndex].Cells[2].FindControl("txtucon")).Text + "', ";

        if(((RadioButton)dtGrd_acc.Rows[e.RowIndex].Cells[3].FindControl("rdbmale")).Checked==true)
        {
            QRY += "U_gen='Male', ";
        }
        else
        {
            QRY += "U_gen='Female', ";
        }
        QRY += "U_pass='" + ((TextBox)dtGrd_acc.Rows[e.RowIndex].Cells[4].FindControl("txtupass")).Text + "' ";

        QRY += "WHERE U_id=" + dtGrd_acc.Rows[e.RowIndex].Cells[0].Text;


        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        CMD.ExecuteNonQuery();
        CNN.Close();
        dtGrd_acc.EditIndex = -1;
        BindMyGrid();
    }
    protected void dtGrd_acc_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        dtGrd_acc.EditIndex = -1;
        BindMyGrid();
    }

   
}