package com.yaboja.daoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yaboja.dao.MoviecomentDao;
import com.yaboja.dto.MoviecomentDto;
@Repository
public class MoviecomentDaoImpl implements MoviecomentDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

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

	public List<MoviecomentDto> commentList(int movieSeq) {
		List<MoviecomentDto> list= null;
	      try {
	         list = sqlSession.selectList(namespace+"commentList",movieSeq);
	      } catch(Exception e) {
	         System.out.println("commentList 에러");
	         e.printStackTrace();
	      }
	      return list;

	}

	public int commentInsert(MoviecomentDto comment) {
		 int res=0;
	      
	      try {
	         res=sqlSession.insert(namespace+"commentInsert",comment);
	      }catch(Exception e) {
	         System.out.println("commentInsert 에러");
	         e.printStackTrace();
	      }

	      return res;
	}

	public int commentUpdate(MoviecomentDto comment) {
		int res=0;
	      
	      try {
	         res=sqlSession.update(namespace+"commentUpdate",comment);         
	      }catch(Exception e) {
	         System.out.println("commentUpdate 에러");
	         e.printStackTrace();
	      }
	      
	      return res;

	}

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
