<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/IncludeTop.jsp"%>

<style>
    .section { margin: 20px 0; padding: 15px; border: 1px solid #ddd; }
    .hidden { display: none; }
    .btn { padding: 6px 12px; background: #4CAF50; color: white; border: none; cursor: pointer; }
    .btn-secondary { background: #aaa; }
    .review-card { border: 1px solid #ccc; padding: 10px; margin-bottom: 10px; }
</style>

<div style="margin-bottom: 20px;">
    <button class="btn" onclick="showWrite()">리뷰 작성하기</button>
    <button class="btn btn-secondary" onclick="showList()">리뷰 목록</button>
</div>

<div id="reviewWriteSection" class="section hidden">
    <h2>리뷰 작성</h2>
    <form id="reviewForm">
        <p>작성자 <input type="text" name="author" required /></p>
        <p>반려동물 종류:
            <select name="petType">
                <option value="DOG">강아지</option>
                <option value="CAT">고양이</option>
                <option value="ETC">기타</option>
            </select>
        </p>
        <p>내용 작성:</p>
        <textarea name="content" rows="5" cols="50" required></textarea>

        <p><button type="submit" class="btn">등록하기</button></p>
    </form>
</div>

<div id="reviewListSection" class="section">
    <h2>리뷰 목록</h2>

    <div class="review-card">
        <strong>작성자</strong> 예시<br/>
        <strong>종류:</strong> 고양이<br/>
        <strong>요약:</strong> 고양이에 대한 예시 리뷰입니다.<br/>
        <strong>감정:</strong> 매우 긍정
    </div>

    <div class="review-card">
        <strong>작성자</strong> 홍길동<br/>
        <strong>종류:</strong> 강아지<br/>
        <strong>요약:</strong> 산책과 건강 관리가 중요합니다.<br/>
        <strong>감정:</strong> 보통
    </div>

</div>

<div id="reviewDetailSection" class="section hidden">
    <h2>리뷰 상세</h2>
    <p id="detailContent">리뷰 상세 내용 영역</p>
    <button class="btn btn-secondary" onclick="showList()">목록으로</button>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>

<script>
    function showWrite() {
        document.getElementById("reviewWriteSection").classList.remove("hidden");
        document.getElementById("reviewListSection").classList.add("hidden");
        document.getElementById("reviewDetailSection").classList.add("hidden");
    }

    function showList() {
        document.getElementById("reviewWriteSection").classList.add("hidden");
        document.getElementById("reviewListSection").classList.remove("hidden");
        document.getElementById("reviewDetailSection").classList.add("hidden");
    }

    function showDetail() {
        document.getElementById("reviewWriteSection").classList.add("hidden");
        document.getElementById("reviewListSection").classList.add("hidden");
        document.getElementById("reviewDetailSection").classList.remove("hidden");
    }
</script>
