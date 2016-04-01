using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;

public partial class admin_addBlogger : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //显示管理员登录名
        lalAdmin.Text = Session["userName"].ToString();
        //判断是否登录
        if (Session["userName"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        if (!Page.IsPostBack)
        {
            //连接并打开数据库
            string conStr = "Data Source=qds179471195.my3w.com;Initial Catalog=qds179471195_db;Persist Security Info=True;User ID=qds179471195;Password=wangjuyi110";
            SqlConnection con = new SqlConnection(conStr);
            con.Open();
        }
    }
    #region 主页关于信息提交
    protected void btnSub_Click(object sender, EventArgs e)
    {
        string name = tbxName.Text;
        string occupation = tbxOccupation.Text;
        string introduction = tbxIntroduction.Text;
        string sqlInsertBloggerInfo;
        string pictureUrl = lblImgFile.Text;
        SqlConnection con = new SqlConnection("Data Source=qds179471195.my3w.com;Initial Catalog=qds179471195_db;Persist Security Info=True;User ID=qds179471195;Password=wangjuyi110");
        con.Open();
        sqlInsertBloggerInfo = string.Format("insert into Blogger(pictureUrl,name,occupation,introduction) values ('{0}','{1}','{2}','{3}')", pictureUrl, name, occupation, introduction);
        SqlCommand cmd = new SqlCommand(sqlInsertBloggerInfo, con);
        int result = cmd.ExecuteNonQuery();
        if (result > 0)
        {
            Response.Write("<script type='text/javascript'>alert('添加成功！');</script>");
        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('添加失败！');</script>");
        }
        con.Close();
    }
    #endregion

    #region 主页图片上传
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        string url1 = Server.MapPath("~/upload/");
        string fileUrl = url1 + FileUpload1.FileName;

        lblImgFile.Text = FileUpload1.FileName;

        FileUpload1.SaveAs(fileUrl);
        if (File.Exists(fileUrl))
        {
            lblInfo.Text = "上传成功";
        }
        else
        {
            lblInfo.Text = "上传失败";
        }
    }
    #endregion
    
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