package com.yaboja.daoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yaboja.dao.ReviewboardcomentDao;
import com.yaboja.dto.ReviewboardcomentDto;
@Repository
public class ReviewboardcomentDaoImpl implements ReviewboardcomentDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public int commentCount() {
		int res=0;
		try {
			res=sqlSession.selectOne(namespace+"commentCount");
		}catch(Exception e) {
			System.out.println("commentCount 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<ReviewboardcomentDto> commentList(int reviewboardseq) {
		List<ReviewboardcomentDto> list= null;
		try {
			list = sqlSession.selectList(namespace+"commentList",reviewboardseq);
		} catch(Exception e) {
			System.out.println("commentList 에러");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int commentInsert(ReviewboardcomentDto comment) {
		int res=0;
		
		try {
			res=sqlSession.insert(namespace+"commentInsert",comment);
		}catch(Exception e) {
			System.out.println("commentInsert 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int commentUpdate(ReviewboardcomentDto comment) {
		int res=0;
		
		try {
			res=sqlSession.update(namespace+"commentUpdate",comment);			
		}catch(Exception e) {
			System.out.println("commentUpdate 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int commentDelete(int cno) {
		int res=0;
		
		try {
			res=sqlSession.delete(namespace+"commentDelete",cno);
		}catch(Exception e) {
			System.out.println("commentDelete 에러");
			e.printStackTrace();
		}
		return res;
	}
}
