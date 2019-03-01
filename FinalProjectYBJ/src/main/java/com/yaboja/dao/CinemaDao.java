package com.yaboja.dao;

import java.util.List;

import com.yaboja.dto.CinemaDto;

public interface CinemaDao {
	String namespace="cinema.";
	

	public List<CinemaDto> selectAll();

	public CinemaDto selectOne(int cinemaseq);
	public List<CinemaDto> selectList();
	public int getCinemaSeq(String cinema);
	public String getCinema(int cinemaseq);
	
	public int insertCinema(CinemaDto cinemaDto);
	public int deleteCinema(int cinemaseq);

}
