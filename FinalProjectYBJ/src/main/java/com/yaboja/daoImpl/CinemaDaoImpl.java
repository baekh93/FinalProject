package com.yaboja.daoImpl;

import java.util.List;


import javax.rmi.ssl.SslRMIClientSocketFactory;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yaboja.dao.CinemaDao;
import com.yaboja.dto.CinemaDto;
@Repository
public class CinemaDaoImpl implements CinemaDao {

	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public List<CinemaDto> selectAll() {
		
		List<CinemaDto> list=null;
		
		try {
			list=sqlSession.selectList(namespace+"selectAll");
		} catch (Exception e) {
			System.out.println("Cinema selectAll 에러");
			e.printStackTrace();
		}
		return list;

	}
	@Override
	public CinemaDto selectOne(int cinemaseq) {
		CinemaDto dto = null;
		
		try {
			dto = sqlSession.selectOne(namespace+"match_selectOne",cinemaseq);
		
		} catch (Exception e) {
			System.out.println("match_selectOne 에러");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<CinemaDto> selectList() {
		List<CinemaDto> list = null;
		
		try {
			list = sqlSession.selectList(namespace+"selectList");
		} catch(Exception e) {
			System.out.println("selectList 에러");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int getCinemaSeq(String cinema) {
		int cinemaseq = 0;
		
		try {
			cinemaseq = sqlSession.selectOne(namespace+"getCinemaSeq",cinema);
		} catch(Exception e) {
			System.out.println("getCinemaSeq 에러");
			e.printStackTrace();
		}
		return cinemaseq;
	}

	@Override
	public String getCinema(int cinemaseq) {
		String cinema = null;
		
		try {
			cinema = sqlSession.selectOne(namespace+"getCinema",cinemaseq);
		} catch(Exception e) {
			System.out.println("getCinema 에러");
			e.printStackTrace();
		}
		return cinema;

	}
	@Override
	public int insertCinema(CinemaDto cinemaDto) {
		int res = 0;
		try {
			res = sqlSession.insert(namespace+"insertCinema",cinemaDto);
		} catch(Exception e) {
			System.out.println("insertCinema 에러");
			e.printStackTrace();
		}
		return res;
	}
	@Override
	public int deleteCinema(int cinemaseq) {
		// TODO Auto-generated method stub
		int res = 0;
		try {
			res = sqlSession.delete(namespace+"deleteCinema",cinemaseq);
		} catch(Exception e) {
			System.out.println("deleteCinema 에러");
			e.printStackTrace();
		}
		return res;
	}
}
