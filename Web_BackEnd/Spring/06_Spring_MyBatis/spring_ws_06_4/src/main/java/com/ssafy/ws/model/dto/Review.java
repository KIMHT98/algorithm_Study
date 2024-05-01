package com.ssafy.ws.model.dto;

public class Review {
	/** 리뷰 ID */
	private int reviewId;
	/** 맛집 ID */
	private int resId;
	/** 작성자 */
	private String writer;
	/** 내용 */
	private String content;

	public Review() {
		super();
	}

	public Review(int reviewId, int resId, String writer, String content) {
		super();
		this.reviewId = reviewId;
		this.resId = resId;
		this.writer = writer;
		this.content = content;
	}

	public Review(String writer, String content) {
		this.writer = writer;
		this.content = content;
	}

	/** 댓글 번호를 반환하는 getter */
	public int getReviewId() {
		return reviewId;
	}

	/** 댓글 번호를 설정하는 Setter */
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	/** 맛집 Id를 반환하는 getter */
	public int getResId() {
		return resId;
	}

	/** 맛집 Id를 설정하는 Setter */
	public void setResId(int resId) {
		this.resId = resId;
	}

	/** 작성자 이름을 반환하는 getter */
	public String getWriter() {
		return writer;
	}

	/** 작성자 이름을 설정하는 Setter */
	public void setWriter(String writer) {
		this.writer = writer;
	}

	/** 리뷰 내용을 반환하는 getter */
	public String getContent() {
		return content;
	}

	/** 리뷰 내용을 설정하는 Setter */
	public void setContent(String content) {
		this.content = content;
	}

	/** 리뷰의 정보를 문자열로 반환하는 메소드 */
	@Override
	public String toString() {
		return "Review [reviewId=" + reviewId + ", resId=" + resId + ", writer=" + writer + ", content=" + content
				+ "]";
	}

}
