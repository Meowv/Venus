<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="news" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>启明星博客</title>
   <meta name="keywords" content="启明星博客系统" />
    <meta name="description" content="优雅、稳重、大气、低调，专注于教程分享-绿色软件-行业动态-软件开发技术-互联网资讯的专业博客！" />
<link href="css/index.css" rel="stylesheet">
<link rel="shortcut icon" href="favicon.ico" />
<link href="css/new.css" rel="stylesheet">
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
  <div id="logo"><a href="/"></a></div>
   <nav class="topnav" id="topnav">
  <a href="Default.aspx"><span>首页</span><span class="en">Home</span></a>
      <a href="about_us.aspx"><span>关于我</span><span class="en">About Us</span></a>
      <a href="saylist.aspx"><span>每日一言</span><span class="en">Daily a Word</span></a>
      <a href="tutorial.aspx"><span>技术教程</span><span class="en">Tutorial</span></a>
      <a href="dynamic.aspx"><span>IT动态</span><span class="en">Dynamics</span></a>
      <a href="contact.aspx"><span>留言版</span><span class="en">Message Box</span></a>
</header>
<article class="blogs">
  <h1 class="t_nav"><span>您当前的位置：<a href="Default.aspx">首页</a>&nbsp;&gt;&nbsp;<a href="news.aspx">文章</a></span><a href="Default.aspx" class="n1">网站首页</a><a href="news.aspx" class="n2">文章</a></h1>
  <div class="index_about">
    <h2 class="c_titile"><% = title %></h2>
    <p class="box_c"><span class="d_time">发布时间：<% = pubTime %> </span><span>编辑：<% = author %> </span><span>互动QQ：<a href="http://sighttp.qq.com/authd?IDKEY=0efbff7fddae7d07db709b856a2973fa37710025f4d48978"> 494910887</a></span></p>
    <ul class="infos">
      <% = content %>
    </ul>
    <div class="keybq">
    <p>本站文章如未注明，均为<span> 原创</span>丨本网站采用<a href="http://creativecommons.org/licenses/by-nc-sa/3.0/" rel="nofollow" target="_blank" title="BY-NC-SA授权协议" data-original-title="BY-NC-SA授权协议"><span>BY-NC-SA</span></a>协议进行授权，转载请注明出处。</p>
    </div>
    <div class="ad"> </div>
    <div class="nextinfo">
      <p>上一篇：<%= PageUp%></p>
      <p>下一篇：<%= PageNext%></p>
    </div>
    <div class="otherlink">
      <h2>相关文章</h2>
        <script type="text/javascript">
            var cpro_id = "u2267042";
            (window["cproStyleApi"] = window["cproStyleApi"] || {})[cpro_id] = { at: "3", rsi0: "850", rsi1: "300", pat: "6", tn: "baiduCustNativeAD", rss1: "#FFFFFF", conBW: "1", adp: "1", ptt: "0", titFF: "%E5%BE%AE%E8%BD%AF%E9%9B%85%E9%BB%91", titFS: "14", rss2: "#000000", titSU: "0", ptbg: "90", piw: "0", pih: "0", ptp: "0" }
</script>
<script src="http://cpro.baidustatic.com/cpro/ui/c.js" type="text/javascript"></script>
    </div>
  </div>
  <aside class="right">
    <!-- Baidu Button BEGIN -->
    <div id="bdshare" class="bdshare_t bds_tools_32 get-codes-bdshare"><a class="bds_tsina"></a><a class="bds_qzone"></a><a class="bds_tqq"></a><a class="bds_renren"></a><span class="bds_more"></span><a class="shareCount"></a></div>
    <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6574585" ></script> 
    <script type="text/javascript" id="bdshell_js"></script> 
    <script type="text/javascript">
        document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date() / 3600000)
</script> 
    <!-- Baidu Button END -->
    <div class="blank"></div>
    <div class="news">
      <h3>
        <p>栏目<span>最新</span></p>
      </h3>
      <ul class="rank">
        <% =ShowNew%>
      </ul>
      <h3 class="ph">
        <p>猜你<span>喜欢</span></p>
      </h3>
      <ul class="paih">
        <% =showRight%>
    </ul>
    </div>
  </aside>
</article>
<footer>
  <p>Copyright &copy; 2015&nbsp;<a href="">启明星</a><span>鄂ICP备15002896号</span>&nbsp;&nbsp;Design By <a href="http://weibo.com/Tencentgou">阿星Plus</a></p>
   <center><script type="text/javascript">               var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://"); document.write(unescape("%3Cspan id='cnzz_stat_icon_1255774534'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1255774534%26online%3D1%26show%3Dline' type='text/javascript'%3E%3C/script%3E"));</script></center>
</footer>
<script src="js/nav.js"></script>
    </div>
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
    </form>
</body>
</html>
