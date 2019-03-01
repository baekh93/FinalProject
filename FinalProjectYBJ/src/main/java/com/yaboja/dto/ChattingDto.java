package com.yaboja.dto;

import java.util.Date;

public class ChattingDto {
	// 채팅번호 
    private int chatseq;

    // 사용자1 
    private int userseq1;

    // 사용자2 
    private int userseq2;

    // 채팅내용 
    private String chatcontent;

    // 날짜 
    private Date chattime;

    // 수신확인 
    private int chatread;

    public int getChatseq() {
        return chatseq;
    }

    public void setChatseq(int chatseq) {
        this.chatseq = chatseq;
    }

    public int getUserseq1() {
        return userseq1;
    }

    public void setUserseq1(int userseq1) {
        this.userseq1 = userseq1;
    }

    public int getUserseq2() {
        return userseq2;
    }

    public void setUserseq2(int userseq2) {
        this.userseq2 = userseq2;
    }

    public String getChatcontent() {
        return chatcontent;
    }

    public void setChatcontent(String chatcontent) {
        this.chatcontent = chatcontent;
    }

    public Date getChattime() {
        return chattime;
    }

    public void setChattime(Date chattime) {
        this.chattime = chattime;
    }

    public int getChatread() {
        return chatread;
    }

    public void setChatread(int chatread) {
        this.chatread = chatread;
    }
}
