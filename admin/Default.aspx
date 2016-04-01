<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="admin_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统登录</title>
<style type="text/css">
body{Microsoft YaHei,Segoe UI,Tahoma,Arial,Verdana,sans-serif;
     font-size:12px;
     color:#fff;height:100%;
     line-height:1;background: url("images/0.jpg");width:100%;height:100%
     ;background-image:url(images/0.jpg);
     -moz-background-size: 100% 100%;
     -o-background-size: 100% 100%;
     -webkit-background-size: 100% 100%;
     background-size: 100% 100%;
     -moz-border-image: url(images/0.jpg) 0;
     background-repeat:no-repeat\9;background-image:none\9;}
html{overflow-y:scroll;vertical-align:baseline;}
*{margin:0;padding:0}
ul,li{list-style:none}
h1{font-size:30px;font-weight:700;text-shadow:0 1px 4px rgba(0,0,0,.2);margin-left:90px;}
.login-box{width:410px;margin:120px auto 0 auto;text-align:center;padding:30px;background:url(images/mask.png);border-radius:10px;}
.login-box .name,.login-box .password,.login-box .code,.login-box .remember{font-size:16px;text-shadow:0 1px 2px rgba(0,0,0,.1)}
.login-box .remember input{box-shadow:none;width:15px;height:15px;margin-top:25px}
.login-box .remember{padding-left:100px}
.login-box .remember label{display:inline-block;height:42px;width:65px;line-height:34px;text-align:left;}
.login-box label{display:inline-block;width:100px;text-align:right;vertical-align:middle}
.login-box #code{width:120px}
.login-box .codeImg{float:right;margin-top:26px;}
.login-box img{width:148px;height:42px;border:none}
input[type=text],input[type=password]{width:116px;
height:42px;margin-top:25px;padding:0px 15px;border-radius:6px;color:#fff;letter-spacing:2px;font-size:16px;background:transparent;
    }
button{cursor:pointer;width:100%;height:44px;padding:0;background:#ef4300;border:1px solid #ff730e;border-radius:6px;font-weight:700;color:#fff;font-size:24px;letter-spacing:15px;text-shadow:0 1px 2px rgba(0,0,0,.1)}
input:focus{outline:none;box-shadow:0 2px 3px 0 rgba(0,0,0,.1) inset,0 2px 7px 0 rgba(0,0,0,.2)}
button:hover{box-shadow:0 15px 30px 0 rgba(255,255,255,.15) inset,0 2px 7px 0 rgba(0,0,0,.2)}
.screenbg{position:fixed;bottom:0;left:0;z-index:-999;overflow:hidden;width:100%;height:100%;min-height:100%;}
.screenbg ul li{display:block;list-style:none;position:fixed;overflow:hidden;top:0;left:0;width:100%;height:100%;z-index:-1000;float:right;}
.screenbg ul a{left:0;top:0;width:100%;height:100%;display:inline-block;margin:0;padding:0;cursor:default;}
.screenbg a img{vertical-align:middle;display:inline;border:none;display:block;list-style:none;position:fixed;overflow:hidden;top:0;left:0;width:100%;height:100%;z-index:-1000;float:right;}
.bottom{margin:8px auto 0 auto;width:100%;position:fixed;text-align:center;bottom:0;left:0;overflow:hidden;padding-bottom:8px;color:#ccc;word-spacing:3px;zoom:1;}
.bottom a{color:#FFF;text-decoration:none;}
.bottom a:hover{text-decoration:underline;}
</style>
</head>
<body>
<form id="form1" runat="server">
<div class="login-box">
	<h1>启明星-Venus</h1>
	<form method="post" action="">
		<div class="name">
			<label>帐  号：</label>
            <asp:TextBox ID="tbxUserName" runat="server" Width="250px"></asp:TextBox>
		</div>
		<div class="password">
			<label>密  码：</label>
			<asp:TextBox ID="tbxPwd" runat="server" TextMode="Password" Width="250px"></asp:TextBox>
		</div>
		<div class="remember">
			<input type="checkbox" id="remember" tabindex="4">
			<label>记住密码</label>
            <asp:Button ID="btnSub" runat="server" Text="登 录" Height="42px" Width="190px"
             style="-moz-border-radius:10px;-webkit-border-radius:10px;border-radius:10px; margin-left:5px;"
                BackColor="Red" BorderColor="Red" Font-Bold="True" Font-Size="Large" 
                ForeColor="White" onclick="btnSub_Click" />
		</div>		
	</form>
</div>
</form>
</body>
</html>
