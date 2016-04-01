using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class news : System.Web.UI.Page
{
    //公共类
    public string title, pubTime, content, author;
    public string showRight;
    public string ShowNew;
    public string PageNext;
    public string PageUp;
    protected void Page_Load(object sender, EventArgs e)
    {
        #region 显示文章具体的内容
        //1、首先取到文章的相应的id
        int articleId = Convert.ToInt32(Request.QueryString["id"]);
        //2、然后根据文章的id通过查询数据库得到该文章的相应字段，包括标题，内容，发布时间。
        SqlConnection con = new SqlConnection("Data Source=qds179471195.my3w.com;Initial Catalog=qds179471195_db;Persist Security Info=True;User ID=qds179471195;Password=wangjuyi110");
        con.Open();
        string sqlShowArticle = string.Format("select title,author,content,CONVERT(varchar(100),pubTime,23) as pubTime1 from articles where articlesId={0}", articleId);
        SqlCommand cmdShowArticle = new SqlCommand(sqlShowArticle, con);
        SqlDataReader sdrShowArticle = cmdShowArticle.ExecuteReader();
        while (sdrShowArticle.Read())
        {
            title = sdrShowArticle["title"].ToString();
            author = sdrShowArticle["author"].ToString();
            content = Server.HtmlDecode(sdrShowArticle["content"].ToString());
            pubTime = sdrShowArticle["pubTime1"].ToString();
        }
        sdrShowArticle.Close();
        con.Close();
        #endregion

        #region 随机显示文章
        string connnStr = "Data Source=qds179471195.my3w.com;Initial Catalog=qds179471195_db;Persist Security Info=True;User ID=qds179471195;Password=wangjuyi110";
        SqlConnection connn = new SqlConnection(connnStr);
        connn.Open();
        string sqlShowRight = "select top(6) articlesId,title from Articles WHERE (articles.articleKindId = 2) OR (articles.articleKindId = 3) order by NewID()";
        SqlCommand cmdShowRight = new SqlCommand(sqlShowRight, connn);
        SqlDataReader sdrShowRight = cmdShowRight.ExecuteReader();
        while (sdrShowRight.Read())
        {
            showRight += string.Format("<li><a href='news.aspx?id={0}'>{1}</a></li>", sdrShowRight["articlesId"], sdrShowRight["title"]);
        }
        sdrShowRight.Close();
        connn.Close();
        #endregion

        #region 显示最新的文章
        string conNew = "Data Source=qds179471195.my3w.com;Initial Catalog=qds179471195_db;Persist Security Info=True;User ID=qds179471195;Password=wangjuyi110";
        SqlConnection connnn = new SqlConnection(conNew);
        connnn.Open();
        string sqlShowNew = "select top(10) articlesId,title from Articles WHERE (articles.articleKindId = 2) OR (articles.articleKindId = 3) order by articlesId desc";
        SqlCommand cmdShowNew = new SqlCommand(sqlShowNew, connnn);
        SqlDataReader sdrShowNew = cmdShowNew.ExecuteReader();
        while (sdrShowNew.Read())
        {
            ShowNew += string.Format("<li><a href='news.aspx?id={0}'>{1}</a></li>", sdrShowNew["articlesId"], sdrShowNew["title"]);
        }
        sdrShowNew.Close();
        connnn.Close();
        #endregion

        #region 超级坑爹的文章上下篇，简单实现，有Bug没有完善
        //下一篇
        string conPage = "Data Source=qds179471195.my3w.com;Initial Catalog=qds179471195_db;Persist Security Info=True;User ID=qds179471195;Password=wangjuyi110";
        SqlConnection connPage = new SqlConnection(conPage);
        connPage.Open();
        string sqlNext = string.Format("select top 1 articlesId,title from Articles where articlesId > {0} and ((articles.articleKindId = 2) OR (articles.articleKindId = 3)) order by articlesId asc", articleId);
        SqlCommand cmdPageN = new SqlCommand(sqlNext, connPage);
        SqlDataReader sdrPage = cmdPageN.ExecuteReader();
        if (sdrPage.Read())
        {
            PageNext = string.Format("<a href='news.aspx?id={0}'>{1}</a>", sdrPage["articlesId"], sdrPage["title"]);
        }
        else
        {
            PageNext = "没有了";
        }
        sdrPage.Close();
        connPage.Close();
        //上一篇
        string conUP = "Data Source=qds179471195.my3w.com;Initial Catalog=qds179471195_db;Persist Security Info=True;User ID=qds179471195;Password=wangjuyi110";
        SqlConnection connUP = new SqlConnection(conUP);
        connUP.Open();
        string sqlUP = string.Format("select top 1 articlesId,title from Articles where articlesId < {0} and ((articles.articleKindId = 2) OR (articles.articleKindId = 3)) order by articlesId desc", articleId);
        SqlCommand cmdPageU = new SqlCommand(sqlUP, connUP);
        SqlDataReader sdrPageU = cmdPageU.ExecuteReader();
        if (sdrPageU.Read())
        {
            PageUp = string.Format("<a href='news.aspx?id={0}'>{1}</a>", sdrPageU["articlesId"], sdrPageU["title"]);
        }
        else
        {
            PageNext = "没有了";
        }
        sdrPageU.Close();
        connUP.Close();
        #endregion 
    }
}