<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title></title>
</head>
<body background="images/1456.jpg">
<center>
<%=request.getAttribute("msg")%>
ÇëÉÔµÈ,1ÃëÖÓºóÌø×ª¡­¡­
<%
response.setHeader("refresh","1;url="+request.getAttribute("url"));
%>
</center>
</body>
</html>