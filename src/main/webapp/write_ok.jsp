<%--
  Created by IntelliJ IDEA.
  User: ahyun
  Date: 25. 11. 29.
  Time: 오후 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="wsd.cillah.jspcrud.dao.AccountDAO" %>

<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="u" class="wsd.cillah.jspcrud.bean.AccountVO" />
<jsp:setProperty name="u" property="*"/>

<%
    String dateStr = request.getParameter("reg_date_str");
    if(dateStr != null && !dateStr.equals("")) {
        // "2025-11-29"문자열을 java.sql.Date로 변환
        java.sql.Date date = java.sql.Date.valueOf(dateStr);
        u.setDate(date);
    }
    AccountDAO accountDAO = new AccountDAO();
    int i = accountDAO.insertAccount(u);
    String msg = "데이터 추가 성공 !";
    if(i==0) msg = "[error] 데이터 추가";
%>
<script language="JavaScript">
    alert('<%=msg%>');
    location.href='list.jsp';
</script>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
