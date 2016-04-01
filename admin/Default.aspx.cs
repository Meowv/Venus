using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class admin_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #region 登录
    protected void btnSub_Click(object sender, EventArgs e)
    {
        //1、获取输入的用户名和密码
        string userName = tbxUserName.Text;
        string userPwd = tbxPwd.Text;

        //2、验证用户名和密码是否正确
        //  2-1、连接数据库并打开
        string conStr = "Data Source=qds179471195.my3w.com;Initial Catalog=qds179471195_db;Persist Security Info=True;User ID=qds179471195;Password=wangjuyi110";
        SqlConnection con = new SqlConnection(conStr);
        con.Open();
        //  2-2、写Sql查询语句，执行Sql命令
        string sqlStr = string.Format("SELECT * FROM users WHERE userName='{0}'and pwd='{1}'", userName, userPwd);
        SqlCommand cmd = new SqlCommand(sqlStr, con);
        SqlDataReader sdr = cmd.ExecuteReader();
        //  2-3、对结果进行判断
        if (sdr.Read())
        {
            Session["userName"] = tbxUserName.Text;
            Session.Timeout = 5;
            //用户存在
            Response.Redirect("admin.aspx");
        }
        else
        {
            //错误提示
            Response.Write("<script type='text/javascript'>alert('账号或者密码错误！');</script>");
        }
        //  2-4、关闭数据库
        sdr.Close();
        con.Close();
    }
    #endregion 
}