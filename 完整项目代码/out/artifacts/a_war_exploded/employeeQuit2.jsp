<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page  import="com.entity.*" %>
<%@ page  import="com.dao.*" %>
<%@page import="java.util.*" %>
<html>
<head>
    <title>部门管理页面</title>
</head>
<body>
<div class="hrms_quit_container">
    <!-- 导航栏-->
    <%@ include file="./commom/head2.jsp"%>


    <!-- 中间部分（左侧栏+表格内容） -->
    <div class="hrms_quit_body">
        <!-- 左侧栏 -->
        <%@ include file="./commom/leftsidebar2.jsp"%>

        <!-- 部门表格内容 -->
        <div class="dept_info col-sm-10">
            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li class="active">离职信息</li>
                    </ol>
                </div>
                <!-- Table -->
                <table class="table table-bordered table-hover" id="quit_table">
                    <thead>
                        <th>员工编号</th>
                        <th>离职原因</th>
                        <th>离职日期</th>
                    </thead>
                    <tbody>
                       <%turnover_employeeDao ud = new turnover_employeeDaoImpl();
		                List<turnover_employee> userAll = ud.getTurnover_employeeAll();
		                request.setAttribute("userAll", userAll);
		                %>
                        <c:forEach items="${userAll}" var="quit">
                            <tr>
                                <td>${quit.eid}</td>
                                <td>${quit.elseason}</td>
                                <td>${quit.eldate}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div><!-- /.panel panel-success -->
        </div><!-- /.dept_info -->
    </div><!-- /.hrms_dept_body -->

    <%@ include file="employeeQuitAdd.jsp"%>
    <%@ include file="employeeQuitUpdate.jsp"%>

    <!-- 尾部-->
    <%@ include file="./commom/foot.jsp"%>

</div><!-- /.hrms_dept_container -->
</body>
</html>
