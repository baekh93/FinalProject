package com.yaboja.biz;

import java.util.List;
import java.util.Map;

import com.yaboja.dto.Criteria;
import com.yaboja.dto.MovieDto;
import com.yaboja.dto.ReviewboardDto;
import com.yaboja.dto.SearchCriteria;

public interface ReviewboardBiz {

	// 진선 추가
	public List<MovieDto> movieList();

	// 영화제목얻어오기
	public MovieDto getmovietitle(String movietitle);
	public MovieDto getMovie(Map<String, String> map);

	// 진선 추가
	public MovieDto selectOne1(int movieseq);

	public List<ReviewboardDto> selectList();

	public ReviewboardDto selectOne(int reviewboardseq);

	public int insert(ReviewboardDto dto);

	public int update(ReviewboardDto dto);

	public int delete(int reviewboardseq);

	public int viewupdate(int reviewboardseq);

	// 목록 + 페이징
	public List<ReviewboardDto> listPage(Criteria cri);

	// 게시물 총 개수
	public int listCount();

	// 진선쓰 페이징 토탈카운트
	public int listCount1();

	// 목록 + 페이징 + 검색
	public List<MovieDto> listSearch(SearchCriteria scri);

	// 검색 결과 개수
	public int countSearch(SearchCriteria scri);
}
