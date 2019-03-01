package com.yaboja.dto;

public class CinemaDto {

	 // 영화관번 
    private int cinemaseq;

    // 영화관 
    private String cinema;

	// 위도 
    private String latitude;

    // 경도 
    private String longitude;
    
   
    
    public CinemaDto() {
    	
    }

    public int getCinemaseq() {
        return cinemaseq;
    }
    
    

    public CinemaDto(int cinemaseq, String cinema, String latitude, String longitude) {
		super();
		this.cinemaseq = cinemaseq;
		this.cinema = cinema;
		this.latitude = latitude;
		this.longitude = longitude;
	}
    
    



	public CinemaDto(String cinema, String latitude, String longitude) {
		super();
		this.cinema = cinema;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public void setCinemaseq(int cinemaseq) {
        this.cinemaseq = cinemaseq;
    }

    public String getCinema() {
        return cinema;
    }

    public void setCinema(String cinema) {
        this.cinema = cinema;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }
    
    
}
