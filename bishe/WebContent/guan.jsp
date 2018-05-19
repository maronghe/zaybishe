<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
 <%@ page import="java.sql.*"%>
 <%@ page import="java.util.*"%>
 <%@ page import="model.User"%>
 <script language="JavaScript">             
function delete_confirm(e) 
{
    if (event.srcElement.outerText == "删除") 
    {
        event.returnValue = confirm("删除是不可恢复的，你确认要删除吗？");
    }
}
document.onclick = delete_confirm;
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">

<title>用户管理</title>

<link rel="stylesheet" href="bootstrap3.3.5/css/bootstrap.min.css" >
<script src="bootstrap3.3.7/js/bootstrap.min.js" ></script>
<script src="jquery1.11.3/jquery-1.11.3.js"></script>

</head>
<body background="image/denglu.jpg">
<div align="center">
<h1><font color="#0c2ea3">用户管理</font></h1>


<hr color="green" size="5">

<h3>
<span class="glyphicon glyphicon-user"><a href=turang.action>土壤环境</a>
<span class="glyphicon glyphicon-tag"><a href=zeng.jsp>添加管理员</a>
<span class="glyphicon glyphicon-star"><a href="Login.html">退出</a></h3>
<table border=1 class="table table-striped table-hover table-bordered">

<tr>

<td>用户名</td>
<td>密码</td>
<td>角色</td>
<td>电话</td>
<td>地址</td>
<td>操作</td></tr>

<%
  List<Map<String,String>> users=(List<Map<String,String>>)request.getAttribute("user");
  int i=0;
  //for-each:变量类型Map<String,String> 变量名user：遍历的对象users
  for(Map<String,String> user:users){
	  i++;//统计有几条记录
%>
	<tr><td><%=user.get("userName")%></td>
	    <td><%=user.get("password")%></td>
	    <td><%if(user.get("ident").equals("1"))
	             out.println("<font color=red>管理员</font>");
	             else out.println("普通用户");%></td>
	    <td><%=user.get("telephone")%></td>
	    <td><%=user.get("address")%></td>
	    <td><a href=edituser.action?id=<%=user.get("id")%>>修改</a>
	    ||<a href="javascript:if(confirm('确实要删除吗?'))
	    location='http://localhost:8080/bishe/deluser.action?id=<%=user.get("id")%>'">删除</a></td>
    </tr>
	<%
		}
	%>
	
</table>
</div>
</body>
</html>