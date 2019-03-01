package com.yaboja.bizImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yaboja.biz.MatchingboardBiz;
import com.yaboja.dao.MatchingboardDao;
import com.yaboja.daoImpl.MatchingboardDaoImpl;
import com.yaboja.dto.Criteria;
import com.yaboja.dto.MatchingboardDto;
@Service
public class MatchingboardBizImpl implements MatchingboardBiz {

	@Autowired
	MatchingboardDao dao;
	
	@Override
	public List<MatchingboardDto> selectAll(){
		return dao.selectAll();
	}

	@Override
	public MatchingboardDto selectOne(int matchingboard) {
		// TODO Auto-generated method stub
		return dao.selectOne(matchingboard);
	}

	@Override
	public int insert(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.insert(map);
	}

	@Override
	public MatchingboardDto userOne(int userseq) {
		// TODO Auto-generated method stub
		return dao.userOne(userseq);
	}


	@Override
	public int update(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.update(map);
	}

	//목록 + 페이징
	@Override
	public List<MatchingboardDto> listPage(Criteria cri){
		System.out.println("글 목록 페이징 2 단계 성공 MatchingboardBizlmpl");
		return dao.listPage(cri);
	}
	//게시물 총 개수
	@Override
	public int listCount() {
		System.out.println("게시물 총 계수 2 단계 성공 MatchingboardBizlmpl");
		return dao.listCount();
	}

	@Override
	public MatchingboardDto getCinemaSeq(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.getCinemaSeq(map);
	}

	@Override
	public int delete(int userseq) {
		// TODO Auto-generated method stub
		return dao.delete(userseq);
	}

	@Override
	public List<MatchingboardDto> selectListByCinema(int cinemaseq) {
		// TODO Auto-generated method stub
		return dao.selectListByCinema(cinemaseq);
	}

	@Override

	public List<MatchingboardDto> selectListByMovieseq(int movieseq) {
		// TODO Auto-generated method stub
		return dao.selectListByMovieseq(movieseq);
	}
	public int deleteMatchingboard(int matchingboard) {
		
		return dao.deleteMatchingboard(matchingboard);

	}
}
