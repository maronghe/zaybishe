<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
 <%@ page import="java.sql.*"%>
 <%@ page import="java.util.*"%>
 <%@ page import="model.User"%>
 <script language="JavaScript">             
function delete_confirm(e) 
{
    if (event.srcElement.outerText == "ɾ��") 
    {
        event.returnValue = confirm("ɾ���ǲ��ɻָ��ģ���ȷ��Ҫɾ����");
    }
}
document.onclick = delete_confirm;
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">

<title>�û�����</title>

<link rel="stylesheet" href="bootstrap3.3.5/css/bootstrap.min.css" >
<script src="bootstrap3.3.7/js/bootstrap.min.js" ></script>
<script src="jquery1.11.3/jquery-1.11.3.js"></script>

</head>
<body background="image/denglu.jpg">
<div align="center">
<h1><font color="#0c2ea3">�û�����</font></h1>


<hr color="green" size="5">

<h3>
<span class="glyphicon glyphicon-user"><a href=turang.action>��������</a>
<span class="glyphicon glyphicon-tag"><a href=zeng.jsp>��ӹ���Ա</a>
<span class="glyphicon glyphicon-star"><a href="Login.html">�˳�</a></h3>
<table border=1 class="table table-striped table-hover table-bordered">

<tr>

<td>�û���</td>
<td>����</td>
<td>��ɫ</td>
<td>�绰</td>
<td>��ַ</td>
<td>����</td></tr>

<%
  List<Map<String,String>> users=(List<Map<String,String>>)request.getAttribute("user");
  int i=0;
  //for-each:��������Map<String,String> ������user�������Ķ���users
  for(Map<String,String> user:users){
	  i++;//ͳ���м�����¼
%>
	<tr><td><%=user.get("userName")%></td>
	    <td><%=user.get("password")%></td>
	    <td><%if(user.get("ident").equals("1"))
	             out.println("<font color=red>����Ա</font>");
	             else out.println("��ͨ�û�");%></td>
	    <td><%=user.get("telephone")%></td>
	    <td><%=user.get("address")%></td>
	    <td><a href=edituser.action?id=<%=user.get("id")%>>�޸�</a>
	    ||<a href="javascript:if(confirm('ȷʵҪɾ����?'))
	    location='http://localhost:8080/bishe/deluser.action?id=<%=user.get("id")%>'">ɾ��</a></td>
    </tr>
	<%
		}
	%>
	
</table>
</div>
</body>
</html>