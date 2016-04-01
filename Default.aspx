<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>启明星博客</title>
    <meta name="keywords" content="启明星博客系统" />
    <meta name="description" content="优雅、稳重、大气、低调，专注于教程分享-绿色软件-行业动态-软件开发技术-互联网资讯的专业博客！" />
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <link href="css/notupian.css" rel="stylesheet" type="text/css" />
    <link href="css/page.css" rel="stylesheet" type="text/css" />
    <script src="js/focus.js" type="text/javascript"></script>
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <link href="css/zzsc.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="favicon.ico" />
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
<!--end header-->
<div class="banner">
        <div class="sub_box">
	        <div id="p-select" class="sub_nav">
		        <div class="sub_no" id="bd1lfsj">
			        <ul>
				        <li class="show">1</li>
				        <li>2</li>
				        <li>3</li>
				        <li>4</li>
				        <li>5</li>
			        </ul>
		        </div>
	        </div>
	        <div id="bd1lfimg">
		        <div>
			        <dl class="show"><dt><img src="images/img/banner1.jpg" /></dt></dl>
			        <dl><dt><img src="images/img/banner2.jpg" /></dt></dl>
			        <dl><dt><img src="images/img/banner3.jpg" /></dt></dl>
			        <dl><dt><img src="images/img/banner4.jpg" /></dt></dl>
			        <dl><dt><img src="images/img/banner5.jpg" /></dt></dl>
		        </div>
	        </div>
        </div>
</div>
        <ul class="texts">
            <p class="p1">纪念我们:</p>
            <p class="p2">终将逝去的青春</p>
            <p class="p3">By:阿星Plus</p>
         </ul>
        <script type="text/javascript">movec();</script>
<!--end banner-->
<article>
  <h2 class="title_tj">
    <p>最新<span>文章</span></p>
  </h2>
  <div class="bloglist left">
  <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
   <!--wz-->
    <div class="wz">
    <h2><a href='<%#String.Format("news.aspx?id={0}",Eval("articlesId"))%>'><%#Eval("title") %></a></h2>
    <p class="dateview"><span><%#Eval("pubTime") %></span><span>作者：<%#Eval("author") %></span><span>分类：[<a href="Default.aspx"><%#Eval("kindName") %></a>]</span></p>
    <figure>
    <a href="#">
    <iframe src="newsImg.aspx" width="175px" height="117px" frameborder=0 noresize scrolling=no allowtransparency="true" style="background-color=transparent">
    </iframe>
    </a>
    </figure> 
    <ul>
      <p style="font-family:微软雅黑"><%#Eval("content2") %>...</p>
      <a title="阅读全文" href='<%#String.Format("news.aspx?id={0}",Eval("articlesId"))%>' target="_blank" class="readmore">阅读全文>></a>
    </ul>
    <div class="clear"></div>
    </div><div style="border-bottom:0px dashed #C5BFC1;"></div>
    </ItemTemplate>
                    </asp:Repeater>
   <!--end-->
   <div class="page">
       第<asp:Label ID="labPage" runat="server" Text="Label"></asp:Label>页/共<asp:Label ID="LabCountPage" runat="server" Text="Label"></asp:Label>页
       <asp:LinkButton ID="lbtnFirstPage" runat="server" OnClick="lbtnFirstPage_Click">首页</asp:LinkButton> 
       <asp:LinkButton ID="lbtnpritPage" runat="server" OnClick="lbtnpritPage_Click">上一页</asp:LinkButton> 
       <asp:LinkButton ID="lbtnNextPage" runat="server" OnClick="lbtnNextPage_Click">下一页</asp:LinkButton> 
       <asp:LinkButton ID="lbtnDownPage" runat="server" OnClick="lbtnDownPage_Click">尾页</asp:LinkButton>
   </div>
  </div>
  <!--right-->
  <aside class="right"> 
    <div class="my">
     <h2>关于<span>博主</span></h2>
     <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal">
     <ItemTemplate>
     <img src='<%#String.Format("upload/{0}",Eval("pictureUrl"))%>' width="200" height="200" alt="博主">
     </ItemTemplate>
     </asp:DataList>
       <ul>
        <% =showBlogger%>
       </ul>
    </div>
    <div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a></div>
    <div class="news">
    <h3 class="ph">
      <p>猜你<span>喜欢</span></p>
    </h3>
    <ul class="paih">
        <% =showRight%>
    </ul>
    <div id="pinlun">
            	<p>最新<span>评论</span></p>     
            	<!-- 多说最新评论 start -->
	<div class="ds-recent-comments" data-num-items="6" data-show-avatars="1" data-show-time="1" data-show-title="1" data-show-admin="1" data-excerpt-length="70"></div>
<!-- 多说最新评论 end -->
            </div>  
    <div class="fk">
        <p>最近<span class="fk_1">访客</span></p>
    <ul class="ds-recent-visitors" data-num-items="20" data-avatar-size="50"></ul> 
     </div>
     <div id="link">
		<p>友情链接:</p>
                <div id="link_text">
                    <ul>
					<% =linkslist%>
                    </ul>
                </div>
     </div>     
</article>
<footer>
  <p>Copyright &copy; 2015&nbsp;<a href="">启明星</a><span>鄂ICP备15002896号</span>&nbsp;&nbsp;Design By <a href="http://weibo.com/Tencentgou">阿星Plus</a></p>
   <center><script type="text/javascript">       var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://"); document.write(unescape("%3Cspan id='cnzz_stat_icon_1255774534'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s4.cnzz.com/z_stat.php%3Fid%3D1255774534%26online%3D1%26show%3Dline' type='text/javascript'%3E%3C/script%3E"));</script></center>
</footer>
        <script src="js/nav.js" type="text/javascript"></script>
<!--百度分享-->
<script>    window._bd_share_config = { "common": { "bdSnsKey": {}, "bdText": "", "bdMini": "2", "bdMiniList": false, "bdPic": "", "bdStyle": "1", "bdSize": "32" }, "share": {}, "image": { "viewList": ["qzone", "tsina", "tqq", "renren", "weixin"], "viewText": "分享到：", "viewSize": "16" }, "selectShare": { "bdContainerClass": null, "bdSelectMiniList": ["qzone", "tsina", "tqq", "renren", "weixin"]} }; with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];</script>
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
<!-- 多说公共JS代码 start (一个网页只需插入一次) -->
<script type="text/javascript">
    var duoshuoQuery = { short_name: "meowv" };
    (function () {
        var ds = document.createElement('script');
        ds.type = 'text/javascript'; ds.async = true;
        ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
        ds.charset = 'UTF-8';
        (document.getElementsByTagName('head')[0]
		 || document.getElementsByTagName('body')[0]).appendChild(ds);
    })();
	</script>
<!-- 多说公共JS代码 end -->
    </form>
</body>
</html>