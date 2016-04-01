using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class addLinks : System.Web.UI.Page
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
        #region 后台显示友链
        if (!Page.IsPostBack)
        {
            string conStr = "Data Source=qds179471195.my3w.com;Initial Catalog=qds179471195_db;Persist Security Info=True;User ID=qds179471195;Password=wangjuyi110";
            SqlConnection con = new SqlConnection(conStr);
            con.Open();

            if (Request.QueryString["id"] != null)
            {
                btnSub.Text = "修改";
                int linkId = Convert.ToInt32(Request.QueryString["id"]);
                string sqlShowContent = "select linkID,name,url from Links where linkID=" + linkId;
                SqlCommand cmdShowContent = new SqlCommand(sqlShowContent, con);
                SqlDataReader sdrShowContent = cmdShowContent.ExecuteReader();
                while (sdrShowContent.Read())
                {
                    tbxName.Text = sdrShowContent["name"].ToString();
                    tbxUrl.Text = sdrShowContent["url"].ToString();
                }
                sdrShowContent.Close();
            }
            con.Close();
        }
        #endregion
    }
    #region 修改友链
    protected void btnSub_Click(object sender, EventArgs e)
    {
        string name = tbxName.Text;
        string url = tbxUrl.Text;
        string sqlInsertUrl;
        if (btnSub.Text == "修改")
        {
            int linkId = Convert.ToInt32(Request.QueryString["id"]);
            sqlInsertUrl = string.Format("update Links set name='{0}',url='{1}' where linkId={2}", name, url, linkId);
        }
        else
        {
            sqlInsertUrl = string.Format("INSERT INTO Links(name,url) values ('{0}','{1}')", name, url);
        }

        SqlConnection con = new SqlConnection("Data Source=qds179471195.my3w.com;Initial Catalog=qds179471195_db;Persist Security Info=True;User ID=qds179471195;Password=wangjuyi110");
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlInsertUrl, con);
        //根据返回结果判断是否提交成功
        int result = cmd.ExecuteNonQuery();
        if (result > 0)
        {
            Response.Write("<script type='text/javascript'>alert('添加成功！');</script>");
        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('添加失败！');</script>");
        }
        //关闭数据库
        con.Close();
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