<%@ page pageEncoding="GBK" import="model.User"%>
<%@page import="java.util.*" %>
 <html>
<head>
<title></title>
<link rel="stylesheet" href="bootstrap3.3.5/css/bootstrap.min.css" >
<script src="bootstrap3.3.5/js/bootstrap.min.js" ></script>
<script src="jquery1.11.3/jquery-1.11.3.js"></script>
</head>
<body background="image/daotian.jpg">
<div align="center">
<%
 
       Map<String,String> user=
    		   (Map<String,String>)request.getAttribute("user");
	%>    
    <form action="editDo.action" method="post" class="form-horizontal">
    <input type="hidden" name="id" value=<%=user.get("id")%>>
  <div class="form-group">
    <label for="inputName1" class="col-sm-3 control-label">用户名</label>
    <div class="col-sm-7">
      <input type="text" name="user" class="form-control" id="inputName1" value=<%=user.get("userName")%>>
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputPassword1" class="col-sm-3 control-label">密码</label>
    <div class="col-sm-7">
      <input type="text" name="pass" class="form-control" id="inputPassword1" value=<%=user.get("password")%>>
    </div>
  </div>
  
   <div class="form-group">
    <label for="inputTel1" class="col-sm-3 control-label">电话</label>
    <div class="col-sm-7">
      <input type="text" name="tel" class="form-control" id="inputTel1" value=<%=user.get("telephone")%>>
    </div>
  </div>
  
    <div class="form-group">
    <label for="inputadd" class="col-sm-3 control-label">地址</label>
    <div class="col-sm-7">
      <input type="text" name="addr" class="form-control" id="inputadd" value=<%=user.get("address")%>>
    </div>
  </div>
  
  
  <div class="form-group">
    <div class="col-sm-offset-3 col-sm-7">
      <button type="submit" class="btn btn-default">提交修改</button>
    </div>
  </div>
</form>
    </div>
</body>
</html>