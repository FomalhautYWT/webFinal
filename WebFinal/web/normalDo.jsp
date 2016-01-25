<%--
  Created by IntelliJ IDEA.
  User: yangwentao
  Date: 2016/1/17
  Time: 0:52
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
    <title>Title</title>
</head>
<body>

<p align="center">
<button onclick="turnToRecList()" class="btn-primary">收到捐赠列表</button>
</p>
<p align="center">
<button onclick="turnToDonList()" class="btn-primary">资助列表</button>
</p>
<p align="center">
    <button onclick="turnToProv()" class="btn-primary">省统计</button>
</p>
<script>
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
    window.location.href="http://localhost:8080/provCount.jsp";
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
