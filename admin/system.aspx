<%@ Page Language="C#" AutoEventWireup="true" CodeFile="system.aspx.cs" Inherits="admin_system" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>『启明星』后台管理</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <script type="text/javascript" src="js/libs/modernizr.min.js"></script>
</head>
<body>
<form runat="server">
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <ul class="navbar-list clearfix">
                <li><a class="on" href="admin.aspx">首页</a></li>
                <li><a href="../Default.aspx" target="_blank">启明星</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="#">超级管理员：<asp:Label ID="lalAdmin" runat="server" Text="Label"></asp:Label></a></li>
                <li><a href="#" id="bt">修改密码</a></li>
                <li><a onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="../Default.aspx" target="_top">退出</a> </li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
                    <ul class="sub-menu">
                        <li><a href="design.aspx"><i class="icon-font">&#xe001;</i>文章管理</a></li>
                        <li><a href="dailylist.aspx"><i class="icon-font">&#xe033;</i>说说管理</a></li>
                        <li><a href="insert.aspx"><i class="icon-font">&#xe005;</i>新增作品</a></li>
                        <li><a href="linkslist.aspx"><i class="icon-font">&#xe052;</i>友链管理</a></li>
                        <li><a href="addLinks.aspx"><i class="icon-font">&#xe005;</i>新增友链</a></li>
                        <li><a href="addBlogger.aspx"><i class="icon-font">&#xe033;</i>博主信息</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="icon-font">&#xe018;</i>系统管理</a>
                    <ul class="sub-menu">
                        <li><a href="system.aspx"><i class="icon-font">&#xe017;</i>系统设置</a></li>
                        <li><a href="system.aspx"><i class="icon-font">&#xe037;</i>清理缓存</a></li>
                        <li><a href="system.aspx"><i class="icon-font">&#xe046;</i>数据备份</a></li>
                        <li><a href="system.aspx"><i class="icon-font">&#xe045;</i>数据还原</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="index.aspx">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">系统设置</span></div>
        </div>
        <div class="result-wrap">
            <form action="#" method="post" id="myform" name="myform">
                <div class="config-items">
                    <div class="config-title">
                        <h1><i class="icon-font">&#xe00a;</i>网站信息设置</h1>
                    </div>
                    <div class="result-content">
                        <table width="100%" class="insert-tab">
                            <tbody><tr>
                                <th width="15%"><i class="require-red">*</i>域名：</th>
                                <td><input type="text" id="" value="http://meowv.com" size="85" name="keywords" class="common-text"></td>
                            </tr>
                                <tr>
                                    <th><i class="require-red">*</i>站点标题：</th>
                                    <td><input type="text" id="" value="『启明星』-专注于博客领域的探索与实践" size="85" name="title" class="common-text"></td>
                                </tr>
                                <tr>
                                    <th><i class="require-red">*</i>关键字：</th>
                                    <td><input type="text" id="" value="博客, 博客设计, 博客开发, 设计, 开发, 博客资源, CSS, JavaScript, Ajax, Html5" size="85" name="keywords" class="common-text"></td>
                                </tr>
                                <tr>
                                    <th><i class="require-red">*</i>描述：</th>
                                    <td><input type="text" id="" value="『启明星』，分享资源、行业动态和软件开发技术的专业博客！" size="85" name="description" class="common-text"></td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td>
                                        <input type="submit" value="提交" class="btn btn-primary btn6 mr10">
                                        <input type="button" value="返回" onclick="history.go(-1)" class="btn btn6">
                                    </td>
                                </tr>
                            </tbody></table>
                    </div>
                </div>
                <div class="config-items">
                    <div class="config-title">
                        <h1><i class="icon-font">&#xe014;</i>站长信息设置</h1>
                    </div>
                    <div class="result-content">
                        <table width="100%" class="insert-tab">
                            <tr>
                                <th width="15%"><i class="require-red">*</i>网站联系邮箱：</th>
                                <td><input type="text" id="" value="Hackxing@foxmail.com" size="85" name="email" class="common-text"></td>
                            </tr>
                                <tr>
                                    <th><i class="require-red">*</i>联系人：</th>
                                    <td><input type="text" id="" value="阿星Plus" size="85" name="contact" class="common-text"></td>
                                </tr>
                                <tr>
                                    <th><i class="require-red">*</i>联系电话：</th>
                                    <td><input type="text" id="" value="13477996888" size="85" name="phone" class="common-text"></td>
                                </tr>
                                <tr>
                                    <th><i class="require-red">*</i>备案ICP：</th>
                                    <td><input type="text" id="" value="鄂ICP备15002896号" size="85" name="icp" class="common-text"></td>
                                </tr>
                                <tr>
                                    <th><i class="require-red">*</i>地址：</th>
                                    <td><input type="text" id="" value="中国 • 武汉" size="85" name="address" class="common-text"></td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td>
                                        <input type="hidden" value="siteConf.inc.php" name="file">
                                        <input type="submit" value="提交" class="btn btn-primary btn6 mr10">
                                        <input type="button" value="返回" onclick="history.go(-1)" class="btn btn6">
                                    </td>
                                </tr>
                        </table>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!--/main-->
</div>
<div id="VeryhuoCOM" class="VeryhuoCOM" style="display: none;">
        <div class="changePwd">
        <ul>
            <li>旧密码：<asp:TextBox ID="tbxOld" runat="server" Height="23px" Width="200px" class="common-text required"></asp:TextBox></li>
            <li>新密码：<asp:TextBox ID="tbxNew" runat="server" Height="23px" Width="200px" TextMode="Password" class="common-text required"></asp:TextBox></li>
            <li>新密码：<asp:TextBox ID="tbxNew2" runat="server" Height="23px" Width="200px" TextMode="Password" class="common-text required"></asp:TextBox></li>
            <li style="margin-top:10px; margin-left:15px;">
                <asp:Button class="btn btn-primary btn6 mr10" ID="btnNew" runat="server" 
                    Text="我修◠‿◠" onclick="btnNew_Click" />
                <input class="btn btn6" onclick="history.go(-1)" value="不修了◕‸◕" type="button">
            </li>
        </ul>
        </div>
    </div>
    <script type="text/javascript">
        var MaskJson = { //使用json对象好过使用函数。
            cssStyle: "width:100%;position:absolute;left:0;top:0;filter:alpha(opacity = 50);opacity:0.5;border:0;overflow:auto;",
            createShadowDiv: function () {//遮罩背景
                var shadowDiv = document.createElement("div");
                shadowDiv.id = "shadowDiv";
                shadowDiv.style.cssText = this.cssStyle;
                shadowDiv.style.height = Math.max(document.documentElement.scrollHeight, document.documentElement.clientHeight) + "px";
                var isIE = (document.all) ? true : false;
                var isIE6 = isIE && ([/MSIE (\d)\.0/i.exec(navigator.userAgent)][0][1] == 6);
                function layer_iestyle() {
                    shadowDiv.style.width = Math.max(document.documentElement.scrollWidth, document.documentElement.clientWidth) + "px";
                    shadowDiv.style.height = Math.max(document.documentElement.scrollHeight, document.documentElement.clientHeight) + "px";
                }
                if (isIE) {
                    shadowDiv.style.filter = "alpha(opacity=50)";
                }
                if (isIE6) {
                    layer_iestyle();
                    window.attachEvent("onresize", layer_iestyle);
                } else {
                    layer_iestyle();
                    window.addEventListener("resize", layer_iestyle, false);
                }
                shadowDiv.style.backgroundColor = "#000"
                shadowDiv.style.zindex = 100;
                document.body.appendChild(shadowDiv);
            },
            createIframe: function () {  //shadowIframe
                var iframe = document.createElement("iframe");
                iframe.id = "shadowIframe";
                iframe.style.cssText = this.cssStyle;
                iframe.frameBorder = 0;
                iframe.style.height = document.body.scrollHeight + "px";
                iframe.style.zindex = 99;
                document.body.appendChild(iframe);
            },
            createMask: function () {
                this.createIframe();
                this.createShadowDiv();
            },
            removeMask: function () {
                document.body.removeChild(document.getElementById("shadowDiv"));
                document.body.removeChild(document.getElementById("shadowIframe"));
            },
            onclick: function (openButtonID, divMaskID, closeButtonID) {
                //openButtonID：打开遮罩层元素的id
                //divMaskID:遮罩层元素的id(一般都是div)
                //closeButtonID:关闭遮罩层元素的id
                var that = this;
                document.getElementById(openButtonID).onclick = function () {
                    if (window.ActiveXObject) {//ie6
                        if (!window.XMLHttpRequest) {
                            document.body.style.cssText = "_background-image: url(about:blank);_background-attachment: fixed;";
                        }
                    }
                    document.getElementById(divMaskID).style.display = "block";
                    that.createMask();
                }
                document.getElementById(closeButtonID).onclick = function () {
                    document.getElementById(divMaskID).style.display = "none";
                    that.removeMask();
                }
            }
        };
        MaskJson.onclick("bt", "VeryhuoCOM", "close");
    </script>
</form>
</body>
</html>
