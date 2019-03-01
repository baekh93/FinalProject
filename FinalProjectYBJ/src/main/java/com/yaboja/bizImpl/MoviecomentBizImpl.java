package com.yaboja.bizImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yaboja.biz.MoviecomentBiz;
import com.yaboja.daoImpl.MoviecomentDaoImpl;
import com.yaboja.dto.MoviecomentDto;
@Service
public class MoviecomentBizImpl implements MoviecomentBiz {

	@Autowired
	MoviecomentDaoImpl dao;

	@Override
	public int commentCount() {
		 
		return dao.commentCount();

	}

	@Override
	public List<MoviecomentDto> commentList(int movieSeq) {
		 
		return dao.commentList(movieSeq);

	}

	@Override
	public int commentInsert(MoviecomentDto comment) {
		return dao.commentInsert(comment);
	}

	@Override
	public int commentUpdate(MoviecomentDto comment) {
		return dao.commentUpdate(comment);

	}

	@Override
	public int commentDelete(int cno) {
		return dao.commentDelete(cno);

	}
}
