package com.yaboja.biz;

import java.util.List;
import java.util.Map;

import com.yaboja.dto.MatchingDto;

public interface MatchingBiz {

	public int insert(MatchingDto dto);
	public MatchingDto selectOne(int userseq);
	public int delete(int matchingseq);
	public List<MatchingDto> getMatchingApplicant(int userseq);
	public int acceptance(Map<String, String> map);
	public int rejection(Map<String, String> map);
	public int rejectionOne(Map<String,String> map);
	public MatchingDto matchSuccess(int userseq);
	public MatchingDto insertCheck(int userseq);
	public MatchingDto userOne(int userseq);
	public int matchingcut(int matchingseq);
	public int getAllUnreadMatching(int userseq);
	public int readMatchSuccess(int userseq);
	public int readMatchRequested(int userseq);
	public int readMatchRejection(int userseq);
	public int unreadSuccess(int userseq);
	public int unreadRequested(int userseq);
	public int unreadRejection(int userseq);
	public List<MatchingDto> rejectionAll(Map<String,String> map);
	public List<MatchingDto> history(int userseq);
	public int autoReject(int userseq);
	public MatchingDto selectMaxSeq(int userseq);

	

}
