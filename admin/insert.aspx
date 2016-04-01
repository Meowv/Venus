<%@ Page Language="C#" AutoEventWireup="true" CodeFile="insert.aspx.cs" Inherits="admin_insert" ValidateRequest="false" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>『启明星』后台管理</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <script type="text/javascript" src="js/libs/modernizr.min.js"></script>
    <link rel="stylesheet" href="../kindeditor-4.1.10/themes/default/default.css" />
	<link rel="stylesheet" href="../kindeditor-4.1.10/plugins/code/prettify.css" />
	<script charset="utf-8" src="../kindeditor-4.1.10/kindeditor.js"></script>
	<script charset="utf-8" src="../kindeditor-4.1.10/lang/zh_CN.js"></script>
	<script charset="utf-8" src="../kindeditor-4.1.10/plugins/code/prettify.js"></script>
	<script>
	    KindEditor.ready(function (K) {
	        var editor1 = K.create('#content1', {
	            cssPath: '../kindeditor-4.1.10/plugins/code/prettify.css',
	            uploadJson: '../kindeditor-4.1.10/asp.net/upload_json.ashx',
	            fileManagerJson: '../kindeditor-4.1.10/asp.net/file_manager_json.ashx',
	            allowFileManager: true,
	            afterCreate: function () {
	                var self = this;
	                K.ctrl(document, 13, function () {
	                    self.sync();
	                    K('form[name=example]')[0].submit();
	                });
	                K.ctrl(self.edit.doc, 13, function () {
	                    self.sync();
	                    K('form[name=example]')[0].submit();
	                });
	            }
	        });
	        prettyPrint();
	    });
	</script>
</head>
<body>
<form id="example" runat="server">
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
            <div class="crumb-list"><i class="icon-font"></i><a href="admin.aspx">首页</a><span class="crumb-step">&gt;</span><span>新增作品</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                </div>
                    <table class="insert-tab" width="100%">
                        <tbody><tr>
                            <th width="120"><i class="require-red">*</i>分类：</th>
                            <td>
                                <asp:DropDownList class="required" ID="ddlNewsKind" runat="server" Height="23px" Width="100px" 
                                    AutoPostBack="True" onselectedindexchanged="Page_Load">
                                </asp:DropDownList>
                            </td>
                        </tr>
                            <tr>
                                <th><i class="require-red">*</i>标题：</th>
                                <td>
                                    <asp:TextBox ID="tbxTitle" class="common-text" runat="server" Height="23px" Width="350px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <th>作者：</th>
                                <td><asp:TextBox ID="tbxAuthor" class="common-text" runat="server" Height="23px" Width="350px"></asp:TextBox>
                            </tr>
                            <tr>                     
                            </tr>
                            <tr>
                                <th>内容：</th>
                                <td><textarea id="content1" style="width:974px; height:322px; visibility:hidden;" 
            runat="server"></textarea></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <asp:Button class="btn btn-primary btn6 mr10" ID="btnSub" runat="server" 
                                        Text="提交" onclick="btnSub_Click"/>
                                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
        
                
            </div>
        </div>
    </div>
    <!--/main-->
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
