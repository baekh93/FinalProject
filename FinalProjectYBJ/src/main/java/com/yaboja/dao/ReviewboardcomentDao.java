package com.yaboja.dao;

import java.util.List;

import com.yaboja.dto.ReviewboardcomentDto;

public interface ReviewboardcomentDao {
	String namespace="reviewboardcoment.";
	
	 // 댓글 개수
    public int commentCount();
 
    // 댓글 목록
    public List<ReviewboardcomentDto> commentList(int reviewboardseq);
 
    // 댓글 작성
    public int commentInsert(ReviewboardcomentDto comment);
    
    // 댓글 수정
    public int commentUpdate(ReviewboardcomentDto comment);
 
    // 댓글 삭제
    public int commentDelete(int cno);

}
