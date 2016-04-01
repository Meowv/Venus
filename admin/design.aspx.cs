using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_design : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lalAdmin.Text = Session["userName"].ToString();//显示管理员名
        //判断是否登录
        if (Session["userName"] == null)
        {
            Response.Redirect("Default.aspx");
        }
        if (!IsPostBack)
        { 
            this.labPage.Text = "1";
            this.contrlRepeater();
            Bind();
        }
    }
    #region 分页操作
    private void Bind()
    {
        SqlConnection con = new SqlConnection("Data Source=qds179471195.my3w.com;Initial Catalog=qds179471195_db;Persist Security Info=True;User ID=qds179471195;Password=wangjuyi110");
        con.Open();
        string sqlShowInfo = "SELECT kindArticles.kindName,Articles.articlesId,Articles.title,Articles.author,CONVERT(varchar(100), pubTime, 120) as pubTime,articles.articleKindId FROM Articles INNER JOIN kindArticles ON Articles.articleKindId = kindArticles.kindId WHERE (articles.articleKindId = 2) OR (articles.articleKindId = 3) order by articlesId desc";
        DataSet ds = new DataSet();
        SqlDataAdapter sdaShowInfo = new SqlDataAdapter(sqlShowInfo, con);
        sdaShowInfo.Fill(ds);
        Repeater1.DataSource = ds;
        Repeater1.DataBind();
    }
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
        ss = pb1.returnDs("select articlesId,title,author,CONVERT(varchar(100), pubTime, 120) as pubTime from articles where articleKindId=2 or articleKindId=3 order by articlesId desc");
        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = ss.Tables["temptable"].DefaultView;
        pds.AllowPaging = true;
        pds.PageSize = 10;
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

    #region 文章删除操作
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            SqlConnection con = new SqlConnection("Data Source=qds179471195.my3w.com;Initial Catalog=qds179471195_db;Persist Security Info=True;User ID=qds179471195;Password=wangjuyi110");
            con.Open();
            int articlesId = int.Parse(e.CommandArgument.ToString());
            string sqlDel = "delete Articles where articlesId =" + articlesId;
            SqlCommand cmd = new SqlCommand(sqlDel, con);
            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                Bind();
                Response.Write("<script>alert('删除成功！')</script>");
            }
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