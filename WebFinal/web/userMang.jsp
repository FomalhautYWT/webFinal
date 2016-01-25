<%@ page import="data.user" %>
<%@ page import="action.userAction" %>
<%@ page import="static java.lang.Integer.min" %><%--
  Created by IntelliJ IDEA.
  User: yangwentao
  Date: 2016/1/16
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    String theInfo = "";
    int pageSize = 3;
    int cPage = 1;
%>
<%
    if (session.getAttribute("power") == null || session.getAttribute("power").toString() == "1") {
        session.invalidate();
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    if (session.getAttribute("info") != null) {
        theInfo = session.getAttribute("info").toString();
        session.setAttribute("info", null);
    }
    userAction.refreshList();
    if (request.getParameter("page")!=null)
    {
        if (Integer.parseInt(request.getParameter("page"))<1)
        {
            cPage = 1;
        }
        else
        {
            cPage = Integer.parseInt(request.getParameter("page"));
        }
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
    <title>mangermant</title>
</head>
<body>
<p align="right">
<button onclick="r()" type="button" class="btn-link">退出登录</button>
</p>
<script>
    function addUser() {
        window.location.href = "http://localhost:8080/addUser.jsp";
    }
</script>
<table border="1" class="table table-striped">
    <caption>
        <p align="center">

        <h1>用户管理</h1>
        </p>
    </caption>
    <tr>
        <td>user_ID</td>
        <td>user_Name</td>
        <td>modify</td>
        <td>delete</td>
    </tr>
    <%
        userAction.refreshList();
        int start = (cPage - 1) * pageSize + 1;
        int end = min((start + pageSize - 1),userAction.userList.size());
        int theCount = 0;
        for (user s : userAction.userList) {
            theCount ++;
            if (theCount >= start && theCount <= end){
    %>
    <tr>
        <td><%=s.getID()%>
        </td>
        <td><%=s.getName()%>
        </td>

        <td><a href="http://localhost:8080/updateUser.jsp?u_id=<%=s.getID()%>&u_name=<%=s.getName()%>">更改用户信息</a></td>
        <td><a href="http://localhost:8080/deleteUser?u_id=<%=s.getID()%>">删除该用户</a></td>
    </tr>

    <%
            }
        }
    %>

</table>
<%
    if (end < userAction.userList.size())
    {
%>
<input type="button" value = "下一页" onclick="location.href='userMang.jsp?page=<%=cPage+1%>'" class="btn-default">

<%
    }
%>
<%
    if (cPage > 1){


%>

<input type="button" value = "上一页" onclick="location.href='userMang.jsp?page=<%=cPage-1%>'" class="btn-default">
<%
    }

%>
<p align="center">
    <button onclick="RTD1()" type="button" class="btn-primary btn-lg">返回功能页面</button>
    <button onclick="addUser()" class="btn-primary btn-lg">+添加新用户</button>

</p>
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
