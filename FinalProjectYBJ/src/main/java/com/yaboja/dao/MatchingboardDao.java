package com.yaboja.dao;

import java.util.List;
import java.util.Map;

import com.yaboja.dto.Criteria;
import com.yaboja.dto.MatchingboardDto;

public interface MatchingboardDao {
	String namespace="matchingboard.";
	
	public List<MatchingboardDto> selectAll();
	public MatchingboardDto selectOne(int matchingboard);
	public int insert(Map<String,String> map);
	public MatchingboardDto userOne(int userseq);

	public int update(Map<String,String> map);
	public MatchingboardDto getCinemaSeq(Map<String,String> map);
	public int delete(int userseq);
	public int deleteMatchingboard(int matchingboard);

	
	//목록 + 페이징
	public List<MatchingboardDto> listPage(Criteria cri);
	
	// 겟시물 총 갯수
	public int listCount();
	
	public List<MatchingboardDto> selectListByCinema(int cinemaseq);
	public List<MatchingboardDto> selectListByMovieseq(int movieseq);

}

