package com.yaboja.daoImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yaboja.dao.ReviewboardDao;
import com.yaboja.dto.Criteria;
import com.yaboja.dto.MovieDto;
import com.yaboja.dto.ReviewboardDto;
import com.yaboja.dto.SearchCriteria;

@Repository
public class ReviewboardDaoImpl implements ReviewboardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ReviewboardDto> selectList() {
		List<ReviewboardDto> res = new ArrayList<ReviewboardDto>();

		try {
			res = sqlSession.selectList(namespace + "selectAll");
		} catch (Exception e) {
			System.out.println("selectAll 에러");
			e.printStackTrace();
		}

		return res;
	}

	@Override
	public ReviewboardDto selectOne(int reviewboardseq) {
		ReviewboardDto dto = sqlSession.selectOne(namespace + "selectOne", reviewboardseq);
		return dto;
	}

	@Override
	public int insert(ReviewboardDto dto) {
		int res = sqlSession.insert(namespace + "Insert", dto);
		return res;
	}

	@Override
	public int update(ReviewboardDto dto) {
		int res = sqlSession.update(namespace + "update", dto);
		return res;
	}

	@Override
	public int delete(int reviewboardseq) {
		int res = sqlSession.delete(namespace + "delete", reviewboardseq);
		return res;
	}

	@Override
	public int viewupdate(int reviewboardseq) {
		int res = sqlSession.update(namespace + "viewupdate", reviewboardseq);
		return res;
	}

// 진선 추가
	@Override
	public List<MovieDto> movieList() {
		List<MovieDto> movielist = new ArrayList<MovieDto>();

		try {
			movielist = sqlSession.selectList(namespace + "movieAll");
		} catch (Exception e) {
			System.out.println("movie 에러");
			e.printStackTrace();
		}

		return movielist;
	}

	// 진선 추가
	@Override
	public MovieDto selectOne1(int movieseq) {
		MovieDto dto=null;
		try {
			dto = sqlSession.selectOne(namespace + "titlemovie", movieseq);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("리뷰보드다오 : selectOne1 실패");
		}

		return dto;
	}

	// 목록 + 페이징
	@Override
	public List<ReviewboardDto> listPage(Criteria cri) {

		List<ReviewboardDto> res = null;
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

	@Override
	public int listCount1() {
		System.out.println("진썬스 토탈 카운트 3");
		return sqlSession.selectOne(namespace + "listCount1");
	}

	// 목록 + 페이징 검색 Movie
	@Override
	public List<MovieDto> listSearch(SearchCriteria scri) {
		List<MovieDto> res = null;
		try {
			res = sqlSession.selectList(namespace + "listSearch", scri);
			System.out.println(scri);
			System.out.println("진선쓰 페이징 3단계 성공 mapper로 이동 movie reviewboarddaoimpl");

		} catch (Exception e) {
			System.out.println("진선쓰 MAPPER 에러");
		}
		return res;
	}

	@Override
	public int countSearch(SearchCriteria scri) {
		System.out.println(" 검색 countSearch 게시물 총 갯수 구하기 3");
		return sqlSession.selectOne(namespace + "countSearch", scri);
	}

	@Override
	public MovieDto getmovietitle(String movietitle) {
		MovieDto dto = sqlSession.selectOne(namespace + "movietitle",movietitle); 
		return dto;
	}

	@Override
	public MovieDto getMovie(Map<String,String> map) {
		MovieDto movieDto = null;
		try {
			movieDto = sqlSession.selectOne(namespace+"getMovie",map);
		} catch(Exception e) {
			System.out.println("getMovie 에러");
			e.printStackTrace();
		}
		return movieDto;
	}

}