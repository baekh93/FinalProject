package com.yaboja.bizImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yaboja.biz.ReviewboardcomentBiz;
import com.yaboja.daoImpl.ReviewboardcomentDaoImpl;
import com.yaboja.dto.ReviewboardcomentDto;
@Service
public class ReviewboardcomentBizImpl implements ReviewboardcomentBiz {

	@Autowired
	ReviewboardcomentDaoImpl dao;

	@Override
	public int commentCount() {
		
		return dao.commentCount();
	}

	@Override
	public List<ReviewboardcomentDto> commentList(int reviewboardseq) {
		
		return dao.commentList(reviewboardseq);
	}

	@Override
	public int commentInsert(ReviewboardcomentDto comment) {
		
		return dao.commentInsert(comment);
	}

	@Override
	public int commentUpdate(ReviewboardcomentDto comment) {
		
		return dao.commentUpdate(comment);
	}

	@Override
	public int commentDelete(int cno) {
		
		return dao.commentDelete(cno);
	}
}
