<%@ page import="data.rec" %>
<%@ page import="action.recAction" %>
<%@ page import="java.util.Map" %>
<%@ page import="action.sumAction" %>
<%@ page import="static java.lang.Integer.min" %><%--
  Created by IntelliJ IDEA.
  User: yangwentao
  Date: 2016/1/17
  Time: 19:11
  To change this template use File | Settings | File Templates.
--%>
<%!
    int pageSize = 3;
    int cPage = 1;
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("haveData") == null)
        recAction.getProv("","");
    else
    {
        recAction.getProv(session.getAttribute("beginTime").toString(),session.getAttribute("endTime").toString()        );
        session.setAttribute("haveData",null);
    }
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
    <title>provCount</title>
</head>

<body>
<p align="right">
    <button onclick="r()" type="button" class="btn-link">退出登录</button>
</p>
<script>

    function RTD1()
    {
        window.location.href="http://localhost:8080/redTenDo.jsp";
    }
    function RTD2()
    {
        window.location.href="http://localhost:8080/normalDo.jsp";
    }
</script>
<form action="/getProv">
    <label>选择起始时间:</label>
    <input id="getBeginTime" name="getBeginTime" type="date" onchange="changeDate()" class="form-control">
    <label>选择终止时间：</label>
    <input id="getEndTime" name="getEndTime" type="date" onchange="changeDate()" class="form-control">
    <button id="searchButton" name = "searchButton" type="submit" class="btn-primary">搜索</button>
    <%
        if(session.getAttribute("u_id")!=null)
        {
            %>
    <button onclick="RTD1()" type="button" class="btn-warning">返回功能页面</button>
    <%
        }
        else
        {
            %>
    <button onclick="RTD2()"type="button" class="btn-warning">返回功能页面</button>
            <%
        }
    %>
</form>
    <table class="table table-striped">
        <tr>
            <td>省份</td>
            <td>金额</td>
        </tr>
        <%
            int start = (cPage - 1) * pageSize + 1;
            int end = min((start + pageSize - 1),recAction.co.entrySet().size());
            int theCount = 0;
            for(Object entry:recAction.co.entrySet())
            {
                Map.Entry<String,Double> x = (Map.Entry<String,Double>)entry;
                theCount ++;
                if (theCount >= start && theCount <= end){
            %>

        <tr>
            <td><%=x.getKey()%></td>
            <td><%=x.getValue()%></td>
        </tr>
        <%
                }
            }
        %>
    </table>
<%
    if (end < recAction.co.entrySet().size())
    {
%>
<input type="button" value = "下一页" onclick="location.href='provCount.jsp?page=<%=cPage+1%>'" class="btn-default">

<%
    }
%>
<%
    if (cPage > 1){


%>

<input type="button" value = "上一页" onclick="location.href='provCount.jsp?page=<%=cPage-1%>'" class="btn-default">
<%
    }

%>

<script>
    function r()
    {
        window.location.href="http://localhost:8080/deLog";
    }
</script>
</body>

</html>
