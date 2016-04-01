using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class contact : System.Web.UI.Page
{
    #region 前台调用随机显示两类文章
    public string showRight;
    protected void Page_Load(object sender, EventArgs e)
    {
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
    }
    #endregion
}