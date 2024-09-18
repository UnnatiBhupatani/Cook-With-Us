using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ModifyRecipes : System.Web.UI.Page
{
    string QRY = string.Empty;
    string cnStr = System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ToString();
    SqlConnection CNN = null;
    SqlCommand CMD = null;
    SqlDataAdapter DA = null;

    void BindMyGrid(string rec)
    {

        QRY = "SELECT RM.RM_id, FM.FCM_name, RM.RM_name, RM.RM_preparetime, RM.RM_desc, RM.RM_method, FM.FCM_ID ";
        QRY += "FROM tbl_Rec_Master RM, tbl_FoodCat_Master FM WHERE  RM_name='" + rec + "' AND RM.FCM_id = FM.FCM_id AND  ";
        QRY += "RM_isact = 'True' AND RM.RM_id>0 ";
        QRY += "ORDER BY RM.RM_id";

        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        SqlDataAdapter DA = new SqlDataAdapter(CMD);
        DataSet DS = new DataSet();
        DA.Fill(DS);
        dtGrd_rec.DataSource = DS.Tables[0];
        dtGrd_rec.DataBind();
        CMD.Dispose();
        BindMyGridIngidents(rec);
       
    }
    void BindMyGridIngidents(string rec)
    {
        QRY = "SELECT DISTINCT RIM.RIM_id,FM.FCM_name, RM.RM_name, RM.RM_preparetime, RM.RM_desc, RM.RM_method, IM.ING_name, RIM.ING_qty, RIM.RIM_id ";
        QRY += "FROM tbl_Rec_Master RM, tbl_FoodCat_Master FM, tbl_RecIng_Master RIM, ING_master IM  WHERE  RM_name='" + rec + "' AND RIM_isact= 'TRUE' AND RM.FCM_id = FM.FCM_id AND  ";
        QRY += "RM_isact = 'True' AND RM.RM_id>0 AND RIM.RM_id = RM.RM_id AND RIM.ING_id = IM.ING_id ";
        QRY += "ORDER BY RIM.RIM_id";

        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        SqlDataAdapter DA = new SqlDataAdapter(CMD);
        DataSet DS = new DataSet();
        DA.Fill(DS);
        Grd_Ingridents.DataSource = DS.Tables[0];
        Grd_Ingridents.DataBind();
        CMD.Dispose();
    }
    void LoadCategory(DropDownList ddl)
    {
        //drpcat.Items.Clear();
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
                ddl.Items.Add(LI);
                LI = null;
            }
        }
        DR.Close();
        DR.Dispose();
        CMD.Dispose();
        CNN.Close();
        ddl.SelectedIndex = 0;
    }

    void Loadingname(DropDownList ing)
    {
        //drpcat.Items.Clear();
        QRY = "SELECT ING_id, ING_name  FROM ING_master WHERE ING_isact = 'TRUE' ORDER BY ING_name";
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
                ing.Items.Add(LI);
                LI = null;
            }
        }
        DR.Close();
        DR.Dispose();
        CMD.Dispose();
        CNN.Close();
        ing.SelectedIndex = 0;
    }


    void Loadrecname()
    {
        drprecname.Items.Clear();
        QRY = "SELECT RM_id, RM_name  FROM tbl_Rec_Master WHERE RM_ID = 0 OR RM_isact = 'TRUE' ORDER BY RM_name";
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
                drprecname.Items.Add(LI);

                LI = null;
            }
        }
        DR.Close();
        DR.Dispose();
        CMD.Dispose();
        CNN.Close();
        drprecname.SelectedIndex = 0;
    }



    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
          //  BindMyGrid();
             Loadrecname();
        BindMyGrid(drprecname.SelectedItem.Text.ToString());
        BindMyGridIngidents(drprecname.SelectedItem.Text.ToString());
    }
    
    protected void drprecname_SelectedIndexChanged1(object sender, EventArgs e)
    {
        if (drprecname.SelectedIndex > 0)
            BindMyGrid(drprecname.SelectedItem.Text.ToString());
       
       
    }

    string ReplaceMyStringToDB(string myStr)
    {
        myStr = myStr.Replace("'", "`");
        return myStr;
    }
   
    protected void dtGrd_rec_RowUpdating1(object sender, GridViewUpdateEventArgs e)
    {
        DropDownList ddlFCM = (DropDownList)dtGrd_rec.Rows[e.RowIndex].Cells[1].FindControl("ddlfcm");
        //QRY = "UPDATE tbl_FoodCat_Master SET ";
        //QRY += "FCM_name='" + ddlFCM.SelectedItem.ToString() + "' ";
        //QRY += "WHERE FCM_id=" + dtGrd_rec.Rows[e.RowIndex].Cells[1].Text;
        //CNN = new SqlConnection(cnStr);
        //CMD = new SqlCommand(QRY, CNN);
        //CNN.Open();
        //dtGrd_rec.EditIndex = -1;

       

        QRY = "UPDATE tbl_Rec_Master SET ";
        QRY += "FCM_id = "+ddlFCM.SelectedValue+", ";
        QRY += "RM_name = '" + ReplaceMyStringToDB(((TextBox)dtGrd_rec.Rows[e.RowIndex].Cells[2].FindControl("txtrecname")).Text) + "', ";
        QRY += "RM_preparetime = '" + ReplaceMyStringToDB(((TextBox)dtGrd_rec.Rows[e.RowIndex].Cells[3].FindControl("txtrectime")).Text) + "', ";
        QRY += "RM_desc = '" + ReplaceMyStringToDB(((TextBox)dtGrd_rec.Rows[e.RowIndex].Cells[4].FindControl("txtrecdec")).Text) + "', ";
        QRY += "RM_method = '" + ReplaceMyStringToDB(((TextBox)dtGrd_rec.Rows[e.RowIndex].Cells[5].FindControl("txtrecmethod")).Text) + "' ";
        QRY += "WHERE RM_id=" + dtGrd_rec.Rows[e.RowIndex].Cells[0].Text;

        
        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        CMD.ExecuteNonQuery();
        CNN.Close();
        dtGrd_rec.EditIndex = -1;
        BindMyGrid(drprecname.SelectedItem.Text.ToString());
      //  Loadrecname();
       
    }
    protected void dtGrd_rec_RowEditing(object sender, GridViewEditEventArgs e)
    {
        dtGrd_rec.EditIndex = e.NewEditIndex;
        BindMyGrid(drprecname.SelectedItem.Text.ToString());

        DropDownList ddlCN = (DropDownList)dtGrd_rec.Rows[e.NewEditIndex].Cells[1].FindControl("ddlfcm");
        LoadCategory(ddlCN);
        
        ((DropDownList)dtGrd_rec.Rows[e.NewEditIndex].Cells[1].FindControl("ddlfcm")).SelectedValue = ((Label)dtGrd_rec.Rows[e.NewEditIndex].Cells[1].FindControl("lblfcmID")).Text;
    }
    protected void dtGrd_rec_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        dtGrd_rec.EditIndex = -1;
        BindMyGrid(drprecname.SelectedItem.Text.ToString());
    }
    protected void dtGrd_rec_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        QRY = "UPDATE tbl_Rec_Master SET RM_isact = 'FALSE' WHERE RM_id=" + dtGrd_rec.Rows[e.RowIndex].Cells[0].Text.ToString();
        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        CMD.ExecuteNonQuery();
        CNN.Close();
        BindMyGrid(drprecname.SelectedItem.Text.ToString());
        Loadrecname();
    }
    protected void Grd_Ingridents_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Grd_Ingridents.EditIndex = e.NewEditIndex;
        BindMyGridIngidents(drprecname.SelectedItem.Text.ToString());

        DropDownList ddlCN = (DropDownList)Grd_Ingridents.Rows[e.NewEditIndex].Cells[1].FindControl("ddlingname");
        Loadingname(ddlCN);

     //   ((DropDownList)Grd_Ingridents.Rows[e.NewEditIndex].Cells[1].FindControl("ddlingname")).SelectedValue = ((Label)Grd_Ingridents.Rows[e.NewEditIndex].Cells[1].FindControl("ddlingname")).Text;

    }
    protected void Grd_Ingridents_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        DropDownList ddlFCM = (DropDownList)Grd_Ingridents.Rows[e.RowIndex].Cells[1].FindControl("ddlingname");
       

        QRY = "UPDATE tbl_RecIng_Master SET ";
       
        QRY += "ING_id = " + ddlFCM.SelectedValue + ", ";
        QRY += "ING_qty = '" + ((TextBox)Grd_Ingridents.Rows[e.RowIndex].Cells[2].FindControl("txtIngQty")).Text + "' ";
        QRY += "WHERE RIM_id = " + Grd_Ingridents.Rows[e.RowIndex].Cells[0].Text;

        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        CMD.ExecuteNonQuery();
        CNN.Close();
        Grd_Ingridents.EditIndex = -1;
        BindMyGridIngidents(drprecname.SelectedItem.Text.ToString());
       
    }
    protected void Grd_Ingridents_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        Grd_Ingridents.EditIndex = -1;
        BindMyGridIngidents(drprecname.SelectedItem.Text.ToString());
    }
    protected void Grd_Ingridents_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        QRY = "UPDATE tbl_RecIng_Master SET RIM_isact = 'FALSE' WHERE RIM_id=" + Grd_Ingridents.Rows[e.RowIndex].Cells[0].Text.ToString();
        CNN = new SqlConnection(cnStr);
        CMD = new SqlCommand(QRY, CNN);
        CNN.Open();
        CMD.ExecuteNonQuery();
        CNN.Close();
        BindMyGrid(drprecname.SelectedItem.Text.ToString());
        BindMyGridIngidents(drprecname.SelectedItem.Text.ToString());
    }
}