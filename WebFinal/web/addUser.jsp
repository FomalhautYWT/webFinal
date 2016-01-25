<%@ page import="action.userAction" %><%--
  Created by IntelliJ IDEA.
  User: yangwentao
  Date: 2016/1/16
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    String theInfo = "";
    String theName = "";
    String theId = "";

%>
<%
    if (session.getAttribute("power") == null || session.getAttribute("power").toString() == "1")
    {
        session.invalidate();
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }
    if (session.getAttribute("info") != null)
    {
        theInfo = session.getAttribute("info").toString();
        session.setAttribute("info",null);
    }
    userAction.refreshList();
    if (request.getParameter("u_name")!=null)
    {
        theName = request.getParameter("u_name");
    }
    if (request.getParameter("u_id")!=null)
    {
        theId = request.getParameter("u_id");
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
    <title>addUser</title>
</head>
<body>
    <form action="/addUser" method="post">
        <label>用户名：</label>
        <input type="text" name="u_id" value="<%=theId%>" class="form-control"/><br/>
        <label>姓名：</label>
        <input type="text" type="password" name="u_name" value="<%=theName%>" class="form-control"/><br/>
            <label>密码：</label>
        <input type="password" name="password" class="form-control"/><br/>
                <label>再次输入密码：</label>
        <input type="password" name="twice" class="form-control"/><br/>
        <select name="power" class="form-control">
            <option value="0">超管</option>
            <option value="1">普通用户</option>
        </select><br/>
        <p align="right">
        <button type="submit" class="btn-default btn-lg">提交</button>
        </p>
    </form>
    <button onclick="r()" type="button" class="btn-primary btn-lg">退出登录</button>
    <script>
        function r()
        {
            window.location.href="http://localhost:8080/deLog";
        }
    </script>
    <button onclick="RTD1()" type="button" class="btn-primary btn-lg">返回功能页面</button>
    <script>
        function RTD1()
        {
            window.location.href="http://localhost:8080/redTenDo.jsp";
        }
    </script>
</body>

</html>
