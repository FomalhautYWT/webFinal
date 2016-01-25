<%@ page import="action.sumAction" %>
<%@ page import="action.recAction" %>
<%@ page import="data.rec" %>
<%@ page import="static java.lang.Integer.min" %><%--
  Created by IntelliJ IDEA.
  User: yangwentao
  Date: 2016/1/17
  Time: 0:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    int pageSize = 3;
    int cPage = 1;
%>
<%
    if (session.getAttribute("haveData") == null)
        recAction.refreshList("", "", "");
    else {
        recAction.refreshList(session.getAttribute("beginTime").toString(), session.getAttribute("endTime").toString(), session.getAttribute("name").toString());
        session.setAttribute("haveData", null);
    }
    sumAction.num = sumAction.getSum();
    if (request.getParameter("page") != null) {
        if (Integer.parseInt(request.getParameter("page")) < 1) {
            cPage = 1;
        } else {
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
    <title>Title</title>
</head>
<body>
<p align="right">
    <button onclick="r()" type="button" class="btn-link">退出登录</button>
</p>
<script>

</script>
<p align="center">
    <label>
        当前余额为:</label><%=sumAction.num%>
</p>

<form action="/getRec">
    <div class="form-group">
        <label>选择起始时间:</label>

        <input id="getBeginTime" name="getBeginTime" type="date" onchange="changeDate()" class="form-control"><br/>
        <label>选择终止时间：</label>
    </div>
    <div class="form-group">
        <input id="getEndTime" name="getEndTime" type="date" onchange="changeDate()" class="form-control"><br/>
        <label>选择捐款人:</label>
    </div>
    <div class="form-group">
        <select id="getName" name="getName" class="form-control">
            <option value="">未选择</option>
            <%
                int x = 0;
                for (String s : recAction.getRecer()) {
            %>
            <option value="<%=s%>"><%=s%>
            </option>
            <%

                }
            %>
        </select>
    </div>
    <button id="searchButton" name="searchButton" type="submit" class="btn-lg btn-primary">搜索</button>
</form>

<table id="dataList" class="table table-striped">
    <tr>
        <td>捐款人</td>
        <td>省份</td>
        <td>城市</td>
        <td>捐赠金额</td>
        <td>日期</td>
    </tr>
    <%
        int start = (cPage - 1) * pageSize + 1;
        int end = min((start + pageSize - 1),recAction.recList.size());
        int theCount = 0;
        for (rec d : recAction.recList) {
            theCount ++;
            if (theCount >= start && theCount <= end){
    %>
    <tr>
        <td><%=d.getName()%>
        </td>
        <td><%=d.getP_id()%>
        </td>
        <td><%=d.getC_id()%>
        </td>
        <td><%=d.getCount()%>
        </td>
        <td><%=d.getTime()%>
        </td>
    </tr>
    <%
            }
        }
    %>
</table>
<%
    if (end < recAction.recList.size())
    {
%>
<input type="button" value = "下一页" onclick="location.href='recList.jsp?page=<%=cPage+1%>'" class="btn-default">

<%
    }
%>
<%
    if (cPage > 1){


%>

<input type="button" value = "上一页" onclick="location.href='recList.jsp?page=<%=cPage-1%>'" class="btn-default">
<%
    }

%>
<button onclick="RTD1()" type="button" class="btn-primary btn-lg">返回功能页面</button>
<script>
    function RTD1() {
        window.location.href = "http://localhost:8080/redTenDo.jsp";
    }
</script>

<script>
    function r() {
        window.location.href = "http://localhost:8080/deLog";
    }
</script>
</body>
</html>
