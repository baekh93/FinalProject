package com.yaboja.dto;

import java.util.Date;

public class ReviewboardcomentDto {

	// 후기게시판 댓글번 
    private int reviewboardcomentseq;

    // 후기게시판 번호 
    private int reviewboardseq;

    // 작성자 
    private String username;

    // 내용 
    private String reviewboardcomentcontent;

    // 날짜 
    private Date reviewboardcomentdate;
    
    private int userseq;

    public int getUserseq() {
		return userseq;
	}

	public void setUserseq(int userseq) {
		this.userseq = userseq;
	}

	public int getReviewboardcomentseq() {
        return reviewboardcomentseq;
    }

    public void setReviewboardcomentseq(int reviewboardcomentseq) {
        this.reviewboardcomentseq = reviewboardcomentseq;
    }

    public int getReviewboardseq() {
        return reviewboardseq;
    }

    public void setReviewboardseq(int reviewboardseq) {
        this.reviewboardseq = reviewboardseq;
    }


    public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getReviewboardcomentcontent() {
        return reviewboardcomentcontent;
    }

    public void setReviewboardcomentcontent(String reviewboardcomentcontent) {
        this.reviewboardcomentcontent = reviewboardcomentcontent;
    }

    public Date getReviewboardcomentdate() {
        return reviewboardcomentdate;
    }

    public void setReviewboardcomentdate(Date reviewboardcomentdate) {
        this.reviewboardcomentdate = reviewboardcomentdate;
    }
}
