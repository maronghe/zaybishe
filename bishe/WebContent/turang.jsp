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

<title>土壤环境变化</title>

<link rel="stylesheet" href="bootstrap3.3.5/css/bootstrap.min.css" >
<script src="bootstrap3.3.7/js/bootstrap.min.js" ></script>
<script src="jquery1.11.3/jquery-1.11.3.js"></script>

</head>
<body background="image/denglu.jpg">
<div align="center">
<h1><font color="#0c2ea3">土壤环境变化</font></h1>


<hr color="green" size="5">

<h3>
<span class="glyphicon glyphicon-user"><a href=http://www.weather.com.cn/>天气预报</a>
<span class="glyphicon glyphicon-tag"><a href=http://www.agronet.com.cn/>农业热点</a>
<span class="glyphicon glyphicon-star"><a href="Login.html">退出</a></h3>
<table border=1 class="table  table-hover table-bordered">

<tr>

<td>时间</td>

<td>湿度</td>
<td>光照</td>
</tr>

<%
  List<Map<String,String>> turangs=(List<Map<String,String>>)request.getAttribute("turang");
  int i=0;
  //for-each:变量类型Map<String,String> 变量名user：遍历的对象users
  for(Map<String,String> turang:turangs){
	  i++;//统计有几条记录
%>
	<tr><td><%=turang.get("time")%></td>
	  
	    
	    <td><%=turang.get("hum")%></td>
	    <td><%=turang.get("illum")%></td>
	    
    </tr>
	<%
		}
	%>
	
</table>
</div>
</body>
</html>