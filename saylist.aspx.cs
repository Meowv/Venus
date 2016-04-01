using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.labPage.Text = "1";
            this.contrlRepeater();
        }
    }

    #region 分页操作、显示每日一言到前台
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
        ss = pb1.returnDs("select content2,CONVERT(varchar(100), pubTime, 120) as pubTime from articles where articleKindId=1 order by articlesId desc");
        PagedDataSource pds = new PagedDataSource();
        pds.DataSource = ss.Tables["temptable"].DefaultView;
        pds.AllowPaging = true;
        pds.PageSize = 20;
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