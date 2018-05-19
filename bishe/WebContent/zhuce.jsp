<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<!-- 3.3.5版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="bootstrap3.3.5/css/bootstrap.min.css">
<!-- 3.3.5的 Bootstrap 核心 JavaScript 文件 -->
<script src="bootstrap3.3.5/js/bootstrap.min.js"></script>
<script src="jquery1.11.3/jquery-1.11.3.js"></script>

</head>
<body  >
<center>


<p>

<form action="Zhuce.action" method="post"
 enctype="multipart/form-data">
<table class="table table-hover">
<form class="form-horizontal">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
    <div class="col-sm-10">
      <input type="text" name="user" class="form-control" id="inputEmail3" placeholder="真实的">
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
    <div class="col-sm-10">
      <input type="text" name="pass" class="form-control" id="inputPassword3" placeholder="至少两位">
    </div>
  </div>
  
<form class="form-horizontal">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">电话</label>
    <div class="col-sm-10">
      <input type="text" name="tel"  class="form-control" id="inputEmail3" placeholder="电话">
    </div>
  </div>
  <form class="form-horizontal">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">住址</label>
    <div class="col-sm-10">
      <input type="text"  name="addr"  class="form-control" id="inputEmail3" placeholder="住址">
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox"> Remember me
        </label>
      </div>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">注册</button>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="reset" class="btn btn-default">重置</button>
    </div>
    </div>
    
     
    <div class="col-sm-offset-2 col-sm-10">
      <a href="Login.html" class="btn btn-default">退出</button>
    </div>
  
</form>

</table>
</form>
</center>
</body>
</html>
