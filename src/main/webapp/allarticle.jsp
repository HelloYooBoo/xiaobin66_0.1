<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
	<c:forEach items="${articlelist }" var="article">
	<tr >
		<td>${article.id }</td>
		<td>${article.uploadtime }</td>
		<td>${article.authorId }</td>
		<td>${article.ex }</td>
		<td>${article.openwords }</td>
		<td>${article.textorwallpaper }</td>
		<td>${article.authorId }</td>
		<td><a href="/article/all?action=alter&id=${article.id }">修改</a> </td>
		<td><a href="/article/all?action=hide&id=${article.id }">隐藏(删除)</a> </td>
	</tr>
	</c:forEach>
	<a href="/article/all?action=insert">新增</a>
</table>
</body>
</html>