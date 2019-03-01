package com.yaboja.biz;

import java.util.List;

import com.yaboja.dto.Criteria;
import com.yaboja.dto.MovieDto;
import com.yaboja.dto.ReviewboardDto;

public interface MovieBiz {

	public List<MovieDto> selectPresentMovies();

	public List<MovieDto> selectEndMovies();

	public int[] insert();

	public MovieDto selectOne(int movieseq);
	public List<MovieDto> selectList();
	public int getMovieSeq(String movietitle);
	public String getMovieTitle(int movieseq);


	public MovieDto selectOneMovie(int movieSeq);

	public List<MovieDto> selectPreMovies();

	// 목록 + 페이징
	public List<MovieDto> listPage(Criteria cri);

	// 게시물 총 개수
	public int listCount();

}
