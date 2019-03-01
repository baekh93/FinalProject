package com.yaboja.biz;

import java.util.List;

import com.yaboja.dto.MoviecomentDto;

public interface MoviecomentBiz {

	// 댓글 개수
    public int commentCount();
 
    // 댓글 목록
    public List<MoviecomentDto> commentList(int movieSeq);
 
    // 댓글 작성
    public int commentInsert(MoviecomentDto comment);
    
    // 댓글 수정
    public int commentUpdate(MoviecomentDto comment);
 
    // 댓글 삭제
    public int commentDelete(int cno);
	
}
