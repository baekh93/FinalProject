package com.yaboja.dao;

import java.util.List;
import java.util.Map;

import com.yaboja.dto.Criteria;
import com.yaboja.dto.MovieDto;
import com.yaboja.dto.ReviewboardDto;
import com.yaboja.dto.SearchCriteria;

public interface ReviewboardDao {
	String namespace = "reviewboard.";
	public List<ReviewboardDto> selectList();
	public List<MovieDto> movieList();
	public MovieDto getmovietitle(String movietitle);
	public MovieDto getMovie(Map<String,String> map);
	public ReviewboardDto selectOne(int reviewboardseq);
	public int insert(ReviewboardDto dto);
	public int update(ReviewboardDto dto);
	public int delete(int reviewboardseq);
	public int viewupdate(int reviewboardseq);

	// 수호 추가
	public MovieDto selectOne1(int movieseq);

	// 목록 + 페이징
	public List<ReviewboardDto> listPage(Criteria cri);

	// 겟시물 총 갯수
	public int listCount();

	// 진선쓰 토탈 카운트
	public int listCount1();

	// 목록 + 페이징 + 검색 MovieDto
	public List<MovieDto> listSearch(SearchCriteria scri);

	// 검색 결과 갯수 MovieDto
	public int countSearch(SearchCriteria scri);

}
