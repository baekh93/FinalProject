package com.yaboja.dto;

import java.util.Date;

public class MoviecomentDto {

	// 영화게시판 글번호 
    private int moviecomentseq;

    // 영화번호 
    private int movieseq;

    // 작성자 
    private int userseq;

    // 내용 
    private String moviecomentcontent;

    // 날짜 
    private Date moviecomentdate;
    
    private String username;

    public int getMoviecomentseq() {
        return moviecomentseq;
    }

	public int getMovieseq() {
		return movieseq;
	}

	public void setMovieseq(int movieseq) {
		this.movieseq = movieseq;
	}

	public int getUserseq() {
		return userseq;
	}

	public void setUserseq(int userseq) {
		this.userseq = userseq;
	}

	public String getMoviecomentcontent() {
		return moviecomentcontent;
	}

	public void setMoviecomentcontent(String moviecomentcontent) {
		this.moviecomentcontent = moviecomentcontent;
	}

	public Date getMoviecomentdate() {
		return moviecomentdate;
	}

	public void setMoviecomentdate(Date moviecomentdate) {
		this.moviecomentdate = moviecomentdate;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setMoviecomentseq(int moviecomentseq) {
		this.moviecomentseq = moviecomentseq;
	}

   
}
