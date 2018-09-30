<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>图书列表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="content-type" content="text/html;charset=utf-8">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/book/list.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/pager/pager.css'/>" />
    <script type="text/javascript" src="<c:url value='/jsps/pager/pager.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsps/js/book/list.js'/>"></script>
  </head>
  
  <body>

<ul>
  <c:forEach items="${pb.beanList}" var="book">
  <li>
  <div class="inner">
    <a class="pic" href="<c:url value='/BookServlet?method=findLoad&bid=${book.bid }'/>"><img id="img" src="<c:url value='${book.image_b}'/>"  border="0"/></a>
    <p class="price">
		<span class="price_n">&yen;${book.currPrice }</span>
		<span class="price_r">&yen;${book.price }</span>
		(<span class="price_s">${book.discount }</span>)
	</p>
	<%--通过超链接发送请求，一定是get请求方式，get请求方式发送的过程中，中文是无法通过处理请求对象处理的--%>
	<%-- 标签会自动对参数进行编码处理 --%>
	<c:url value='BookServlet' var="authorUrl">
	   <c:param name="method" value="findByAuthor"></c:param>
	   <c:param name="author" value="${book.author }"></c:param>
	</c:url>
	<c:url value='BookServlet' var="pressUrl">
	   <c:param name="method" value="findByPress"></c:param>
	   <c:param name="press" value="${book.press }"></c:param>
	</c:url>
	
	<p><a id="bookname" title="${book.bname }" href="<c:url value='/BookServlet?method=findLoad&bid=${book.bid }'/>">${book.bname }</a></p>
	<p><a href="<c:url value='${authorUrl}'/>" name='P_zz' title='${book.author }'>${book.author }</a></p>
	<p class="publishing">   
		<span>出 版 社：</span><a href="<c:url value='${pressUrl}'/>">${book.press }</a>
	</p>
	<p class="publishing_time"><span>出版时间：</span>${book.publishtime }</p>
  </div>
  </li>
  </c:forEach>
</ul>

<div style="float:left; width: 100%; text-align: center;">
	<hr/>
	<br/>
	<%@include file="/jsps/pager/pager.jsp" %>
</div>

  </body>
 
</html>

