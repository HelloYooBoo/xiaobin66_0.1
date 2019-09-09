<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<!--<meta name="viewport" content="width=device-width, initial-scale=1.0">-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>小缤登录</title>
		<!-- 新 Bootstrap 核心 CSS 文件 -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
		<script src="js/jquery-2.1.4.min.js"></script>
		<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
		<script src="js/bootstrap.min.js"></script>
		<style type="text/css">
			.alert-dismissable {
				padding: 0px;
				padding-right: 30px;
			}
			
			.alert-dismissable button {}
		</style>
		<script type="text/javascript">
			$(function(){
				$("#a-validcode").click(function() {
					//浏览器带有缓存功能,不会多次请求相同数据
					$("img").attr("src", "validcode?date=" + new Date());
					return false;
				})
				$("#formlogin").submit(function(){
					if($("#username").val()&&$("#password").val()&&$("#code").val()){
						return true;
					}
					alert("请输入完整信息！")
					return false;
				  });
			})
		</script>
	</head>

	<body style="background: url('bimg/c2.jpg');background-position: center center;background-attachment: fixed;background-size: cover;">
		<div class="container">
			<!--加在form表单后第一个div:
				has-error
				has-warning
				has-success
			-->
			<div class="row">
				<div class="col-md-4 col-md-push-4" style="border-radius: 13px 13px 13px 13px;margin-top: 200px;padding: 30px;background-color: #e6e6e699;">
					<form id="formlogin" action="/login/checkuser" method="post" class="form-horizontal" role="form" > 

						<div id="usernamediv" class="form-group" style="width: 500px;">
							<label for="usernamediv" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-6 ">
								<input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
							</div>
						</div>

						<div id="passworddiv" class="form-group" style="width: 500px;">
							<label for="passworddiv" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-6 ">
								<input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
							</div>
						</div>

						<div id="verification" class="form-group" style="width: 500px;">
							<label for="verification" class="col-sm-2 control-label">机器人?</label>
							<div class="col-sm-6 ">
								<input type="text" class="form-control" id="code" name="code" placeholder="请输入验证码">
								<a id="a-validcode" href="validcode">
									<img src="validcode" style="width:80px; height:30px;float: right;margin-right: 5px;" />
								</a>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-4">
								<div class="checkbox">
									<label>
										<input name="remember" type="checkbox" checked="checked" value="1">请记住我
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-default">登录</button>
							</div>
						</div>
					</form>
					<a href="/register" style="margin-left: 50px;">注册？&nbsp;</a>|<a href="#">忘记密码？</a>|<a href="/">←返回小缤网</a>
				</div>
			</div>
		</div>
	</body>
<c:if test="${action =='regsuccess'}">
	<script type="text/javascript">
		$(function() {
			alert("注册成功！");
		})
	</script>
</c:if>
<c:if test="${action =='errorcode'}">
	<script type="text/javascript">
		$(function() {
			alert("验证码有误！");
		})
	</script>
</c:if>
<c:if test="${action =='errorlogin'}">
	<script type="text/javascript">
		$(function() {
			alert("用户名或密码错误！");
		})
	</script>
</c:if>
<c:remove var="action" scope="session" />
</html>