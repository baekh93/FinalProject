package com.yaboja.bizImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yaboja.biz.MatchingBiz;
import com.yaboja.daoImpl.MatchingDaoImpl;
import com.yaboja.dto.MatchingDto;
@Service
public class MatchingBizImpl implements MatchingBiz {

	@Autowired
	MatchingDaoImpl dao;

	@Override
	public int insert(MatchingDto dto) {
		// TODO Auto-generated method stub
		return dao.insert(dto);
	}

	@Override
	public MatchingDto selectOne(int userseq) {
		// TODO Auto-generated method stub
		return dao.selectOne(userseq);
	}

	@Override
	public int delete(int matchingseq) {
		// TODO Auto-generated method stub
		return dao.delete(matchingseq);
	}

	@Override
	public List<MatchingDto> getMatchingApplicant(int userseq) {
		// TODO Auto-generated method stub
		return dao.getMatchingApplicant(userseq);
	}

	@Override
	public int acceptance(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.acceptance(map);
	}

	@Override
	public int rejection(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.rejection(map);
	}

	@Override
	public int rejectionOne(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.rejectionOne(map);
	}

	@Override
	public MatchingDto matchSuccess(int userseq) {
		// TODO Auto-generated method stub
		
		return dao.matchSuccess(userseq);
	}

	@Override
	public MatchingDto insertCheck(int userseq) {
		// TODO Auto-generated method stub
		return dao.insertCheck(userseq);
	}

	@Override
	public MatchingDto userOne(int userseq) {
		// TODO Auto-generated method stub
		return dao.userOne(userseq);
	}

	@Override
	public int matchingcut(int matchingseq) {
		// TODO Auto-generated method stub
		return dao.matchingcut(matchingseq);
	}

	@Override
	public int getAllUnreadMatching(int userseq) {
		// TODO Auto-generated method stub
		return dao.getAllUnreadMatching(userseq);
	}

	@Override
	public int readMatchSuccess(int userseq) {
		// TODO Auto-generated method stub
		return dao.readMatchSuccess(userseq);
	}

	@Override
	public int readMatchRequested(int userseq) {
		// TODO Auto-generated method stub
		return dao.readMatchRequested(userseq);
	}

	@Override
	public int unreadSuccess(int userseq) {
		// TODO Auto-generated method stub
		return dao.unreadSuccess(userseq);
	}

	@Override
	public int unreadRequested(int userseq) {
		// TODO Auto-generated method stub
		return dao.unreadRequested(userseq);
	}

	@Override
	public int unreadRejection(int userseq) {
		// TODO Auto-generated method stub
		return dao.unreadRejection(userseq);
	}

	@Override
	public int readMatchRejection(int userseq) {
		// TODO Auto-generated method stub
		return dao.readMatchRejection(userseq);
	}

	@Override
	public List<MatchingDto> rejectionAll(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.rejectionAll(map);
	}

	@Override
	public List<MatchingDto> history(int userseq) {
		// TODO Auto-generated method stub
		return dao.history(userseq);
	}

	@Override
	public int autoReject(int userseq) {
		// TODO Auto-generated method stub
		return dao.autoReject(userseq);
	}

	@Override
	public MatchingDto selectMaxSeq(int userseq) {
		// TODO Auto-generated method stub
		return dao.selectMaxSeq(userseq);
	}
}
