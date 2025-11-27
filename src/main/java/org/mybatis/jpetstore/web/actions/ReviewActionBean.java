package org.mybatis.jpetstore.web.actions;

import net.sourceforge.stripes.action.*;
import net.sourceforge.stripes.validation.Validate;
import net.sourceforge.stripes.validation.LocalizableError;

import java.util.ArrayList;
import java.util.List;

@UrlBinding("/actions/Review.action")
public class ReviewActionBean implements ActionBean {

    private ActionBeanContext context;

    // ⭐ 임시 저장용 리스트 (DB 연결 전까지 사용)
    private static final List<ReviewData> reviewList = new ArrayList<>();

    // ⭐ 폼에서 전달받는 값들
    @Validate(required = true, on = "submitReview")
    private String author;

    @Validate(required = true, on = "submitReview")
    private String petType;

    @Validate(required = true, on = "submitReview")
    private String content;

    // Getter/Setter
    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public String getPetType() { return petType; }
    public void setPetType(String petType) { this.petType = petType; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    // 리뷰 목록 Getter (jsp에서 ${reviewList}로 접근 가능)
    public List<ReviewData> getReviewList() {
        return reviewList;
    }

    @Override
    public void setContext(ActionBeanContext context) {
        this.context = context;
    }

    @Override
    public ActionBeanContext getContext() {
        return context;
    }

    // ⭐ Review 메인 페이지
    @DefaultHandler
    public Resolution viewReviewMain() {
        return new ForwardResolution("/WEB-INF/jsp/review/reviewMain.jsp");
    }

    // ⭐ 리뷰 작성 페이지로 이동
    public Resolution writeReviewForm() {
        return new ForwardResolution("/WEB-INF/jsp/review/writeReviewForm.jsp");
    }

    // ⭐ 리뷰 제출 처리 → 메인 페이지로 이동
    public Resolution submitReview() {

        // 1) 리뷰 생성 및 임시 저장
        ReviewData newReview = new ReviewData(
                reviewList.size() + 1,  // id 자동 증가
                author,
                petType,
                content,
                "미분석",      // 감정 분석 결과 자리
                "2025-01-01"  // 등록일 (임시)
        );

        reviewList.add(newReview);

        // 2) 리뷰 목록 페이지로 이동
        return new RedirectResolution("/actions/Review.action");
    }

    // ⭐ 내부에서 사용하는 임시 리뷰 DTO 클래스
    public static class ReviewData {
        public int id;
        public String author;
        public String petType;
        public String summary;
        public String sentiment;
        public String createdDate;

        public ReviewData(int id, String author, String petType, String summary, String sentiment, String createdDate) {
            this.id = id;
            this.author = author;
            this.petType = petType;
            this.summary = summary;
            this.sentiment = sentiment;
            this.createdDate = createdDate;
        }
    }
}
