<%--
  Created by IntelliJ IDEA.
  User: yangwentao
  Date: 2016/1/16
  Time: 3:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title></title>
</head>
<%
    if (session.getAttribute("power") == null)
    {
        session.invalidate();
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }
%>
<body>
<p align="right">
<button onclick="r()" type="button" class="btn-link">退出登录</button>
</p>
    <%

        if (session.getAttribute("power").toString().equals("0")){
    %>
    <p align="center">
    <button onclick="turnToMang()"class="btn btn-info btn-lg">管理用户</button><br/>
        </p>
    <%
        }
    %>
    <p align="center">
    <button onclick="turnToRec()" class="btn btn-primary btn-lg">接受捐赠</button>
        <button onclick="turnToDon()" class="btn btn-primary btn-lg">资助捐款</button>
    </p>

    <p align="center">
    <button onclick="turnToRecList()"class="btn btn-warning btn-lg">收到捐赠列表</button>
        <button onclick="turnToDonList()"class="btn btn-success btn-lg">资助列表</button>
    </p>

    <p align="center">
    <button onclick="turnToProv()"class="btn btn-danger btn-lg">省统计</button>
        </p>

    <script>
        function turnToMang()
        {
            window.location.href="http://localhost:8080/userMang.jsp";
        }
        function turnToRec()
        {
            window.location.href="http://localhost:8080/recMon.jsp";
        }
        function turnToDon()
        {
            window.location.href="http://localhost:8080/donMon.jsp";
        }
        function turnToRecList()
        {
            window.location.href="http://localhost:8080/recList.jsp";
        }
        function turnToDonList()
        {
            window.location.href="http://localhost:8080/donList.jsp";
        }
        function turnToProv()
        {
            window.location.href="http://localhost:8080/provCount.jsp"
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

