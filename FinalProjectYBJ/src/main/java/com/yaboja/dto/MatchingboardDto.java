package com.yaboja.dto;

import java.util.Date;

public class MatchingboardDto {

	 // 매칭 게시 번호 
    private int matchingboard;

    // 영화 
    private int movieseq;

    // 작성자 
    private int userseq;

    // 제목 
    private String matchingboardtitle;

    // 내용 
    private String matchingboardcontent;

    // 날짜 
    private Date matchingboarddate;

    // 영화관 
    private int cinemaseq;
    

//    // 성별 
//    private String usersex;
//
//    // 프로필사진 
//    private String userprofile;
    
    public MatchingboardDto() {
    	super();
        }
    
    public MatchingboardDto(int username, int movieseq, int userseq, String matchingboardtitle,
    		String matchingboardcontent, Date matchingboarddate, int cinemaseq) {
    	super();
    	
    	this.movieseq = movieseq;
    	this.userseq = userseq;
    	this.matchingboardtitle = matchingboardtitle;
    	this.matchingboardcontent = matchingboardcontent;
    	this.matchingboarddate = matchingboarddate;
    	this.cinemaseq = cinemaseq;
    }
    
	public MatchingboardDto(String matchingboardtitle, Date matchingboarddate) {
		super();
		this.matchingboardtitle = matchingboardtitle;
		this.matchingboarddate = matchingboarddate;
	}

	public int getMatchingboard() {
        return matchingboard;
    }

	public void setMatchingboard(int matchingboard) {
        this.matchingboard = matchingboard;
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

    public String getMatchingboardtitle() {
        return matchingboardtitle;
    }

    public void setMatchingboardtitle(String matchingboardtitle) {
        this.matchingboardtitle = matchingboardtitle;
    }

    public String getMatchingboardcontent() {
        return matchingboardcontent;
    }

    public void setMatchingboardcontent(String matchingboardcontent) {
        this.matchingboardcontent = matchingboardcontent;
    }

    public Date getMatchingboarddate() {
        return matchingboarddate;
    }

    public void setMatchingboarddate(Date matchingboarddate) {
        this.matchingboarddate = matchingboarddate;
    }

    public int getCinemaseq() {
        return cinemaseq;
    }

    public void setCinemaseq(int cinemaseq) {
        this.cinemaseq = cinemaseq;
    }

//    public String getUsersex() {
//        return usersex;
//    }
//
//    public void setUsersex(String usersex) {
//        this.usersex = usersex;
//    }
//
//    public String getUserprofile() {
//        return userprofile;
//    }
//
//    public void setUserprofile(String userprofile) {
//        this.userprofile = userprofile;
//    }
}
