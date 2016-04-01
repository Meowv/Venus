using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class technical_tutorial : System.Web.UI.Page
{
    public string showRight;//公共类
    protected void Page_Load(object sender, EventArgs e)
    {
        #region 前台随机显示文章
        if (!IsPostBack)
        {
            this.labPage.Text = "1";
            this.contrlRepeater();
        }

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
    }
    #region 分页操作、显示数据到前台
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
        ss = pb1.returnDs("SELECT articlesId,title,author,content,SUBSTRING(content2,0,220) as content2,CONVERT(varchar(100), pubTime, 23) as pubTime,kindArticles.kindName FROM articles INNER JOIN kindArticles ON articles.articleKindId = kindArticles.kindId where articleKindId=2 order by articlesId desc");
        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = ss.Tables["temptable"].DefaultView;
        pds.AllowPaging = true;
        pds.PageSize = 5;
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