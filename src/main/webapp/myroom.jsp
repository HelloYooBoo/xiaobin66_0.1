<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>小缤网(建设中)</title>
		<link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
		<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script type="text/javascript">
			$(function() {
				$("nav li a").hover(
					function() {
						$(this).parent().addClass("active");
					},
					function() {
						$(this).parent().removeClass("active");
					});
				$(".hyb-box-text").hover(function() {
						$('>img', this).removeClass("hyb-jq-img");
						$('>img', this).addClass("hyb-jq-img-hover");
						$('>div:first', this).css({
							"top": "20%"
						});
						$('>div:eq(1)', this).css({
							"opacity": 1,
							"top": "50%"
						});
						//$('>div:first>span',this).css({"top":"20%"});
					},
					function() {
						$('>img', this).removeClass("hyb-jq-img-hover");
						$('>img', this).addClass("hyb-jq-img");
						$('>div:first', this).css({
							"top": "35%"
						});
						$('>div:eq(1)', this).css({
							"opacity": 0,
							"top": "60%"
						});
						//$('>div:first>span',this).css({"top":"20%"});
					});
				$('.hyb-random-img').each(function() {
					var max = 6;
					$(this).attr("src", "img/" + (Math.floor(Math.random() * (max)) + 1) + ".jpg");
				});
			});
			$(function() {   
				var p = 0,
					t = 0;
				$(window).scroll(function() {  
					p = $(this).scrollTop();  
					var scrollY = $(document).scrollTop(); // 获取垂直滚动的距离，即滚动了多少
					      
					if (scrollY > 80) { //如果滚动距离大于550px则隐藏，否则删除隐藏类
						if (t <= p) { //下滚  
							$('#hyb-nav').css({
								"margin-top": "-50px"
							})
						} else { //上滚  
							$('#hyb-nav').css({
								"margin-top": "0px"
							})
						}
					}    
					else {      
						$('#hyb-nav').css({
							"margin-top": "0px"
						})    
					}      
					setTimeout(function() {
						t = p;
					}, 0);
				});
				//返回顶部
				$(window).scroll(function() {
					if ($(window).scrollTop() >= 100) {
						$('.actGotop').fadeIn(300);
					} else {
						$('.actGotop').fadeOut(300);
					}
				});
				$('.hyb-back-top').click(function() {
					$('html,body').animate({
						scrollTop: '0px'
					}, 800);
				});
				//返回顶部隐藏
				$(window).scroll(function() {  
					var scrollY = $(document).scrollTop();
					if (scrollY > 700) { //如果滚动距离大于550px则隐藏，否则删除隐藏类
						$('.hyb-back-top').css({
							"opacity": "1"
						})
					} else {      
						$('.hyb-back-top').css({
							"opacity": "0"
						})    
					}      
				});
			});
			$(document).ready(function() {
				$("#myNav").affix({
					offset: {
						top: 0, //开始滚动的距离条件
						bottom: 280
					}
				});
			});
		</script>
		<style>
			/* Custom Styles */
			
			.hyb-affix {
				width: 140px;
			}
			
			.hyb-affix.affix {
				top: 70px;
				/* Set the top position of pinned element */
				/*不滚动时距离顶部的距离*/
			}
			
			.hyb-affix.affix-bottom {
				position: absolute;
			}
			
			.hyb-sidebar-no1 .hyb-head:hover {
				transform: scale(1.1);
				/*transform: rotate(-720deg) scale(1.5) ;*/
				box-shadow: 0px 0px 15px grey;
				transition: 0.2s;
				/*设置显示加载时间*/
			}
			p {
				/*width: 100px ;*/
				overflow: hidden;
				/*text-overflow: ellipsis; 加省略号*/
				/*white-space: nowrap; 强制不换行*/
			}
			.parallax-footer {
				padding-top: 3%;
				padding-bottom: 3%;
			}
			.parallax-footer p {
				font-family: Futura, "Trebuchet MS", Arial, sans-serif;
				text-align: Center;
				color: #ffffff;
				padding: 10px;
			}
			h1.maintitle {
				text-align: center;
				font-size: 230%;
				color: #ffffff;
				letter-spacing: 1%;
				margin: 0 0;
				background: url("bimg/a3.jpg") fixed 100%;
				padding-top: 8%;
				padding-bottom: 8%;
				text-shadow: 5px 5px 5px grey;
			}
			.hyb-choose {}
			
			.navbar .nav > li:hover .dropdown-menu {
				display: block;
			}
			.navbar-nav > li > a {
				padding-top: 4px;
				padding-bottom: 0;
				height: 28px;
			}
			.navbar {
				min-height: 20px;
				margin-bottom: 0px;
				border-radius: 5px;
				background: #FFFFFFcc;
			}
			.footer-p {
				position: relative;
			}
			.footer-c {
				position: absolute;
				bottom: 0
			}
			.hyb-hover:hover {
				box-shadow: 5px 5px 15px grey;
				transition: 0.3s;
				/*设置显示加载时间*/
			}
			.hyb-hover {
				transition: 0.3s;
				/*设置显示加载时间*/
			}
			.row:hover {
				box-shadow: 5px 5px 15px grey;
				transition: 0.3s;
				/*设置显示加载时间*/
			}
			.row {
				transition: 0.3s;
				/*box-shadow: 0px 0px 15px grey;*/
				/*设置显示加载时间*/
			}
			/*=====================================*/
			.hyb-a {
				width: 74px;
				margin-right: 0px;
				color: #000000;
				margin-left: 0px;
				text-align: center;
			}
			.hyb-ul {
				padding-left: 0;
				margin-bottom: 20px;
				margin: 0 0 1px 0;
				font-size: 19px;
				color: #333;
				box-sizing: border-box;
			}
			.hyb-div-hover:hover {}
			.hyb-jq-img-hover {
				transform: scale(1.1);
				/*opacity: 0.5;*/
				filter: brightness(60%);
				transition: 0.2s;
			}
			.hyb-jq-img {
				/*opacity: 1;*/
				filter: brightness(90%);
				transition: 0.2s;
			}
			.hyb-a-text {
				margin-right: 15px;
				color: #000000;
				cursor: pointer;
				text-decoration: none;
			}
			/*侧栏3号*/
			.hyb-sidebar-no3 {
				box-shadow: 0px 0px 2px #cccccc;
				height: 280px;
				width: 260px;
				background-color: #ffffff;
				border-radius: 13px 13px 13px 13px;
			}
			/*侧栏3号的tab文章*/
			.hyb-sidebar-no3-tabtext {}
			.hyb-sidebar-no3-tabtext a {
				text-decoration: none;
				overflow: hidden;
				border-bottom: 1px dashed #b4afaf;
				color: #666;
				text-decoration: none;
				text-overflow: ellipsis;
				white-space: nowrap;
				margin-top: 1px;
				position: relative;
				display: block;
				margin-bottom: 0;
				padding: 8px 0;
				border: 0;
				border-top-left-radius: 4px;
				border-top-right-radius: 4px;
				background-color: transparent;
				cursor: pointer;
				height: 35px;
				transition: 0.5s;
				text-decoration: none;
			}
			.hyb-sidebar-no3-tabtext a:hover {
				box-shadow: 0px 0px 4px grey;
				transition: 0.5s;
			}
			.hyb-sidebar-no3-tabtext a i {
				font-size: 17px;
				margin-right: 10px;
			}
			/*End--侧栏三号*/
			/*侧栏二号*/
			.hyb-sidebar-no2 {
				box-shadow: 0px 0px 2px #cccccc;
				height: 90px;
				width: 260px;
				background-color: #ffffff;
				border-radius: 13px 13px 13px 13px;
			}
			/*网站警示div*/
			.hyb-master-warning {
				height: 50px;
				margin: 10px;
				margin-top: 25px;
			}
			.hyb-master-warning p {
				font-size: 16px;
				height: 70px;
				margin: 0;
				text-align: center;
				color: #b3b3b3;
			}
			.hyb-master-warning p i {
				font-size: 13px;
				margin-right: 5px;
			}
			/*End--侧栏二号*/
			/*侧栏一号*/
			.hyb-sidebar-no1 {
				box-shadow: 0px 0px 2px #cccccc;
				height: 500px;
				width: 260px;
				background-color: #ffffff;
				border-radius: 13px 13px 13px 13px;
				margin-top: 40px;
			}
			.hyb-sidebar-no1 .hyb-head-div {
				height: 70px;
				width: 70px;
				margin-top: -40px;
				padding: 0px;
				border-radius: 40px 40px 40px 40px;
			}
			.hyb-head-div2{
				overflow: hidden;
			}
			.hyb-head-div2 .hyb-head {
				width: 100%;height:100%;object-fit: cover;
			}
			
			.hyb-sidebar-no1 .hyb-introduction-div {
				height: 70px;
				margin: 10px;
				margin-top: 0px;
			}
			/*回到底部*/
			.hyb-back-top {
				transition: 0.3s;
				opacity: 0;
				position: fixed;
				top: 90%;
				right: 20px;
				background-color: #00000077;
				width: 40px;
				height: 40px;
			}
			/*=================================*/
			/*文章标签页卡片样式*/
			.hyb-text-info {
				height: 33px;
				background-color: #ffffff;
				border-radius: 0 0 13px 13px;
				line-height: 27px;
				font-size: 12px;
				padding-top: 3px;
				box-shadow: 0px 0px 2px #cccccc;
				padding-right: 20px;
				padding-bottom: 3px;
				padding-left: 20px;
			}
			.hyb-text-info .pull-left a {
				margin-right: 15px;
				color: #000000;
				cursor: pointer;
				text-decoration: none;
			}
			.hyb-text-info .pull-right a {
				color: #000000;
				cursor: pointer;
				text-decoration: none;
			}
			.hyb-box-text {
				position: relative;
				height: 300px;
				border-radius: 13px 13px 0px 0px;
				background-color: #CCCCCC;
				overflow: hidden;
			}
			.hyb-box-text a {
				text-shadow: 0px 0px 5px #ffffff;
				margin-right: 15px;
				color: #FFFFFF;
				cursor: pointer;
				text-decoration: none;
			}
			.hyb-box-text .hyb-box-text-title {
				transition: 0.2s;
				position: absolute;
				top: 35%;
				font-size: 40px;
				text-align: center;
				color: #ffffff;
			}
			.hyb-box-text .hyb-box-text-body {
				transition: 0.2s;
				opacity: 0;
				text-shadow: 0px 0px 5px #ffffff;
				position: absolute;
				top: 60%;
				font-size: 15px;
				text-align: left;
				color: #ffffff;
			}
			/*===========================================*/
			.hyb-artical-body {
				box-shadow: 0px 0px 2px #cccccc;
				margin-top: -40px;
				padding: 20px;
				border-radius: 13px 13px 13px 13px;
				background-color: white;
			}
			.hyb-artical-outline {
				min-height: 300px;
				margin: 0px;
			}
			.hyb-artical-title {
				margin-bottom: 10px;
				height: 30px;
			}
			.hyb-artical-title h1 {
				font-size: 22px;
			}
			.hyb-artical-author {
				height: 30px;
			}
			.hyb-artical-author span {
				font-size: 14px;
				color: #333;
			}
			.hyb-artical-info {
				height: 30px;
				font-size: 13px;
				color: #666;
			}
			
			.hyb-artical-info a {
				margin-right: 20px;
				color: #666;
				cursor: pointer;
				text-decoration: none;
			}
			
			.hyb-artical-info .hyb-span01 {
				margin-right: 15px;
			}
			
			.hyb-artical-body hr {
				height: 1px;
				background-color: #ececec;
			}
			
			.hyb-artical-outline .hyb-artical-summary {
				font-size: 16px;
				color: #000a;
			}
			
			.hyb-artical-outline .hyb-artical-summary p {
				/*段落开始空两格*/
				text-indent: 2em;
				line-height: 20px;
				margin-bottom: 20px;
			}
			
			.hyb-artical-content {
				font-size: 18px;
				margin-top: 0px;
				min-height: 300px;
				letter-spacing: 2px;
			}
			
			.hyb-artical-content p {
				/*段落开始空两格*/
				text-indent: 2em;
			}
			
			.hyb-artical-copyright {
				text-align: center;
				font-size: 14px;
				color: #666;
				padding: 10px;
				margin-top: 35px;
				margin-bottom: 35px;
			}
			
			.hyb-artical-encourage {
				opacity: 0.6;
				margin-top: 40px;
				margin-bottom: 0px;
				padding: 10px;
				font-size: 20px;
			}
			
			.hyb-artical-encourage a {
				margin-left: 50px;
				color: #000000;
				cursor: pointer;
				text-decoration: none;
			}
			
			.hyb-artical-lasttime {
				margin-bottom: 15px;
				padding: 5px;
				font-size: 16px;
				opacity: 0.7;
			}
			
			.hyb-artical-comment {
				box-shadow: 0px 0px 2px #cccccc;
				margin-top: 20px;
				padding: 20px;
				border-radius: 13px 13px 13px 13px;
				background-color: white;
			}
			
			.hyb-artical-comment .hyb-comment-number {
				min-height: 30px;
				margin: 0px;
				font-size: 18px;
				line-height: 24px;
				color: #222;
			}
			
			.hyb-artical-comment .hyb-comment-sort {
				min-height: 30px;
				margin: 0px;
			}
			/*===============================*/
			
			input[type=text],
			textarea {
				-webkit-transition: all 0.30s ease-in-out;
				-moz-transition: all 0.30s ease-in-out;
				-ms-transition: all 0.30s ease-in-out;
				-o-transition: all 0.30s ease-in-out;
				outline: none;
				padding: 3px 0px 3px 3px;
				margin: 5px 1px 3px 0px;
				border: 1px solid #ddd;
			}
			
			input[type=text]:focus,
			textarea:focus {
				box-shadow: 0 0 5px rgba(81, 203, 238, 1);
				padding: 3px 0px 3px 3px;
				margin: 5px 1px 3px 0px;
				border: 1px solid rgba(81, 203, 238, 1);
			}
			/*===============================*/
			
			.hyb-comment-my .bili-textarea {
				font-size: 12px;
				display: inline-block;
				box-sizing: border-box;
				background-color: #f4f5f7;
				border: 1px solid #e5e9ef;
				overflow: auto;
				border-radius: 4px;
				color: #555;
				width: 100% !important;
				height: 65px;
				transition: 0s;
				padding: 5px 10px;
				line-height: normal;
				resize: none;
			}
			#userinfo a{
				transition: 0s;
			}
			
			.hyb-artical-comment .hyb-comment-my-submit {
				min-height: 30px;
				margin: 0px;
			}
			
			.hyb-artical-comment .hyb-comment-my-submit input {
				float: right;
			}
		
			.cardbean{
				min-height: 200px;
			}
			.cardbean div{
				margin-left: 1px;margin-right: 1px;
			}
			.cardrow1 a{
				color: #000000;cursor: pointer;text-decoration: none;
			}
			.cardrow1 a span{
				margin-left: 15px;
			}
			.cardrow1 a img{
				width: 30px;
			}
			.hyb-card-point:hover{
				cursor: pointer;
			}
			.hyb-card-point .cardrow2 a{
				color: #000000;cursor: pointer;text-decoration: none;
			}
			.hyb-card-point .cardrow3{
				min-height: 100px;margin-left: 1px;margin-right: 1px;opacity: 0.8;
			}
			.hyb-card-point .cardrow4{
				min-height: 30px;margin-left: 1px;margin-right: 1px;opacity:0.5;
			}
			.hyb-card-point .cardrow4 span{
				margin-right: 30px;
			}
			.hyb-reply{
				cursor: pointer;
			}
			.hyb-reply a{
				color: #000000;cursor: pointer;text-decoration: none;
			}
			#cancellation{
				text-decoration: none;
			}
			.hyb-headpic{
				background-size: cover
			}
			.hyb-info span{
				margin-right: 10px;
			}
		</style>
		<script type="text/javascript">
			$(function(){
				//时间转换函数
				var timeTrun=function(timestamp){
					if(new Date().getTime()-timestamp<0){
						return "0秒前"
					}else if(new Date().getTime()-timestamp<10*1000){
						return "10秒前"
					}else if(new Date().getTime()-timestamp<30*1000){
						return "30秒前"
					}else if(new Date().getTime()-timestamp<60*60*1000){
						return Math.ceil((new Date().getTime()-timestamp)/(60*1000))+"分钟前"
					}else if(new Date().getTime()-timestamp<24*60*60*1000){
						return Math.ceil((new Date().getTime()-timestamp)/(60*60*1000))+"小时前"
					}else{
						var timeTruntime= new Date(timestamp);
//						return timeTruntime.getFullYear()+"-"+timeTruntime.getMonth()+"-"
//						+timeTruntime.getDate()+" "+timeTruntime.getHours()+":"+timeTruntime.getMinutes()
						return timeTruntime.toLocaleString( );
					}
				}
				
				var f1=function(data,status){
					if(data==null){
						alert("请先登录！")
						$(location).attr('href', '/login');
					}
					if(data=="fail"){
						alert("修改失败！")
					}else if(data=="success"){
						alert("修改成功")
					}
				}
				//页面加载的时候post一次
				$.post("/room",{},function(data,status){
					if(data==null){
						alert("请先登录！")
						$(location).attr('href', '/login');
					}
					$("#userinfo a").on("click",function(){
						$(this).parent().find("a:eq(0)").attr("style","");
						$(this).parent().find("a:eq(1)").attr("style","");
						$(this).parent().find("a:eq(2)").attr("style","");
						$(this).parent().find("a:eq(3)").attr("style","");
						$(this).parent().find("a:eq(4)").attr("style","");
						$(this).parent().find("a:eq(5)").attr("style","");
						$(this).parent().find("a:eq(6)").attr("style","");
						$(this).attr("style","background: #00a1d6;color: white;");
						$(".hyb-artical-title h1").text($(this).text())
						if($(this).attr("data-iid")==0){
							$("#instablebody").empty();
							var ins='<tr><td>用户名</td><td>'
							+data.userBean.username+'</td><td></td></tr><tr><td>密码</td><td>'
							+data.userBean.password+'</td><td><input type="button" value="修改" /></td></tr><tr><td>昵称</td><td>'
							+(data.userBean.nickname==null?"":data.userBean.nickname)+'</td><td><input type="button" value="修改" /></td></tr><tr><td>生日</td><td>'
							+'<input id="inp1" type="date" name="user_date" readOnly="true"/></td><td><input type="button" value="设置" /></td></tr><tr><td>邮箱</td><td>'
							+(data.userBean.eMail==null?"":data.userBean.eMail)+'</td><td><input type="button" value="修改" /></td></tr><tr><td>头像</td><td>'
							+'<div class="hyb-head-div2" style="width:80px;height:80px;"><input type="image" id="headpicimg" src="'
							+(data.userBean.headpic==null?"img/h1.jpg":data.userBean.headpic)+'" class="img-circle hyb-head "/></div>↑点击选择头像上传</td><td><button id="upload" type="button" style="display:none;">确认上传</button></td></tr><tr><td>自我简介</td><td>'
							+(data.userBean.introduction==null?"":data.userBean.introduction)+'</td><td><input type="button" value="修改" /></td></tr><tr><td><input id="file" type="file" style="display:none" /></td></tr>'
							$("#instablebody").append(ins);
							$(".hyb-head-div .hyb-head").attr("src",(data.userBean.headpic==null?"img/h1.jpg":data.userBean.headpic));
							
							//上传图片操作img点击触发file给自己加图片
							$("#headpicimg").on("click",function(){
								var inp =$("#file");
								var img=$(this)
								inp.on("change",function(){
									if(inp&&img){
									    //读取计算机文件
									    var file=inp[0].files[0];
									    var reader=new FileReader();
									    reader.readAsDataURL(file);
									    reader.onloadstart=function () {
									        console.log('文件上传处理......')
									    };
									    //操作完成
									    reader.onload = function(e){
									        //file 对象的属性
									        img.attr('src',reader.result);
											$("#upload").attr("style","")
									    };
									}
								})
								inp.click();
							})
							//确认上传：
							$("#upload").on("click",function(){
								var formData = new FormData();
								formData.append('headpic', $('#file')[0].files[0]);
								$.ajax({
								    url: '/userheadpix',
								    type: 'POST',
								    cache: false,
								    data: formData,
								    processData: false,
								    contentType: false
								}).done(function(data,status) {
									if(status==404){
										alert("上传失败,文件过大！")
									}
									if(data==null||data==""){
										alert("上传失败,注意文件格式！")
									}else{
										$("#headpicimg").attr("src",data);
										$(".hyb-head-div2 img").attr("src",data);
										alert("上传成功！！")
									}
									$("#upload").attr("style","display:none;")
								}).fail(function(data) {});
							})
							//日期操作
							var deliverDate = new Date(data.userBean.birthday==null?"1":data.userBean.birthday);
							var year = deliverDate.getFullYear();
							//格式化日，如果小于9，前面补0
							var day = ("0" + deliverDate.getDate()).slice(-2);
							//格式化月，如果小于9，前面补0
							var month = ("0" + (deliverDate.getMonth() + 1)).slice(-2);
							//拼装完整日期格式
							var deliverDateStr = year+"-"+(month)+"-"+(day) ;
							$("#inp1").val(deliverDateStr);
							
							//修改按钮操作
							$(".hyb-artical-content input").on("click",function(){
								if($(this).val()=="修改"){
									var txt=$(this).parent().parent().find("td:eq(1)");
			//						alert(txt.html())
									txt.attr("contentEditable", "true");
									$(this).val("完成")
								}else if($(this).val()=="完成"){
									var txt=$(this).parent().parent().find("td:eq(1)");
//									alert("修改为:"+txt.text())
									txt.attr("contentEditable", "false");
									$(this).val("修改");
//									alert($(this).parent().parent().find("td:eq(0)").text())
									if($(this).parent().parent().find("td:eq(0)").text()=="密码"){
										$.post("/userInfoAlter",{
											password:txt.text()
										},f1);
									}else if($(this).parent().parent().find("td:eq(0)").text()=="昵称"){
										$.post("/userInfoAlter",{
											nickname:txt.text()
										},f1);
									}else if($(this).parent().parent().find("td:eq(0)").text()=="邮箱"){
										$.post("/userInfoAlter",{
											email:txt.text()
										},f1);
									}else if($(this).parent().parent().find("td:eq(0)").text()=="自我简介"){
										$.post("/userInfoAlter",{
											introduction:txt.text()
										},f1);
									}
								}else if($(this).val()=="设置"){
									$("#inp1").attr("readOnly",false);
									$(this).val("确定")
								}else if($(this).val()=="确定"){
									$("#inp1").attr("readOnly",true);
									$.post("/userInfoAlter",{
											birthday:$("#inp1").val()
										},f1);
									$(this).val("设置")
								}
								
							})
						}else if($(this).attr("data-iid")==1){
							$("#instablebody").empty();
							if(data.messageId[0]==null){
								$("#instablebody").text("快去评论吧！");	
							}
							data.messageId.forEach(function(item,index,array){
								var ins='<tr><td><div class="row hyb-reply"><div class="col-md-1" style="margin: 5px;">'
								+'<div class="hyb-head-div2" style="width:80px;height:80px;"><input type="image" id="headpicimg" src="'
								+(item.passerHeadpic==null?"img/h1.jpg":item.passerHeadpic)+'" class="img-circle hyb-head "/></div>'
								+'</div><div class="col-md-10" style="float: right;min-height:30px;"><div class="hyb-comment-er"><a href="/space/'
								+item.passerId+'">评论人：'
								+item.passerName+'</a></div><p>内容：'
								+item.words+'</p><div class="hyb-info"><span>'
								+timeTrun(item.sendtime)+'</span><span><i class="glyphicon glyphicon-thumbs-up"></i>&nbsp;'
								+item.agreeNumber+'</span><span class="reply" articleId="'
								+item.articleId+'" replyid="'
								+item.id+'">回复</span></div></div></div></td></tr>'
								$("#instablebody").append(ins);	
								
								$(".reply").on("click",function(){
									$(location).attr('href', '/read/'+$(this).attr("articleId")+'?reply='+$(this).attr("replyid"));
								})
							})
							
						}else if($(this).attr("data-iid")==2){
							$("#instablebody").empty();
							if(data.myArticleId[0]==null){
								$("#instablebody").text("除管理员其他用户暂时无法发布文章。。");	
							}
							data.myArticleId.forEach(function(item,index,array){
									var ins='<tr><td><div class="row cardbean" ><div class="cardrow1"><a href="#" >'
										+'<img src="img/h1.jpg" class="img-circle  hyb-head" /><span >'
										+item.authorName+'</span></a></div><div class="hyb-card-point" data-articleid='
										+item.id+'><div class=" cardrow2" style="min-height: 40px;"><a  ><h4>'
										+item.title+'</h4></a></div><div class="cardrow3"><p >'
										+item.openwords+'</p></div><div class="cardrow4" >'
										+'<span >'+item.visitNumber+'阅读</span><span >'+item.agreeNumber+'点赞</span><span >'+item.commentNumber+'评论</span></div></div></div></td></tr>'
									$("#instablebody").append(ins);	
									
									
								})
							$(".hyb-card-point").on("click",function(){
									$(location).attr('href', '/read/'+$(this).attr("data-articleid")+'');
							})
						}else if($(this).attr("data-iid")==3){
							$("#instablebody").empty();
							if(data.articleCollectId[0]==null){
								$("#instablebody").text("没有收藏，快去尝试收藏文章吧！");	
							}
							data.articleCollectId.forEach(function(item,index,array){
									var ins='<tr><td><div class="row cardbean" ><div class="cardrow1"><a href="#" >'
										+'<img src="img/h1.jpg" class="img-circle  hyb-head" /><span >'
										+item.authorName+'</span></a></div><div class="hyb-card-point" data-articleid='
										+item.id+'><div class=" cardrow2" style="min-height: 40px;"><a  ><h4>'
										+item.title+'</h4></a></div><div class="cardrow3"><p >'
										+item.openwords+'</p></div><div class="cardrow4" >'
										+'<span >'+item.visitNumber+'阅读</span><span >'+item.agreeNumber+'点赞</span><span >'+item.commentNumber+'评论</span></div></div></div></td></tr>'
									$("#instablebody").append(ins);	
									
								})
							$(".hyb-card-point").on("click",function(){
								$(location).attr('href', '/read/'+$(this).attr("data-articleid")+'');
							})
						}else if($(this).attr("data-iid")==4){
							
							$("#instablebody").empty();
							if(data.articleVisitId[0]==null){
								$("#instablebody").text("快去浏览新内容吧！");	
							}
							data.articleVisitId.forEach(function(item,index,array){
									var ins='<tr><td><div class="row cardbean" ><div class="cardrow1"><a href="#" >'
										+'<img src="img/h1.jpg" class="img-circle  hyb-head" /><span >'
										+item.authorName+'</span></a></div><div class="hyb-card-point" data-articleid='
										+item.id+'><div class=" cardrow2" style="min-height: 40px;"><a  ><h4>'
										+item.title+'</h4></a></div><div class="cardrow3"><p >'
										+item.openwords+'</p></div><div class="cardrow4" >'
										+'<span >'+item.visitNumber+'阅读</span><span >'+item.agreeNumber+'点赞</span><span >'+item.commentNumber+'评论</span></div></div></div></td></tr>'
									$("#instablebody").append(ins);	
									
								})
							$(".hyb-card-point").on("click",function(){
									$(location).attr('href', '/read/'+$(this).attr("data-articleid")+'');
							})
						}else if($(this).attr("data-iid")==5){
							$("#instablebody").empty();
							$("#instablebody").text("开发中")
						}else if($(this).attr("data-iid")==6){
							$("#instablebody").empty();
							$("#instablebody").text("开发中")
						}
					})
					//首次进入加载基本信息页
					$("#userinfo a[data-iid=0]").trigger("click");
				});
				$(function(){
					//底部时间处理
					var now=new Date().getTime()
					var startTime = new Date(2019,07,30,00,00,00).getTime()
					var startNum=parseInt((now-startTime)/1000)
					var getdate=function(second){
						var secondTime = 0;// 秒
				        var minuteTime = 0;// 分
				        var hourTime = 0;// 小时
				        var dayTime = 0;//天
				        secondTime=second%60;
			        	minuteTime=parseInt(second/60);
			        	hourTime=parseInt(minuteTime/60);
			        	minuteTime=minuteTime%60;
				        dayTime=parseInt(hourTime/24);
				        hourTime=hourTime%24;
				        return (dayTime==0?"":(dayTime+"天"))+(hourTime==0?"":(hourTime+"时"))+(minuteTime==0?"":(minuteTime+"分"))+(secondTime==0?"":(secondTime+"秒"))
//						return dayTime+":"+hourTime+":"+minuteTime+":"+secondTime;
					}
					$("#runningdate").text(getdate(startNum++))
					setInterval(function rundate(){
					   //业务逻辑
					   $("#runningdate").text(getdate(startNum++))
					},1000)
				})
			})
		</script>

	</head>

	<body style="background: #f2f3f5;font-weight: 300;">
		<!--<body style="background-image: url(img/5.jpg); background-attachment: fixed;">-->
		<!--<div class="row" style="width: 100%;height:200px;overflow: hidden;">
			<img src="img/5.jpg" width="100%">
		</div>-->
		<div class="row" style="height: 80px;">
		</div>
		<div class="container footer-p" style="min-height:750px;">
			<nav id="hyb-nav" class="navbar navbar-default navbar-fixed-top " style="height: 28px;transition: 0.2s;" role="navigation">
				<div class="collapse navbar-collapse hyb-choose" style="text-align: center;margin-right:190px;">
					<ul class="nav navbar-nav" style="display: inline-block;float: none;">
						<li><a class="hidden-xs" href="#">小缤网</a></li>

						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">文章</a>
							<ul class="dropdown-menu">
								<li><a href="#">开发日记</a></li>
								<li><a href="#">心得总结</a></li>
								<li><a href="#">日常＆吐槽</a></li>
								<li><a href="#">简单教程</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">工具</a>
							<ul class="dropdown-menu">
								<li><a href="#">人工智障</a></li>
								<li><a href="#">一个顶俩</a></li>
								<li><a href="#">爬虫工具</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">剧场</a>
							<ul class="dropdown-menu">
								<li><a href="#">我的冒险</a></li>
								<li><a href="#">我的故事</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">壁纸</a>
							<ul class="dropdown-menu">
								<li><a href="#">建设中</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">实验室</a>
							<ul class="dropdown-menu">
								<li><a href="#">商店</a></li>
								<li><a href="#">论坛</a></li>
								<li><a href="#">资源下载</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">其它</a>
							<ul class="dropdown-menu">
								<li><a href="#">本站大事记</a></li>
								<li><a href="#">关于站主</a></li>
								<li><a href="#">了解更多</a></li>
							</ul>
						</li>
						<li class="dropdown ">
							<div class=" dropdown-toggle center-block" style="Margin:2px" data-toggle="dropdown">
							</div>
							<ul class="dropdown-menu ">
								<li><span>开发中。。</span></li>
								<li class="divider"></li>
								<li><a href="#">消息中心</a></li>
								<li><a href="#">我的空间</a></li>
								<li><a href="#">我的收藏</a></li>
							</ul>
						</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle " data-toggle="dropdown">公告</a>
							<ul class="dropdown-menu">
								<li><a href="#">暂无公告</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
			<div class="row">
				<!--
	            	作者：offline
	            	时间：2019-08-14
	            	描述：侧边栏
	            -->
				<div class="col-md-3 hidden-xs hidden-sm ">
					<div class="hyb-affix" id="myNav" style="margin: 10px;">
						<!--侧栏一号-->
						<div class="row hyb-sidebar-no1">
							<!--头像-->
							<div class="row col-md-3 col-md-push-5 hyb-head-div hyb-head-div2">
								<a href="#" style="cursor: pointer;"><img src="img/h1.jpg" class="img-circle  hyb-head" width="80px" /></a>
							</div>
							<div style="height: 70px;">

							</div>

							<!--介绍-->
							<div class="row hyb-introduction-div">
								<div class="col-md-10 col-md-push-1">
									<p style="font-size: 16px; height: 70px;margin: 0;text-align: center;color: #333;">我！就是力量的化身</p>
								</div>
							</div>

							<div class="col-md-12 ">
								<div class="tab-content hyb-sidebar-no3-tabtext">
									<div  id="userinfo">
										<ul class="hyb-ul">
											<a href="javascript:void(0);" data-iid="0" style="background: #00a1d6;color: white;"><i class="glyphicon glyphicon-book"></i>基本信息</a>
											<a href="javascript:void(0);" data-iid="1"><i class="glyphicon glyphicon-book"></i>收到的回复</a>
											<a href="javascript:void(0);" data-iid="2"><i class="glyphicon glyphicon-book"></i>我的作品</a>
											<a href="javascript:void(0);" data-iid="3"><i class="glyphicon glyphicon-book"></i>我的收藏</a>
											<a href="javascript:void(0);" data-iid="4"><i class="glyphicon glyphicon-book"></i>我的浏览</a>
											<a href="javascript:void(0);" data-iid="5"><i class="glyphicon glyphicon-book"></i>我的关注</a>
											<a href="javascript:void(0);" data-iid="6"><i class="glyphicon glyphicon-book"></i>我的粉丝</a>
										</ul>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-8" style="margin: 40px;">
					<!--空隙-->
					<div style="height: 50px;"></div>
					<!--
                    	P1文章主体
                    -->
					<div class="row hyb-artical-body">
						<div class="hyb-artical-outline">
							<!--标题div-->
							<div class="hyb-artical-title">
								<h1>我的基本信息卡片</h1>
							</div>

							<!--卡片主体div-->
							<div class="hyb-artical-content">
								<table class="table table-hover" >
									<tbody id="instablebody">
										
									</tbody>
								</table>
							</div>
							<hr />
							<div class="row">
								<div class="col-md-2 col-md-push-10" style="height: 60px;">
									<a href="/cancellation" id="cancellation">注销</a>
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
		<div class="hyb-back-top">
		</div>
		<div id="footer" style="background:rgba(35,40,45,1)">
			<div class="parallax-footer">
				<p style="color:#ffffff;">
					© 2019 <a href="https://xiaobin66.cn" style="color: #ffffff;" target="_blank">小缤网.</a> All Rights Reserved.
					<br/>
					<br/> 本站已经在风雨中度过了<span id="runningdate"></span>，她的成长将由你来见证！QWQ
					<br/>
					<br/> SITEMAP
					<br/>
					<br/> <a href="http://www.beian.miit.gov.cn" style="color: #ffffff;" target="_blank">互联网 ICP 备案：粤IPC备19093182号</a>
				</p>
			</div>
		</div>
	</body>

</html>