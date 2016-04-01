using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    //公共类
    public string linkslist;
    public string showBlogger;
    public string showRight;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.labPage.Text = "1";
            this.contrlRepeater();
        }
        #region 前台调用构造的友链列表代码
        //1、连接并打开数据库
        string conStr = "Data Source=qds179471195.my3w.com;Initial Catalog=qds179471195_db;Persist Security Info=True;User ID=qds179471195;Password=wangjuyi110";
        SqlConnection con = new SqlConnection(conStr);
        con.Open();
        //2、写Sql语句，创建命令对象
        string sqlShowLinks = "select name,url from Links order by NewID()";
        SqlCommand cmd = new SqlCommand(sqlShowLinks, con);
        SqlDataReader sdr = cmd.ExecuteReader();
        //3、循环读取数据，构造li列表
        while (sdr.Read())
        {
            linkslist += string.Format("<li><a href='{0}'>{1}</a></li>", sdr["url"], sdr["name"]);
        }
        //4、关闭数据库
        sdr.Close();
        con.Close();
        #endregion

        #region 前台调用构造的关于博主代码
        //1、连接并打开数据库
        string connStr = "Data Source=qds179471195.my3w.com;Initial Catalog=qds179471195_db;Persist Security Info=True;User ID=qds179471195;Password=wangjuyi110";
        SqlConnection conn = new SqlConnection(connStr);
        conn.Open();
        //2、写Sql语句，创建命令对象
        string sqlShowBlogger = "select top(1) pictureUrl,name,occupation,introduction from Blogger order by bloggerID desc";
        SqlCommand cmdBlogger = new SqlCommand(sqlShowBlogger, conn);
        SqlDataReader sdrBlogger = cmdBlogger.ExecuteReader();
        //3、读取数据，构造li列表
        while (sdrBlogger.Read())
        {
            showBlogger = string.Format("<li>博主：{0}</li><li>职业：{1}</li><li>简介：{2}</li>", sdrBlogger["name"], sdrBlogger["occupation"], sdrBlogger["introduction"]);
        }
        //4、关闭数据库
        sdr.Close();
        conn.Close();
        #endregion

        #region 前台调用构造的随机文章列表代码
        //1、连接并打开数据库
        string connnStr = "Data Source=qds179471195.my3w.com;Initial Catalog=qds179471195_db;Persist Security Info=True;User ID=qds179471195;Password=wangjuyi110";
        SqlConnection connn = new SqlConnection(connnStr);
        connn.Open();
        //2、写Sql语句，创建命令对象
        string sqlShowRight = "select top(6) articlesId,title from Articles WHERE (articles.articleKindId = 2) OR (articles.articleKindId = 3) order by NewID()";
        SqlCommand cmdShowRight = new SqlCommand(sqlShowRight, connn);
        SqlDataReader sdrShowRight = cmdShowRight.ExecuteReader();
        //3、循环读取数据，构造li列表
        while (sdrShowRight.Read())
        {
            showRight += string.Format("<li><a href='news.aspx?id={0}'>{1}</a></li>", sdrShowRight["articlesId"], sdrShowRight["title"]);
        }
        //4、关闭数据库
        sdr.Close();
        connn.Close();
        #endregion   

        #region dataList数据绑定
        string sqlShowProduct = "select top(1) pictureUrl,name,occupation,introduction from Blogger order by bloggerID desc";
        pb pb1 = new pb();
        DataSet dsShowProduct = pb1.returnDs(sqlShowProduct);
        DataList1.DataSource = dsShowProduct;
        DataList1.DataBind();
	    #endregion    
    }

    #region 主页分页操作
    //获取指字符个数的字符 
    public string cuts(string aa, int bb)
    {
        if (aa.Length <= bb) { return aa; }
        else { return aa.Substring(0, bb); }
    }
    //Repeater分页控制显示方法 
    public void contrlRepeater()
    {
        pb pb1 = new pb();
        DataSet ss = new DataSet();
        ss = pb1.returnDs("SELECT articlesId,title,author,content,SUBSTRING(content2,0,220) as content2,CONVERT(varchar(100), pubTime, 23) as pubTime,kindArticles.kindName FROM articles INNER JOIN kindArticles ON articles.articleKindId = kindArticles.kindId where articleKindId=2 or articleKindId=3 order by articlesId desc");
        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = ss.Tables["temptable"].DefaultView;
        pds.AllowPaging = true;
        pds.PageSize = 8;
        pds.CurrentPageIndex = Convert.ToInt32(this.labPage.Text) - 1;
        Repeater1.DataSource = pds;
        LabCountPage.Text = pds.PageCount.ToString();
        labPage.Text = (pds.CurrentPageIndex + 1).ToString();
        this.lbtnpritPage.Enabled = true;
        this.lbtnFirstPage.Enabled = true;
        this.lbtnNextPage.Enabled = true;
        this.lbtnDownPage.Enabled = true;
        if (pds.CurrentPageIndex < 1)
        {
            this.lbtnpritPage.Enabled = false;
            this.lbtnFirstPage.Enabled = false;
        }
        if (pds.CurrentPageIndex == pds.PageCount - 1)
        {
            this.lbtnNextPage.Enabled = false;
            this.lbtnDownPage.Enabled = false;
        }
        Repeater1.DataBind();
    }
    protected void lbtnpritPage_Click(object sender, EventArgs e)
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(labPage.Text) - 1);
        this.contrlRepeater();
    }
    protected void lbtnFirstPage_Click(object sender, EventArgs e)
    {
        this.labPage.Text = "1";
        this.contrlRepeater();
    }
    protected void lbtnDownPage_Click(object sender, EventArgs e)
    {
        this.labPage.Text = this.LabCountPage.Text;
        this.contrlRepeater();
    }
    protected void lbtnNextPage_Click(object sender, EventArgs e)
    {
        this.labPage.Text = Convert.ToString(Convert.ToInt32(labPage.Text) + 1);
        this.contrlRepeater();
    } 
    #endregion
    
}