package com.yaboja.daoImpl;

import java.util.List;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yaboja.dao.MatchingboardDao;
import com.yaboja.dto.Criteria;
import com.yaboja.dto.MatchingboardDto;
import com.yaboja.dto.UserDto;
@Repository
public class MatchingboardDaoImpl implements MatchingboardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MatchingboardDto> selectAll() {
		
		List<MatchingboardDto> res = null;
		try {
			
			res= sqlSession.selectList(namespace + "selectList");
		
		} catch (Exception e) {
			System.out.println("matchingboard selectList 에러");
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public MatchingboardDto selectOne(int matchingboard) {
		
		MatchingboardDto res = null;
		try {
			res = sqlSession.selectOne(namespace+"selectOne",matchingboard);
		} catch (Exception e) {
			System.out.println("matchingboard selectOne 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int insert(Map<String, String> map) {
		int res = 0;
		try {
			res = sqlSession.insert(namespace+"insert",map);
		} catch(Exception e) {
			System.out.println("insert 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public MatchingboardDto userOne(int userseq) {
		MatchingboardDto matchingboarddto = null;
		try {
			matchingboarddto = sqlSession.selectOne(namespace+"userOne",userseq);
		} catch(Exception e) {
			System.out.println("userOne 에러");
			e.printStackTrace();
		}
		return matchingboarddto;
	}


	@Override
	public int update(Map<String, String> map) {
		int res = 0;
		try {
			res = sqlSession.update(namespace+"update",map);
		} catch(Exception e) {
			System.out.println("update 에러");
			e.printStackTrace();
		}
		
		return res;

	}
	// 목록 + 페이징
	@Override
	public List<MatchingboardDto> listPage(Criteria cri) {
		
		List<MatchingboardDto> res = null;
		try {
			res = sqlSession.selectList(namespace + "listPage", cri);
			System.out.println(cri);
			System.out.println("글 목록 페이징 3 단계 성공 mapper로 이동 MatchingboardDaoImpl");
		}catch (Exception e) {
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
	public MatchingboardDto getCinemaSeq(Map<String, String> map) {
		MatchingboardDto matchingboardDto = null;
		try {
			matchingboardDto = sqlSession.selectOne(namespace+"cinemaSeq",map);
		} catch(Exception e) {
			System.out.println("getCinemaseq 에러");
			e.printStackTrace();
		}
		return matchingboardDto;
	}

	@Override
	public int delete(int userseq) {
		int res = 0;
		try {
			res = sqlSession.delete(namespace+"delete",userseq);
		} catch(Exception e) {
			System.out.println("delete 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<MatchingboardDto> selectListByCinema(int cinemaseq) {
		List<MatchingboardDto> res = null;
		try {
			
			res= sqlSession.selectList(namespace + "selectListByCinema",cinemaseq);
		
		} catch (Exception e) {
			System.out.println("matchingboard selectListByCinema 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override

	public List<MatchingboardDto> selectListByMovieseq(int movieseq) {
		List<MatchingboardDto> res = null;
		try {
		
			res= sqlSession.selectList(namespace + "selectListByMovieseq",movieseq);
		
		} catch (Exception e) {
			System.out.println("matchingboard selectListByMovieseq 에러");
			e.printStackTrace();
		}
		return res;
	}
	public int deleteMatchingboard(int matchingboard) {
		int res = 0;
			try {
				res = sqlSession.delete(namespace+"deleteMatchingboard",matchingboard);
			} catch (Exception e) {
				System.out.println("deleteMatchingboard 에러");
				e.printStackTrace();
			}

		return res;
	}
}
