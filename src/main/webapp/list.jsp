<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ahyun
  Date: 25. 11. 28.
  Time: 오전 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="wsd.cillah.jspcrud.dao.AccountDAO, java.util.*" %>
<%@ page import="wsd.cillah.jspcrud.bean.AccountVO" %>

<% request.setCharacterEncoding("utf-8"); %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    AccountDAO accountDAO = new AccountDAO();
    List<AccountVO> list = accountDAO.getAccountList();
    request.setAttribute("list",list);
%>
<table id="list" style="width:100%">

    <tr>
        <th>Id</th>
        <th>일자</th>
        <th>항목</th>
        <th>적요</th>
        <th>금액</th>
        <th>작성일</th>
    </tr>
    <c:forEach items="${list}" var="u">
        <tr>
            <td>${u.id}</td>
            <td>${u.date}</td>
            <td>${u.category}</td>
            <td>${u.briefs}</td>
            <td>${u.amount}</td>
            <td>${u.regdate}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
