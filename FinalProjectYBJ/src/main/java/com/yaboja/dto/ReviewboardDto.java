package com.yaboja.dto;

import java.util.Date;

public class ReviewboardDto {

	private int reviewboardseq;

	// 작성자
	private int userseq;

	// 영화
	private int movietitle;

	// 제목
	private String reviewboardtitle;

	// 내용
	private String reviewboardcontent;

	// 날짜
	private Date reviewboarddate;

	// 조회수
	private int reviewboardview;

	public int getReviewboardseq() {
		return reviewboardseq;
	}

	public void setReviewboardseq(int reviewboardseq) {
		this.reviewboardseq = reviewboardseq;
	}

	public int getUserseq() {
		return userseq;
	}

	public void setUserseq(int userseq) {
		this.userseq = userseq;
	}

	public int getMovietitle() {
		return movietitle;
	}

	public void setMovietitle(int movietitle) {
		this.movietitle = movietitle;
	}

	public String getReviewboardtitle() {
		return reviewboardtitle;
	}

	public void setReviewboardtitle(String reviewboardtitle) {
		this.reviewboardtitle = reviewboardtitle;
	}

	public String getReviewboardcontent() {
		return reviewboardcontent;
	}

	public void setReviewboardcontent(String reviewboardcontent) {
		this.reviewboardcontent = reviewboardcontent;
	}

	public Date getReviewboarddate() {
		return reviewboarddate;
	}

	public void setReviewboarddate(Date reviewboarddate) {
		this.reviewboarddate = reviewboarddate;
	}

	public int getReviewboardview() {
		return reviewboardview;
	}

	public void setReviewboardview(int reviewboardview) {
		this.reviewboardview = reviewboardview;
	}

}
