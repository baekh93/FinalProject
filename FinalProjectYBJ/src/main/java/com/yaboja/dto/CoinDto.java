package com.yaboja.dto;

import java.util.Date;

public class CoinDto {

	 // 코인번호 
    private int coinseq;

    // 사용자 
    private int userseq;

    // 코인내역 
    private int coinlog;

    // 날짜 
    private Date coindate;
    
    private String coinstate;

    public String getCoinstate() {
		return coinstate;
	}

	public void setCoinstate(String coinstate) {
		this.coinstate = coinstate;
	}

	public int getCoinseq() {
        return coinseq;
    }

    public void setCoinseq(int coinseq) {
        this.coinseq = coinseq;
    }

    public int getUserseq() {
        return userseq;
    }

    public void setUserseq(int userseq) {
        this.userseq = userseq;
    }

    public int getCoinlog() {
        return coinlog;
    }

    public void setCoinlog(int coinlog) {
        this.coinlog = coinlog;
    }

    public Date getCoindate() {
        return coindate;
    }

    public void setCoindate(Date coindate) {
        this.coindate = coindate;
    }

}
