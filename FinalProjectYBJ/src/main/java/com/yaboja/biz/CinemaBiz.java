package com.yaboja.biz;

import java.util.List;

import com.yaboja.dto.CinemaDto;

public interface CinemaBiz {
	
	public CinemaDto selectOne(int cinemaseq);
	public List<CinemaDto> selectList();
	public int getCinemaSeq(String cinema);
	public String getCinema(int cinemaseq);


	public List<CinemaDto> selectAll();
	public int insertCinema(CinemaDto cinemaDto);
	public int deleteCinema(int cinemaseq);
}
