<%--
  Created by IntelliJ IDEA.
  User: yangwentao
  Date: 2016/1/16
  Time: 18:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("power") == null)
    {
        session.invalidate();
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }
%>
<html>
<head>
    <!-- Bootstrap Core CSS -->
    <link href="./bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="./bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="./bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css"
          rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="./bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="./dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="./bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="./bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="./bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="./bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="./bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="./dist/js/sb-admin-2.js"></script>
    <title>donMon</title>
</head>
<body>
<%
    if (session.getAttribute("error")!=null)
    {
        %>
<h1><%=session.getAttribute("error")%></h1>
<%
        session.setAttribute("error",null);
    }
%>
<p align="right">
    <button onclick="r()" type="button" class="btn-link">退出登录</button>
</p>
<form action="/addDon">
    <label for="name">捐款人姓名：</label>

    <div class="input-group">
        <input id="name" name="name" type="text" class="form-control">
    </div>
    <div class="input-group">

        <label for="name">捐款人身份证：</label>
        <input id="idCard" name="idCard" type="text" class="form-control"><br/>
    </div>
    <div class="input-group">

        <label for="name">捐款金额：</label>
        <div class="input-group">
        <span class="input-group-addon">$</span>
        <input id="count" name=count type="text" class="form-control"><br/>
            </div>
        <button type="submit">提交</button>
    </div>
</form>
<button onclick="RTD1()" type="button" class="btn-primary btn-lg">返回功能页面</button>
<script>
    function RTD1()
    {
        window.location.href="http://localhost:8080/redTenDo.jsp";
    }
</script>

<script>
    function r()
    {
        window.location.href="http://localhost:8080/deLog";
    }
</script>
</body>
</html>
