<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가계부 - 거래 내역 추가</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #f8f9fa; /* 배경을 연한 회색으로 */
        }
        .form-container {
            max-width: 600px; /* 폼이 너무 넓어지지 않게 제한 */
            margin-top: 50px;
        }
        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1); /* 부드러운 그림자 */
        }
        .card-header {
            background-color: #4e73df; /* 메인 컬러 (파란색 계열) */
            color: white;
            border-radius: 15px 15px 0 0 !important;
            padding: 20px;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container form-container">
    <div class="card">
        <div class="card-header">
            <h3 class="mb-0 fw-bold">💸 거래 내역 추가</h3>
            <p class="mb-0 small text-white-50">새로운 수입/지출 내역을 입력하세요.</p>
        </div>

        <div class="card-body p-4">
            <form action="write_ok.jsp" method="post">

                <div class="mb-3">
                    <label for="date_str" class="form-label fw-bold">거래 일자</label>
                    <input type="date" class="form-control" id="date_str" name="date_str" required>
                </div>

                <div class="mb-3">
                    <label for="category" class="form-label fw-bold">유형</label>
                    <select class="form-select" id="category" name="category">
                        <option value="수입">💰 수입</option>
                        <option value="고정비">📉 고정비 (월세, 통신비 등)</option>
                        <option value="변동비">🛒 변동비 (식비, 쇼핑 등)</option>
                        <option value="저축">🏦 저축</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="briefs" class="form-label fw-bold">적요 (내용)</label>
                    <input type="text" class="form-control" id="briefs" name="briefs" placeholder="예: 점심 식사 (스타벅스)" required>
                </div>

                <div class="mb-4">
                    <label for="amount" class="form-label fw-bold">금액</label>
                    <div class="input-group">
                        <input type="number" class="form-control" id="amount" name="amount" placeholder="금액을 입력하세요" required>
                        <span class="input-group-text">원</span>
                    </div>
                </div>

                <div class="d-grid gap-2">
                    <button type="submit" class="btn btn-primary btn-lg">추가하기</button>
                    <a href="list.jsp" class="btn btn-outline-secondary">목록으로 돌아가기</a>
                </div>

            </form>
        </div>
    </div>

    <div class="text-center mt-4 text-muted small">
        &copy; 2025 Financial Ledger Project
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>