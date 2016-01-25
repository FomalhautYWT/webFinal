<%--
  Created by IntelliJ IDEA.
  User: yangwentao
  Date: 2016/1/16
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("power") == null || session.getAttribute("power").toString() == "1")
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
    <link href="./bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

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
    <title>Title</title>
</head>
<body>
<%
    if (session.getAttribute("info")!=null)
    {
        %>
        <h1><%=session.getAttribute("info")%></h1>
<%
        session.setAttribute("info",null);
    }

    %>
<form action="/updateUser" method="post">
    <label>用户名：</label>
    <input type="text" name="u_id" readonly="readonly" value="<%=request.getParameter("u_id")%>" class="form-control"/><br/>

    <label>姓名：</label>
    <input type="text" name="u_name" readonly="readonly" value="<%=request.getParameter("u_name")%>" class="form-control"/>
    <label>新密码：</label>
    <input  name="password" type="password" class="form-control"/><br/>
    <label>再次输入密码：</label>
    <input  name="twice" type="password" class="form-control"/><br/>
    <button type="submit">提交</button>
</form>
<button onclick="RTD1()" type="button" class="btn-primary btn-lg">返回功能页面</button>
<script>
    function RTD1()
    {
        window.location.href="http://localhost:8080/redTenDo.jsp";
    }
</script>
<button onclick="r()" type="button" class="btn-primary btn-lg">退出登录</button>
<script>
    function r()
    {
        window.location.href="http://localhost:8080/deLog";
    }
</script>
</body>
</html>
