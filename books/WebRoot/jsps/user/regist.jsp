<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'regist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/jsps/css/user/regist.css"/>">
    <script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"> </script>
    <script type="text/javascript" src="<c:url value='/jsps/js/user/regist.js'/>"></script>
  </head>
  
  <body>
   <div class="divBody">
   <div class="divTitle">
   <span clss="spanTitle">新用户注册</span>
   </div>
   <div class="divCenter">
   <form method="post" action="<c:url value='/UserServlet'/>" id="registForm">
      <!-- 会话跟踪 ,表单中的会话跟踪，一般采用隐藏域-->
      <input type="hidden" name="method" value="regist">
   <table align="center">
   <tr>
   <td clss="tdTitle">用户名：</td>
   <td clss="tdInput"><input type="text" name="loginname" id="loginname" class="input" value="${form.loginname}"></td>
   <td clss="tdLabel"><label class="error" id="loginnameError">${error.loginname}</label></td>
   </tr>
   <tr>
   <td clss="tdTitle">登录密码：</td>
   <td clss="tdInput"><input type="password" name="loginpass" id="loginpass" class="input" value="${form.loginpass}"></td>
   <td clss="tdLabel"><label class="error" id="loginpassError">${error.loginpass}</label></td>
   </tr>
   <tr>
   <td clss="tdTitle">确认密码：</td>
   <td clss="tdInput"><input type="password" name="reloginpass" id="reloginpass" class="input" value="${form.reloginpass}"></td>
   <td clss="tdLabel"><label class="error" id="reloginpassError">${error.reloginpass}</label>
   <tr>
   <td clss="tdTitle">Email：</td>
   <td clss="tdInput"><input type="text" name="email" id="email" class="input" value="${form.email}"></td>
   <td clss="tdLabel"><label class="error" id="emailError">${error.email}</label></td>
   </tr>
   <tr>
   <td clss="tdTitle">图形验证码：</td>
   <td clss="tdInput"><input type="text" name="verifyCode" id="verifyCode" class="input" value="${form.verifyCode}"></td>
   <td clss="tdLabel"><label class="error" id="verifyCodeError">${error.verifyCode}</label></td>
   </tr>
   <tr>
   <td clss="tdTitle"></td>
   <td><span class="spanImg"><img id="vCode" src="<c:url value="/VerifyCodeServlet"/>"><a href="javascript:yzm()">看不清换一张</a></span></td>
   <td clss="tdLabel"></td>
   </tr>
   <tr>
   <td clss="tdTitle"></td>
   <td clss="tdInput"><input id="submit" type="image" src="<c:url value="/images/regist1.jpg"/>" class="input"></td>
   <td clss="tdLabel"></td>
   </tr>
   </table>
   </form>
   </div>
   </div>
  </body>
</html>
