<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld" %>

<!DOCTYPE html>
<html>
<head>
    <title>Write Review</title>
    <link rel="stylesheet" href="../css/jpetstore.css" />
</head>

<body>

<div id="Content">

    <h2>리뷰 작성</h2>
    <p>입양 후기, 사료 추천, 관리 팁 등 자유롭게 작성해주세요.</p>

    <br/>

    <stripes:form
            beanclass="org.mybatis.jpetstore.web.actions.ReviewActionBean"
            method="post"
            event="submitReview">

        <!-- 작성자 -->
        <label><strong>작성자</strong></label><br/>
        <stripes:text name="author" size="40" /><br/><br/>

        <!-- 반려동물 종류 -->
        <label><strong>반려동물 종류</strong></label><br/>
        <stripes:select name="petType">
            <stripes:option value="DOG">강아지</stripes:option>
            <stripes:option value="CAT">고양이</stripes:option>
            <stripes:option value="BIRD">새</stripes:option>
            <stripes:option value="FISH">물고기</stripes:option>
            <stripes:option value="REPTILE">파충류</stripes:option>
            <stripes:option value="OTHER">기타</stripes:option>
        </stripes:select>
        <br/><br/>

        <!-- 후기 본문 -->
        <label><strong>후기 내용</strong></label><br/>
        <stripes:textarea name="content" cols="60" rows="10"></stripes:textarea>
        <br/><br/>

        <!-- 제출 버튼 -->
        <stripes:submit value="등록하기" />
        <stripes:reset value="다시작성" />

    </stripes:form>

</div>

</body>
</html>
