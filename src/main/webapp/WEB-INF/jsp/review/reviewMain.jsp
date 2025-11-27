<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>

<!DOCTYPE html>
<html>
<head>
    <title>Review Board</title>
    <link rel="stylesheet" href="../css/jpetstore.css" />
</head>

<body>

<div id="Content">

    <!-- 페이지 제목 -->
    <h2>Review Board</h2>
    <p>입양 후기, 사료 추천, 관리 팁 등 다양한 경험을 공유해보세요.</p>

    <br/>

    <!-- 리뷰 작성 버튼 -->
    <stripes:link beanclass="org.mybatis.jpetstore.web.actions.ReviewActionBean" event="writeReviewForm">
        <button style="padding: 6px 12px; font-size: 14px;">✏️ 리뷰 작성하기</button>
    </stripes:link>

    <br/><br/>

    <!-- 리뷰 목록 테이블 기본 구조 -->
    <table class="table">
        <tr>
            <th>번호</th>
            <th>작성자</th>
            <th>반려동물</th>
            <th>내용 요약</th>
            <th>감정</th>
            <th>등록일</th>
        </tr>

        <!-- 리뷰 데이터 반복 렌더링 (추후 List 넣으면 자동 표시됨) -->
        <c:forEach var="review" items="${reviewList}">
            <tr>
                <td>${review.id}</td>
                <td>${review.author}</td>
                <td>${review.petType}</td>
                <td>
                    <stripes:link beanclass="org.mybatis.jpetstore.web.actions.ReviewActionBean" event="viewReviewDetail">
                        <stripes:param name="reviewId" value="${review.id}" />
                        ${review.summary}
                    </stripes:link>
                </td>
                <td>${review.sentiment}</td>
                <td>${review.createdDate}</td>
            </tr>
        </c:forEach>

        <!-- 리스트가 없을 때 -->
        <c:if test="${empty reviewList}">
            <tr>
                <td colspan="6" style="text-align:center; padding:10px;">
                    등록된 리뷰가 없습니다.
                </td>
            </tr>
        </c:if>

    </table>

</div>

</body>
</html>
