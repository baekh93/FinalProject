package com.yaboja.daoImpl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.yaboja.dao.MovieDao;

import com.yaboja.dto.Criteria;

import com.yaboja.dto.MovieDto;
import com.yaboja.dto.ReviewboardDto;




@Repository
public class MovieDaoImpl implements MovieDao {

	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public List<MovieDto> selectPresentMovies() {
		List<MovieDto> res = null;

		try {
		
			res = sqlSession.selectList(namespace + "selectPresentMovie");
			
		} catch (Exception e) {
			System.out.println("selectPresentMovie 에러");
			e.printStackTrace();
		}
		/*if(res.size()==0 || res==null)
		{
			return null;
		}*/
		return res;
	}

	@Override
	public List<MovieDto> selectEndMovies() {
		List<MovieDto> res = null;
		try {
			
			res = sqlSession.selectList(namespace + "selectEndMovie");
			
		} catch (Exception e) {
			System.out.println("selectPresentMovie 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insert(List<MovieDto> movies) {
		int res = 0;

		try {
			res = sqlSession.insert(namespace + "insertAll", movies);
			System.out.println("들어간 영화 수 : " + res);
			String str = String.valueOf(res); //쿼리문을 스트링으로
			Map<String, String> map = new HashMap<String, String>();
			map.put("str", str);
			sqlSession.update(namespace + "alter", map);
		} catch (Exception e) {
			System.out.println("insert 에러");
			e.printStackTrace();
		}

		return res;
	}
	
	@Override
	public int updateToEnd(List<MovieDto> updateToEndMovies) {
		int res = 0;

		try {			
			res = sqlSession.update(namespace + "updateToEnd",updateToEndMovies);
			if(res>0) {
				System.out.println("-----updateToEnd " +res + "개 종영작으로 바꿈------" );				
			}
		} catch (Exception e) {
			System.out.println("update 에러");
			e.printStackTrace();
		}
		
		return res;
	}
				

	@Override
	public MovieDto selectOne(int movieseq) {
		MovieDto dto = null;
		
		try {
			dto = sqlSession.selectOne(namespace+"match_selectOne",movieseq);
		} catch (Exception e) {
			System.out.println("match_selectOne 에러");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<MovieDto> selectList() {
		List<MovieDto> list = null;
		try {
			list = sqlSession.selectList(namespace+"selectList");
		} catch(Exception e) {
			System.out.println("selectList 에러");
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public int getMovieSeq(String movietitle) {
		int res = 0;
		try {
			res = sqlSession.selectOne(namespace+"getMovieSeq",movietitle);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("getMovieSeq 에러");
		}
		
		return res;
	}
	
	@Override
	public String getMovieTitle(int movieseq) {
		String movietitle = null;
		try {
			movietitle = sqlSession.selectOne(namespace+"getMovieTitle",movieseq);
		} catch(Exception e) {
			System.out.println("getMovieTitle 에러");
			e.printStackTrace();
		}
		return movietitle;

	}

	@Override
	public MovieDto selectOneMovie(int movieSeq) {
		MovieDto dto = null;
		try {
			dto = sqlSession.selectOne(namespace + "selectOneMovie", movieSeq);
		} catch (Exception e) {
			System.out.println("selectOneMovie 에러");
			e.printStackTrace();
		}
		return dto;
	}
	
	// 목록 + 페이징
		@Override
		public List<MovieDto> listPage(Criteria cri) {

			List<MovieDto> res = null;
			try {
				res = sqlSession.selectList(namespace + "listPage", cri);
				System.out.println(cri);
				System.out.println("글 목록 페이징 3 단계 성공 mapper로 이동 ReviewboardDaoImpl");
			} catch (Exception e) {
				System.out.println("글목록 페이지 MAPPER 에러");
				e.printStackTrace();
			}
			return res;
		}

		// 게시물 총 갯수
		@Override
		public int listCount() {
			System.out.println("게시물 총 갯수 구하기 3");
			return sqlSession.selectOne(namespace + "listCount");
		}
}
