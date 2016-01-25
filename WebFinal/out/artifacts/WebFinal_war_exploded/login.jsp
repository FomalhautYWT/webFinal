<%--
  Created by IntelliJ IDEA.
  User: yangwentao
  Date: 2016/1/15
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
String title
        ,
        error;
%>
<%
    if (session.getAttribute("error") != null) {
        title = session.getAttribute("error").toString();
        error = title;
    } else {
        title = "login";
        error = "";
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
    <title>login</title>
</head>
<body>
<div style="padding:100px 100px 10px;">
    <form action="login" method="post" role="form">
        <div class="form-signin">
            <p align="center">
                <label>User ID :</label>

                <input type="text" class="form-control" name="u_id" placeholder="User_ID"/>
            </p>

            <p align="center">
                <label>Password:</label>
                <input type="password" name="pwd"  class="form-control" placeholder="Password"/><br/>
            </p>

            <p align="center">
                <button type="submit" class="btn-primary btn-lg">提交</button>
                <button type="reset" class="btn-danger btn-lg">重置</button>
            </p>
        </div>
        <%=error%>
        <%
            session.setAttribute("error", null);
            error = "";
        %>
    </form>
</div>

</body>
</html>
