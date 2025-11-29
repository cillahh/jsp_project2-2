<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="wsd.cillah.jspcrud.dao.AccountDAO, java.util.*" %>
<%@ page import="wsd.cillah.jspcrud.bean.AccountVO" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가계부 - 목록</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
            max-width: 900px;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }
        .card-header {
            background-color: #4e73df; /* 입력 폼과 같은 파란색 */
            color: white;
            border-radius: 15px 15px 0 0 !important;
            padding: 20px;
            display: flex;
            justify-content: space-between; /* 타이틀과 버튼 양옆 배치 */
            align-items: center;
        }
        .table th {
            background-color: #f1f3f5;
            text-align: center;
        }
        .table td {
            vertical-align: middle;
            text-align: center;
        }
        /* 금액 부분은 오른쪽 정렬이 보기 좋음 */
        .text-amount {
            text-align: right !important;
            padding-right: 20px !important;
            font-weight: bold;
            color: #2c3e50;
        }
        .btn-delete {
            font-size: 0.8rem;
        }
    </style>

    <script>
        function delete_ok(id) {
            var a = confirm("정말로 이 내역을 삭제하시겠습니까?");
            if(a) {
                location.href = 'delete_ok.jsp?id=' + id;
            }
        }
    </script>
</head>
<body>

<%
    // 데이터 가져오기 로직
    AccountDAO accountDAO = new AccountDAO();
    List<AccountVO> list = accountDAO.getAccountList();
    request.setAttribute("list", list);
%>

<div class="container">
    <div class="card">
        <div class="card-header">
            <h3 class="mb-0 fw-bold">📋 거래 내역 목록</h3>
            <a href="write.jsp" class="btn btn-light text-primary fw-bold">
                + 내역 추가
            </a>
        </div>

        <div class="card-body">
            <c:if test="${empty list}">
                <div class="alert alert-warning text-center mt-3" role="alert">
                    저장된 거래 내역이 없습니다. 우측 상단 버튼을 눌러 추가해보세요!
                </div>
            </c:if>

            <c:if test="${!empty list}">
                <div class="table-responsive">
                    <table class="table table-hover table-bordered mb-0">
                        <thead>
                        <tr>
                            <th style="width: 5%">ID</th>
                            <th style="width: 15%">날짜</th>
                            <th style="width: 10%">유형</th>
                            <th style="width: 30%">적요 (내용)</th>
                            <th style="width: 15%">금액</th>
                            <th style="width: 15%">작성일</th>
                            <th style="width: 10%">관리</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="u">
                            <tr>
                                <td class="text-secondary small">${u.id}</td>
                                <td>${u.date}</td>
                                <td>
                                    <span class="badge bg-secondary">${u.category}</span>
                                </td>
                                <td class="text-start ps-4">${u.briefs}</td> <td class="text-amount">${u.amount}원</td>
                                <td class="small text-muted">${u.regdate}</td>
                                <td>
                                    <a href="javascript:delete_ok('${u.id}')" class="btn btn-danger btn-sm btn-delete">
                                        삭제
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </div>

    <div class="text-center mt-4 text-muted small">
        &copy; 2025 Financial Ledger Project
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>