<%@ Page Language="C#" AutoEventWireup="true" CodeFile="saylist.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>每日一言—启明星博客</title>
    <meta name="keywords" content="启明星博客系统" />
    <meta name="description" content="优雅、稳重、大气、低调，专注于教程分享-绿色软件-行业动态-软件开发技术-互联网资讯的专业博客！" />
    <link href="css/page.css" rel="stylesheet" type="text/css" />
<link href="css/index.css" rel="stylesheet">
<link href="css/ty.css" rel="stylesheet">
<link rel="shortcut icon" href="favicon.ico" />
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <link href="css/zzsc.css" rel="stylesheet" type="text/css" />
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <header>
  <div id="logo"><a href="Default.aspx"></a></div>
   <nav class="topnav" id="topnav">
  <a href="Default.aspx"><span>首页</span><span class="en">Home</span></a>
      <a href="about_us.aspx"><span>关于我</span><span class="en">About Us</span></a>
      <a href="saylist.aspx"><span>每日一言</span><span class="en">Daily a Word</span></a>
      <a href="tutorial.aspx"><span>技术教程</span><span class="en">Tutorial</span></a>
      <a href="dynamic.aspx"><span>IT动态</span><span class="en">Dynamics</span></a>
      <a href="contact.aspx"><span>留言版</span><span class="en">Message Box</span></a>
  </nav>
</header>
<div class="moodlist">
  <h1 class="t_nav"><span>记忆着曾经那些点点滴滴的往事！</span><a href="Default.aspx" class="n1">网站首页</a><a href="saylist.aspx" class="n2">每日一言</a></h1>
  <asp:Repeater ID="Repeater1" runat="server">
  <ItemTemplate>
  <div class="bloglist">
    <ul class="arrow_box">
     <div class="sy">
      <p><%#Eval("content2") %></p>
      </div>
      <span class="dateview"><%#Eval("pubTime") %></span>
    </ul>
    
  </div>
</div>
</ItemTemplate>
</asp:Repeater>
<div class="page">
                    第<asp:Label ID="labPage" runat="server" Text="Label"></asp:Label>页/共<asp:Label ID="LabCountPage" runat="server" Text="Label"></asp:Label>页
           <asp:LinkButton ID="lbtnFirstPage" runat="server" OnClick="lbtnFirstPage_Click">首页</asp:LinkButton> 
    <asp:LinkButton ID="lbtnpritPage" runat="server" OnClick="lbtnpritPage_Click">上一页</asp:LinkButton> 
   <asp:LinkButton ID="lbtnNextPage" runat="server" OnClick="lbtnNextPage_Click">下一页</asp:LinkButton> 
   <asp:LinkButton ID="lbtnDownPage" runat="server" OnClick="lbtnDownPage_Click">尾页</asp:LinkButton>
                    </div>
<footer>
  <p>Copyright &copy; 2015&nbsp;<a href="">启明星</a><span>鄂ICP备15002896号</span>&nbsp;&nbsp;Design By <a href="http://weibo.com/Tencentgou">阿星Plus</a></p>
   <center><script type="text/javascript">               var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://"); document.write(unescape("%3Cspan id='cnzz_stat_icon_1255774534'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1255774534%26online%3D1%26show%3Dline' type='text/javascript'%3E%3C/script%3E"));</script></center>
</footer>
<script src="js/nav.js"></script>
    </div>
    </form>
    <div id="leftsead">
	<ul>
		<li>
			<a href="javascript:void(0)" class="youhui">
				<img src="images/l02.png" width="47" height="49" class="shows" />
				<img src="images/a.png" width="57" height="49" class="hides" />
				<img src="images/weixin.jpg" width="145" class="2wm" style="display:none;margin:-100px 57px 0 0" />
			</a>
		</li>
		<li>
			<a href="http://sighttp.qq.com/authd?IDKEY=0efbff7fddae7d07db709b856a2973fa37710025f4d48978" target="_blank">
				<div class="hides" style="width:161px;display:none;" id="qq">
					<div class="hides" id="p1">
						<img src="images/ll04.png">
					</div>
					<div class="hides" id="p2"><span style="color:#FFF;font-size:13px">494910887</span>
					</div>
				</div>
				<img src="images/l04.png" width="47" height="49" class="shows" />
			</a>
		</li>
        <li id="tel">
        <a href="javascript:void(0)">
            <div class="hides" style="width:161px;display:none;" id="tels">
                <div class="hides" id="p1">
                    <img src="images/ll05.png">
                </div>
                <div class="hides" id="p3"><span style="color:#FFF;font-size:12px">13477996338</span>
                </div>
            </div>
        <img src="images/l05.png" width="47" height="49" class="shows" />
        </a>
        </li>
        <li id="btn">
        <a id="top_btn">
            <div class="hides" style="width:161px;display:none">
                <img src="images/ll06.png" width="161" height="49" />
            </div>
            <img src="images/l06.png" width="47" height="49" class="shows" />
        </a>
    </li>
    </ul>
</div>
<script>

    $(document).ready(function () {

        $("#leftsead a").hover(function () {
            if ($(this).prop("className") == "youhui") {
                $(this).children("img.hides").show();
            } else {
                $(this).children("div.hides").show();
                $(this).children("img.shows").hide();
                $(this).children("div.hides").animate({ marginRight: '0px' }, '0');
            }
        }, function () {
            if ($(this).prop("className") == "youhui") {
                $(this).children("img.hides").hide();
            } else {
                $(this).children("div.hides").animate({ marginRight: '-163px' }, 0, function () { $(this).hide(); $(this).next("img.shows").show(); });
            }
        });

        $("#top_btn").click(function () { if (scroll == "off") return; $("html,body").animate({ scrollTop: 0 }, 600); });

        //右侧导航 - 二维码
        $(".youhui").mouseover(function () {
            $(this).children(".2wm").show();
        })
        $(".youhui").mouseout(function () {
            $(this).children(".2wm").hide();
        });
    });
</script>
<!-- 代码 结束 -->
</body>
</html>
