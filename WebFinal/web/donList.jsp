<%@ page import="action.sumAction" %>
<%@ page import="data.donation" %>
<%@ page import="action.donAction" %>
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



    System.out.println("haveData"+session.getAttribute("haveData"));
    if (session.getAttribute("haveData") == null)
        donAction.refreshList("","","");
    else
    {
        System.out.println("woshi");
        System.out.println(session.getAttribute("beginTime").toString()+"ttt"+session.getAttribute("endTime").toString()+"rrr"+session.getAttribute("name").toString());
        donAction.refreshList(session.getAttribute("beginTime").toString(),session.getAttribute("endTime").toString(),session.getAttribute("name").toString());
        session.setAttribute("haveData",null);
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
    <title>donList</title>
</head>
<script>

</script>
<body>
<p align="right">
    <button onclick="r()" type="button" class="btn-link">退出登录</button>
</p>
<label>当前余额为:<%=sumAction.getSum()%></label>
<form action="/getDonation">
    <label>选择起始时间：</label>
    <input id="getBeginTime" name="getBeginTime" type="date" class="form-control">
    <label>选择终止时间：</label>
    <input id="getEndTime" name="getEndTime" type="date" class="form-control">
    <label>选择捐赠人:</label>
    <select id="getName" name = "getName" class="form-control">
        <option value="">未选择</option>
    <%
        int x = 0;
        for (String s:donAction.getDoner()){
        %>
    <option value="<%=s%>"><%=s%></option>

    <%
        }
    %>
    </select>
    <p align="right">
    <button id="searchButton" name="searchButton" type="submit" class="btn-primary btn-lg" >搜索</button>
    </p>
</form>
<script>
    $(document).ready(function(){
        $('dataList').DataTable({ responsive: true});
    });
</script>




                            <table class="table table-striped " id="datalist">
                                <thead>
                                <tr>
                                    <th>捐赠人</th>
                                    <th>身份证</th>
                                    <th>捐赠金额</th>
                                    <th>日期</th>
                                </tr>
                                </thead>
                                <tbody>

                                <%
                                    int start = (cPage - 1) * pageSize + 1;
                                    int end = min((start + pageSize - 1),donAction.donList.size());
                                    int theCount = 0;
                                    for(donation d : donAction.donList)
                                    {
                                        theCount ++;
                                        if (theCount >= start && theCount <= end){
                                    %>
                                    <tr>
                                        <td><%=d.getName()%></td>
                                        <td><%=d.getIdCard()%></td>
                                        <td><%=d.getCount()%></td>
                                        <td><%=d.getTime()%></td>
                                    </tr>
                                    <%
                                        }

                                    }
                                %>
                                </tbody>
                            </table>

<%
    if (end < donAction.donList.size())
    {
        %>
<input type="button" value = "下一页" onclick="location.href='donList.jsp?page=<%=cPage+1%>'" class="btn-default">

<%
    }
%>
<%
  if (cPage > 1){


      %>

<input type="button" value = "上一页" onclick="location.href='donList.jsp?page=<%=cPage-1%>'" class="btn-default">
<%
    }

%>
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