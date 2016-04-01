using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Text.RegularExpressions;

public partial class admin_insert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lalAdmin.Text = Session["userName"].ToString();//显示管理员名
        //判断是否登录
        if (Session["userName"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        #region 文章分类、修改时把内容还原
        if (!Page.IsPostBack)
        {
            //连接并打开数据库
            string conStr = "Data Source=qds179471195.my3w.com;Initial Catalog=qds179471195_db;Persist Security Info=True;User ID=qds179471195;Password=wangjuyi110";
            SqlConnection con = new SqlConnection(conStr);
            con.Open();
            //执行sql命令，用sqlDataAdaper取出数据，并填充到dataset中
            string sqlStr = "select * from kindArticles";
            SqlCommand cmd = new SqlCommand(sqlStr, con);
            DataSet ds = new DataSet();
            SqlDataAdapter sda = new SqlDataAdapter(sqlStr, con);
            sda.Fill(ds);
            //把数据绑定到dropDownlist
            ddlNewsKind.DataSource = ds;
            ddlNewsKind.DataValueField = "kindId";
            ddlNewsKind.DataTextField = "kindName";
            ddlNewsKind.DataBind();
            if (Request.QueryString["id"] != null)
            {
                btnSub.Text = "修改";
                int articleId = Convert.ToInt32(Request.QueryString["id"]);
                string sqlShowContent = "SELECT title,author,content,content2,articleKindId FROM Articles where articlesId=" + articleId;
                SqlCommand cmdShowContent = new SqlCommand(sqlShowContent, con);
                SqlDataReader sdrShowContent = cmdShowContent.ExecuteReader();
                while (sdrShowContent.Read())
                {
                    ddlNewsKind.SelectedIndex = Convert.ToInt32(sdrShowContent["articleKindId"]) - 1;
                    tbxTitle.Text = sdrShowContent["title"].ToString();
                    tbxAuthor.Text = sdrShowContent["author"].ToString();
                    content1.Value = Server.HtmlDecode(sdrShowContent["content"].ToString());
                }
                sdrShowContent.Close();
            }
            con.Close();
        }
        #endregion
        
    }
    #region 提交、修改文章操作
    protected void btnSub_Click(object sender, EventArgs e)
    {
        string title = tbxTitle.Text;
        string author = tbxAuthor.Text;
        string content = Server.HtmlEncode(Request.Form["content1"].ToString());
        string articleKind = ddlNewsKind.SelectedValue;
        string sqlInsertArticles;
        //删除脚本  
        string content2 = Regex.Replace(Request.Form["content1"].ToString(), @"<script(\s[^>]*?)?>[\s\S]*?</script>", "", RegexOptions.IgnoreCase);
        //删除样式 
        content2 = Regex.Replace(content2, @"<style>[\s\S]*?</style>", "", RegexOptions.IgnoreCase);
        //删除html标签
        content2 = Regex.Replace(content2, @"<(.[^>]*)>", "", RegexOptions.IgnoreCase);
        content2 = content2.Replace("&nbsp;", "");
        if (btnSub.Text == "修改")
        {
            int articleId = Convert.ToInt32(Request.QueryString["id"]);
            sqlInsertArticles = string.Format("update Articles set title='{0}',author='{1}',content='{2}',content2='{3}', articleKindId={4} where articlesId={5}", title, author, content, content2, articleKind, articleId);
        }
        else
        {
            //分类提交文章，分为两类，第一类，每日一言；第二类，技术教程和IT动态。
            if (ddlNewsKind.SelectedItem.Text == "每日一言")
            {
                sqlInsertArticles = string.Format("INSERT INTO Articles(author,content,content2,articleKindId) values ('{0}','{1}','{2}','{3}')", author, content, content2, articleKind);
            }
            else
            {
                //写sql语句，执行并返回结果
                sqlInsertArticles = string.Format("INSERT INTO Articles(title,author,content,content2,articleKindId) VALUES ('{0}','{1}','{2}','{3}','{4}')", title, author, content, content2, articleKind);
            }
        }

        SqlConnection con = new SqlConnection("Data Source=qds179471195.my3w.com;Initial Catalog=qds179471195_db;Persist Security Info=True;User ID=qds179471195;Password=wangjuyi110");
        con.Open();
        SqlCommand cmd = new SqlCommand(sqlInsertArticles, con);
        int result = cmd.ExecuteNonQuery();
        if (result > 0)
        {
            Response.Write("<script type='text/javascript'>alert('提交成功！');</script>");
        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('提交失败！');</script>");
        }
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