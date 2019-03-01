package com.yaboja.dto;

import java.util.Date;

public class MovieDto {

    // 영화번호 
    private int movieseq;

    // 영화제목 
    private String movietitle;

    // 평점 
    private String rating;

    // 장르 
    private String genre;

    // 상영시간 
    private String time;

    // 영화개봉날짜 
    private String pupdate;

    // 영화체크(예정/상영/종영) 
    private String moviestate;

    // 영화감독 
    private String director;

    // 출연배우 
    private String actor;

    // 이미지URL 
    private String imgurl;

    // 네이버코드 
    private String code;
    
    

    public MovieDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MovieDto(int movieseq, String movietitle, String rating, String genre, String time, String pupdate,
			String moviestate, String director, String actor, String imgurl, String code) {
		super();
		this.movieseq = movieseq;
		this.movietitle = movietitle;
		this.rating = rating;
		this.genre = genre;
		this.time = time;
		this.pupdate = pupdate;
		this.moviestate = moviestate;
		this.director = director;
		this.actor = actor;
		this.imgurl = imgurl;
		this.code = code;
	}

	public MovieDto(String movietitle, String rating, String genre, String time, String pupdate, String moviestate,
			String director, String actor, String imgurl, String code) {
		super();
		this.movietitle = movietitle;
		this.rating = rating;
		this.genre = genre;
		this.time = time;
		this.pupdate = pupdate;
		this.moviestate = moviestate;
		this.director = director;
		this.actor = actor;
		this.imgurl = imgurl;
		this.code = code;
	}

	public int getMovieseq() {
        return movieseq;
    }

    public void setMovieseq(int movieseq) {
        this.movieseq = movieseq;
    }

    public String getMovietitle() {
        return movietitle;
    }

    public void setMovietitle(String movietitle) {
        this.movietitle = movietitle;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getPupdate() {
        return pupdate;
    }

    public void setPupdate(String pupdate) {
        this.pupdate = pupdate;
    }

    public String getMoviestate() {
        return moviestate;
    }

    public void setMoviestate(String moviestate) {
        this.moviestate = moviestate;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getActor() {
        return actor;
    }

    public void setActor(String actor) {
        this.actor = actor;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

	@Override
	public String toString() {
		return "MovieDto [movieseq=" + movieseq + ", movietitle=" + movietitle + ", rating=" + rating + ", genre="
				+ genre + ", time=" + time + ", pupdate=" + pupdate + ", moviestate=" + moviestate + ", director="
				+ director + ", actor=" + actor + ", imgurl=" + imgurl + ", code=" + code + "]";
	}
    
}