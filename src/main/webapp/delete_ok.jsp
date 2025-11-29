<%--
  Created by IntelliJ IDEA.
  User: ahyun
  Date: 25. 11. 28.
  Time: 오전 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="wsd.cillah.jspcrud.dao.AccountDAO" %>

<%
    String idStr = request.getParameter("id");
    if(idStr != null && !idStr.equals("")){
        int id = Integer.parseInt(idStr);
        AccountDAO accountDAO = new AccountDAO();
        accountDAO.deleteAccount(id);
    }
    response.sendRedirect("list.jsp");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
