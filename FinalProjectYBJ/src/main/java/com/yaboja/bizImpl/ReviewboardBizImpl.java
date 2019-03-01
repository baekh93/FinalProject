package com.yaboja.bizImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yaboja.biz.ReviewboardBiz;
import com.yaboja.daoImpl.ReviewboardDaoImpl;
import com.yaboja.dto.Criteria;
import com.yaboja.dto.MovieDto;
import com.yaboja.dto.ReviewboardDto;
import com.yaboja.dto.SearchCriteria;

@Service
public class ReviewboardBizImpl implements ReviewboardBiz {

	@Autowired
	ReviewboardDaoImpl dao;

	@Override
	public List<ReviewboardDto> selectList() {
		return dao.selectList();
	}

	@Override
	public ReviewboardDto selectOne(int reviewboardseq) {
		dao.viewupdate(reviewboardseq);
		return dao.selectOne(reviewboardseq);
	}

	@Override
	public int insert(ReviewboardDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(ReviewboardDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int reviewboardseq) {
		return dao.delete(reviewboardseq);
	}

	@Override
	public int viewupdate(int reviewboardseq) {

		return dao.viewupdate(reviewboardseq);
	}

	// 진선 추가
	@Override
	public List<MovieDto> movieList() {
		return dao.movieList();
	}

	// 진선 추가
	@Override
	public MovieDto selectOne1(int movieseq) {

		return dao.selectOne1(movieseq);
	}

	// 목록 + 페이징
	@Override
	public List<ReviewboardDto> listPage(Criteria cri) {
		System.out.println("글 목록 페이징 2 단계 성공 ReviewboardBizlmpl");
		return dao.listPage(cri);
	}

	// 게시물 총 개수
	@Override
	public int listCount() {
		System.out.println("게시물 총 계수 2 단계 성공 ReviewboardBizlmpl");
		return dao.listCount();
	}

	@Override
	// 진선쓰 검색 토탈 카운트
	public int listCount1() {
		System.out.println(" 진선쓰 게시물 총 계수 2 단계 성공 ReviewboardBizlmp");
		return dao.listCount1();
	}

	// 목록 + 페이징 + 검색
	@Override
	public List<MovieDto> listSearch(SearchCriteria scri) {
		System.out.println("진선쓰 페이징 2단계 성공 ReviewboardBizlmpl");
		return dao.listSearch(scri);
	}

	// 검색 결과 갯수
	@Override
	public int countSearch(SearchCriteria scri) {
		System.out.println("진선쓰 페이징 2단계 성공 ReviewboardBizlmpl");
		return dao.countSearch(scri);
	}

	@Override
	public MovieDto getmovietitle(String movietitle) {
		return dao.getmovietitle(movietitle);
	}

	@Override
	public MovieDto getMovie(Map<String, String> map) {
		return dao.getMovie(map);
	}

}