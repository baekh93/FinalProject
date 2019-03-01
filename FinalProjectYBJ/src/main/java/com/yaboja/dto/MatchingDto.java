package com.yaboja.dto;

import java.util.Date;

public class MatchingDto {

	// 매칭 번호 
    private int matchingseq;

    // 사용자1_작성 
    private int matchingwriter;

    // 사용자2_신청 
    private int matchingapplicant;

    // 매칭 상 
    private String matchingstate;

    // 작성자알림 
    private int writernotice;

    // 신청자알림 
    private int applicantnotice;

    // 날짜 
    private Date matchingdate;

    // 선택 체크
    private String selectedapplicant;
    
    private int cinemaseq;
    
    private int movieseq;

    
	public int getCinemaseq() {
		return cinemaseq;
	}

	public void setCinemaseq(int cinemaseq) {
		this.cinemaseq = cinemaseq;
	}

	public int getMovieseq() {
		return movieseq;
	}

	public void setMovieseq(int movieseq) {
		this.movieseq = movieseq;
	}

	public int getMatchingseq() {
		return matchingseq;
	}

	public void setMatchingseq(int matchingseq) {
		this.matchingseq = matchingseq;
	}

	public int getMatchingwriter() {
		return matchingwriter;
	}

	public void setMatchingwriter(int matchingwriter) {
		this.matchingwriter = matchingwriter;
	}

	public int getMatchingapplicant() {
		return matchingapplicant;
	}

	public void setMatchingapplicant(int matchingapplicant) {
		this.matchingapplicant = matchingapplicant;
	}

	public String getMatchingstate() {
		return matchingstate;
	}

	public void setMatchingstate(String matchingstate) {
		this.matchingstate = matchingstate;
	}

	public int getWriternotice() {
		return writernotice;
	}

	public void setWriternotice(int writernotice) {
		this.writernotice = writernotice;
	}

	public int getApplicantnotice() {
		return applicantnotice;
	}

	public void setApplicantnotice(int applicantnotice) {
		this.applicantnotice = applicantnotice;
	}

	public Date getMatchingdate() {
		return matchingdate;
	}

	public void setMatchingdate(Date matchingdate) {
		this.matchingdate = matchingdate;
	}

	public String getSelectedapplicant() {
		return selectedapplicant;
	}

	public void setSelectedapplicant(String selectedapplicant) {
		this.selectedapplicant = selectedapplicant;
	}

    
}
