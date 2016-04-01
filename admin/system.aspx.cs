using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class admin_system : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lalAdmin.Text = Session["userName"].ToString();
        if (Session["userName"] == null)
        {
            Response.Redirect("Default.aspx");
        }
    }
    #region 修改密码
    protected void btnNew_Click(object sender, EventArgs e)
    {
        string sqlNew;
        SqlConnection conUpdate = new SqlConnection("Data Source=qds179471195.my3w.com;Initial Catalog=qds179471195_db;Persist Security Info=True;User ID=qds179471195;Password=wangjuyi110");
        conUpdate.Open();
        try
        {
            sqlNew = string.Format("select userName,pwd from Users where userName='" + Session["userName"].ToString() + "'and pwd='" + tbxNew2.Text.Trim() + "'", conUpdate);
            SqlCommand cmdUpdate = new SqlCommand("update Users set pwd='" + tbxNew2.Text.Trim() + "'where userName='" + Session["userName"].ToString() + "'", conUpdate);
            SqlCommand cmd = new SqlCommand(sqlNew, conUpdate);
            int result = cmdUpdate.ExecuteNonQuery();
            if (result > 0)
            {
                Response.Write("<script language =javascript>alert('恭喜你，密码修改成功！')</script>");
            }
            else
            {
                Response.Write("<script language =javascript>alert('哎呀！是不是原密码输错了？')</script>");
            }
        }
        catch (System.Exception ee)
        {
            Response.Write("<script language =javascript>alert('" + ee.Message.ToString() + "')</script>");
        }
        finally
        {
            conUpdate.Close();
        }
    }
    #endregion
}