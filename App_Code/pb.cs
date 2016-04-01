using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

public class pb
{
    public DataSet returnDs(string sqlStr)
    {

        DataSet ds = new DataSet();

        string conStr = "Data Source=qds179471195.my3w.com;Initial Catalog=qds179471195_db;Persist Security Info=True;User ID=qds179471195;Password=wangjuyi110";
        SqlConnection con = new SqlConnection(conStr);
        con.Open();

        //conn.Open(); 
        SqlCommand comm = new SqlCommand(sqlStr, con);
        comm.CommandTimeout = 20;

        SqlDataAdapter sda = new SqlDataAdapter(comm);
        sda.Fill(ds, "temptable");
        return ds;
        con.Close(); con.Dispose(); comm.Dispose();
    }

}