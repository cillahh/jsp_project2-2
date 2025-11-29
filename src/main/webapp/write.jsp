<%--
  Created by IntelliJ IDEA.
  User: ahyun
  Date: 25. 11. 28.
  Time: 오전 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h3>거래 내역 추가</h3>
<form action="write_ok.jsp" method="post">
    <p>일자 <br/>
    <input type="date" name="date_str"/></p>
    <p>유형<br/>
    <select name="category">
        <option value="수입">수입</option>
        <option value="고정비">고정비</option>
        <option value="변동비">변동비</option>
        <option value="저축">저축</option>
    </select></p>
    <p>적요<br/>
    <input type="text" name="briefs"/></p>
    <p>금액<br/>
    <input type="number" name="amount"/></p>

    <input type="submit" value="추가">
</form>

</body>
</html>
