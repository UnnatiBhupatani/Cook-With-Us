<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Data.SqlClient;

public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context)
    {
        if (context.Request.QueryString["myID"] != null)
        {
            context.Response.ContentType = "image/jpeg";
            int myImgID = int.Parse(context.Request.QueryString["myID"].ToString());
            string QRY = "SELECT IMG FROM tbl_Image_Master WHERE IMG_id = " + myImgID + "";
            SqlConnection CNN = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["cnStr"].ToString());
            SqlCommand CMD = new SqlCommand(QRY, CNN);
            CNN.Open();
            SqlDataReader DR = CMD.ExecuteReader();
            if (DR.Read())
            {
                context.Response.BinaryWrite((byte[])DR["IMG"]);
            }
            DR.Close();
            CNN.Close();

            context.Response.End();
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}