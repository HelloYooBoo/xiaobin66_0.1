<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--<meta name="viewport" content="width=device-width, initial-scale=1.0">-->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>小缤注册</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/js/jquery-2.1.4.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/js/bootstrap.min.js"></script>
<style type="text/css">
.alert-dismissable {
	padding: 0px;
	padding-right: 30px;
}

.alert-dismissable button {
	
}
</style>
<script type="text/javascript">
	$(function() {
		var cheakusername = function() {
			if (!$("#username").val()) {
				$("#usernamediv").removeClass("has-success");
				$("#usernamediv div:eq(0)").nextAll().remove();
				$("#usernamediv div:eq(0)").after('<div class="alert alert-danger alert-dismissable col-sm-4" style="margin-top: 6px;margin-bottom: 0px;"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>用户名不能为空</div>');
				$("#usernamediv").addClass("has-error");
				return false;
			} else {
				$("#usernamediv div:eq(0)").nextAll().remove();
				$("#usernamediv").removeClass("has-error");
				$("#usernamediv").removeClass("has-success");
				$.ajax({
					type : "get",
					url : "/register/usercheckname",
					data : {
						"username" : $("#username").val()
					},
					contentType : "application/x-www-form-urlencoded:charset=UTF-8",
					dataType : 'json',
					/* async:false,//设置同步方式，非异步！
			        cache:false,//严格禁止缓存！ */
					error : function() {
						alert("请求出错.")
						return false;
					},
					success : function(data) {
						if (data == 1) {
							$("#usernamediv div:eq(0)").nextAll().remove();
							$("#usernamediv div:eq(0)").after('<div class="alert alert-danger alert-dismissable col-sm-4" style="margin-top: 6px;margin-bottom: 0px;"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>用户名已存在</div>');
							$("#usernamediv").addClass("has-error");
							return false;
						} else {
								//成功
								$("#usernamediv").addClass("has-success");
								return true;
							}
						}
					});
			}
		};
		$("#username").blur(cheakusername);
		var cheakpassword = function() {
			if (!($("#password2").val() || $("#password1").val())) {
				$("#password2div").removeClass("has-success");
				$("#password1div").removeClass("has-success");
				$("#password2div div:eq(0)").nextAll().remove();
				$("#password2div div:eq(0)").after('<div class="alert alert-danger alert-dismissable col-sm-4" style="margin-top: 6px;margin-bottom: 0px;"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>密码不能为空</div>');
				$("#password2div").addClass("has-error");
				return false;
			} else if ($("#password2").val() != $("#password1").val()) {
				$("#password2div").removeClass("has-success");
				$("#password1div").removeClass("has-success");
				$("#password2div div:eq(0)").nextAll().remove();
				$("#password2div div:eq(0)").after('<div class="alert alert-danger alert-dismissable col-sm-4" style="margin-top: 6px;margin-bottom: 0px;"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>两次密码不一致</div>');
				$("#password2div").addClass("has-error");
				return false;
			} else {
				$("#password2div div:eq(0)").nextAll().remove();
				$("#password2div").removeClass("has-error");
				$("#password2div").addClass("has-success");
				$("#password1div").addClass("has-success");
				return true;
			}
		}
		$("#password2").blur(cheakpassword);

		$("#a-validcode").click(function() {
			//浏览器带有缓存功能,不会多次请求相同数据
			$("img").attr("src", "validcode?date=" + new Date());
			return false;
		})
		$("#formreg").submit(function(){
			
			cheakusername();
			cheakpassword();
			return  cheakpassword()&&cheakusername() ;
		  });
	})
			
</script>
</head>

<body
	style="background: url('/bimg/c2.jpg'); background-position: center center; background-attachment: fixed; background-size: cover;">
	<div class="container">
		<!--加在form表单后第一个div:
				has-error
				has-warning
				has-success
			-->
		<div class="row">
			<div class="col-md-4 col-md-push-4"
				style="border-radius: 13px 13px 13px 13px; margin-top: 200px; padding: 30px; background-color: #e6e6e699;">
				<form id="formreg" action="/register/reguser" method="post" class="form-horizontal" role="form">

					<div id="usernamediv" class="form-group" style="width: 500px;">
						<label for="usernamediv" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-6 ">
							<input type="text" class="form-control" id="username"
								name="username" placeholder="请输入用户名">
						</div>
						<!--<div class="alert alert-danger alert-dismissable col-sm-4" style="margin-top: 6px;margin-bottom: 0px;">
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">
									&times;
								</button>
								用户名或
							</div>-->
					</div>

					<div id="password1div" class="form-group" style="width: 500px;">
						<!--						<div id="password" class="form-group has-error" style="width: 500px;">-->
						<label for="password1div" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-6 ">
							<input type="password" class="form-control" id="password1"
								name="password" placeholder="请输入密码">
						</div>
					</div>

					<div id="password2div" class="form-group" style="width: 500px;">
						<!--						<div id="password" class="form-group has-error" style="width: 500px;">-->
						<label for="password2div" class="col-sm-2 control-label">密码?</label>
						<div class="col-sm-6 ">
							<input type="password" class="form-control" id="password2"
								placeholder="请输入确认密码">
						</div>
					</div>

					<div id="verification" class="form-group" style="width: 500px;">
						<label for="verification" class="col-sm-2 control-label">机器人?</label>
						<div class="col-sm-6 ">
							<input type="text" class="form-control" id="code" name="code"
								placeholder="请输入验证码"> <a id="a-validcode" href="#">
								<img src="validcode"
								style="width: 80px; height: 30px; float: right; margin-right: 5px;" />
							</a>
						</div>
					</div>
					<c:if test="${action =='codeerror'}">
						<div class="alert alert-danger alert-dismissable col-sm-4"
							style="margin-top: 6px; margin-bottom: 0px;">
							<button type="button" class="close" data-dismiss="alert"
								aria-hidden="true">&times;</button>
							验证码错误
						</div>
					</c:if>

					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-9">
							<button id="submit" type="submit" class="btn btn-default">注册</button>
						</div>
					</div>
				</form>
				<a href="/login" style="margin-left: 50px;">登录？&nbsp;</a>|<a href="#">忘记密码？</a>|<a
					href="/">←返回小缤网</a>
			</div>
		</div>
	</div>
</body>
<c:if test="${action =='regfail'}">
	<script type="text/javascript">
		$(function() {
			alert("注册失败。。");
		})
	</script>
</c:if>
<c:remove var="action" scope="session" />
</html>