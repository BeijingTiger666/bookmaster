<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String appPath = request.getContextPath().getContextPath().getContextPath(); %>
<html>
<head>
    <title>图书列表</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="<%=appPath%>/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    HiSEN <small>图书管理系统 - by ssm基础框架</small>
                </h1>
            </div>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <ul class="nav nav-tabs">
                <li class="active"><a href="<%=appPath%>/book/list">首页</a></li>
                <li><a href="#">图书具体信息</a></li>
                <li><a href="#">添加图书信息</a></li>
                <li class="disabled"><a href="#">信息</a></li>
            </ul>
        </div>
    </div>
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>图书列表 <small>显示当前图书库存信息</small></h1>
            </div>
        </div>
    </div>
    <div class="row clearfix">

        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>图书编号</th>
                    <th>图书名字</th>
                    <th>图书数量</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="book" items="${requestScope.get('list')}" varStatus="status">
                    <tr>
                        <td>${book.bookid}</td>
                        <td>${book.bookname}</td>
                        <td>${book.number}</td>
                        <td>
                            <a href="#">详情</a> |
                            <a href="<#">删除</a>
                        </td>

                    </tr>
                </c:forEach>
                </tbody>
            </table>
<%--分页导航条--%>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <c:if test="${pageInfo.isFirstPage}">
                        <li class="disabled">
                            <span>
                                <span aria-hidden="true">首页</span>
                            </span>
                        </li>
                    </c:if>
                    <c:if test="${not pageInfo.isFirstPage}">
                        <li>
                            <a href="<%=appPath%>/book/list/?pageNum=1&pageSize=10"  >
                                <span aria-hidden="true">首页</span>
                            </a>
                        </li>
                    </c:if>

                    <c:if test="${pageInfo.isFirstPage}">
                        <li class="disabled">
                            <span>
                                <span aria-hidden="true">&laquo;</span>
                            </span>
                        </li>
                    </c:if>
                    <c:if test="${not pageInfo.isFirstPage}">
                        <li>
                            <a href="<%=appPath%>/book/list/?pageNum=${pageInfo.pageNum - 1}&pageSize=10"  >
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:if test="${pageInfo.pages <= 5}">
                        <c:forEach var="num" begin="${1}" end="${pageInfo.pages}">
                                <li   <c:if test="${pageInfo.pageNum == num}"> class="active" </c:if>>
                                    <a href="<%=appPath%>/book/list/?pageNum=${num}&pageSize=10"  >${num }</a>
                                </li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${pageInfo.pages > 5}">
                        <c:if test="${pageInfo.pageNum <= 3}">
                            <c:forEach var="num" begin="${1}" end="${5}">
                                <li   <c:if test="${pageInfo.pageNum == num}"> class="active" </c:if>>
                                    <a href="<%=appPath%>/book/list/?pageNum=${num}&pageSize=10">${num }</a>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${pageInfo.pageNum > 3 and pageInfo.pageNum <= pageInfo.pages - 2}">
                            <c:forEach var="num" begin="${pageInfo.pageNum - 2}" end="${pageInfo.pageNum + 2}">
                                <li   <c:if test="${pageInfo.pageNum == num}"> class="active" </c:if>>
                                    <a href="<%=appPath%>/book/list/?pageNum=${num}&pageSize=10">${num }</a>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${pageInfo.pageNum > pageInfo.pages - 2}">
                            <c:forEach var="num" begin="${pageInfo.pages - 4}" end="${pageInfo.pages}">
                                <li   <c:if test="${pageInfo.pageNum == num}"> class="active" </c:if>>
                                    <a href="<%=appPath%>/book/list/?pageNum=${num}&pageSize=10">${num }</a>
                                </li>
                            </c:forEach>
                        </c:if>
                    </c:if>

                    <c:if test="${pageInfo.isLastPage}">
                        <li class="disabled">
                            <span>
                                <span aria-hidden="true">&raquo;</span>
                            </span>
                        </li>
                    </c:if>
                    <c:if test="${not pageInfo.isLastPage}">
                        <li>
                            <a href="<%=appPath%>/book/list/?pageNum=${pageInfo.pageNum + 1}&pageSize=10"  >
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:if test="${pageInfo.isLastPage}">
                        <li class="disabled">
                            <span>
                                <span aria-hidden="true">末页</span>
                            </span>
                        </li>
                    </c:if>
                    <c:if test="${not pageInfo.isLastPage}">
                        <li>
                            <a href="<%=appPath%>/book/list/?pageNum=${pageInfo.pages}&pageSize=10"  >
                                <span aria-hidden="true">末页</span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>

        </div>
    </div>
</div>

<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="<%=appPath%>/js/jquery-1.4.4.min.js"></script>
<script src="<%=appPath%>/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>