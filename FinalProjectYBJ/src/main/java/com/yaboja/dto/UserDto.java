package com.yaboja.dto;

public class UserDto {

    // 사용자번호 
    private int userseq;

    // 아이디 
    private String userid;

    // 비밀번호 
    private String userpw;

    // 이름 
    private String username;

    // 프로필사진 
    private String userprofile;

    // 성별 
    private String usersex;

    // 연령대 
    private String userage;

    // 주소 
    private String useraddress;

    // 이메일 
    private String useremail;

    // 등록영화관1 
    private int usercinema1;

    // 등록영화관2 
    private int usercinema2;

    // 등록영화관3 
    private int usercinema3;

    // 등급 
    private String usergrade;

    public int getUserseq() {
        return userseq;
    }

    public void setUserseq(int userseq) {
        this.userseq = userseq;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getUserpw() {
        return userpw;
    }

    public void setUserpw(String userpw) {
        this.userpw = userpw;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserprofile() {
        return userprofile;
    }

    public void setUserprofile(String userprofile) {
        this.userprofile = userprofile;
    }

    public String getUsersex() {
        return usersex;
    }

    public void setUsersex(String usersex) {
        this.usersex = usersex;
    }

    public String getUserage() {
        return userage;
    }

    public void setUserage(String userage) {
        this.userage = userage;
    }

    public String getUseraddress() {
        return useraddress;
    }

    public void setUseraddress(String useraddress) {
        this.useraddress = useraddress;
    }

    public String getUseremail() {
        return useremail;
    }

    public void setUseremail(String useremail) {
        this.useremail = useremail;
    }

    public int getUsercinema1() {
        return usercinema1;
    }

    public void setUsercinema1(int usercinema1) {
        this.usercinema1 = usercinema1;
    }

    public int getUsercinema2() {
        return usercinema2;
    }

    public void setUsercinema2(int usercinema2) {
        this.usercinema2 = usercinema2;
    }

    public int getUsercinema3() {
        return usercinema3;
    }

    public void setUsercinema3(int usercinema3) {
        this.usercinema3 = usercinema3;
    }

    public String getUsergrade() {
        return usergrade;
    }

    public void setUsergrade(String usergrade) {
        this.usergrade = usergrade;
    }

	@Override
	public String toString() {
		return "UserDto [userseq=" + userseq + ", userid=" + userid + ", userpw=" + userpw + ", username=" + username + ", userprofile=" + userprofile + ", usersex=" + usersex + ", userage=" + userage + ", useraddress=" + useraddress + ", useremail=" + useremail + ", usercinema1=" + usercinema1 + ", usercinema2=" + usercinema2 + ", usercinema3=" + usercinema3 + ", usergrade=" + usergrade + "]";
	}
    
}
