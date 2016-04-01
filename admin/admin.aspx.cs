using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class admin_index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断是否登录
        if (Session["userName"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        lalAdmin.Text = Session["userName"].ToString();//显示管理员名
        #region 系统基本信息
        Label1.Text = Environment.OSVersion.ToString();//操作系统
        Label2.Text = Request.Browser.Browser + Request.Browser.Version;//浏览器
        Label3.Text = Request.ServerVariables["HTTP_HOST"];//服务器域名/IP
        Label4.Text = ".NET CLR" + Environment.Version.Major + "." + Environment.Version.Minor + "." + Environment.Version.Build + "." + Environment.Version.Revision;//运行环境
        string userIP;
        if (Request.ServerVariables["HTTP_VIA"] == null)
        {
            userIP = Request.UserHostAddress;
        }
        else
        {
            userIP = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        }
        Label5.Text = userIP;//本机IP
        Label6.Text = DateTime.Now.ToLongDateString().ToString() + DateTime.Now.ToLongTimeString().ToString() + System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.GetDayName(DateTime.Now.DayOfWeek);//北京时间
        Label7.Text = "启明星V1.0";//Venus
        #endregion
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
            if (result >0)
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