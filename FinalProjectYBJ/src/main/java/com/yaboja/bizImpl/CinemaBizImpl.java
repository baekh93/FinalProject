package com.yaboja.bizImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yaboja.biz.CinemaBiz;
import com.yaboja.daoImpl.CinemaDaoImpl;
import com.yaboja.dto.CinemaDto;
@Service
public class CinemaBizImpl implements CinemaBiz{

	@Autowired
	CinemaDaoImpl dao;

	@Override

	public List<CinemaDto> selectAll() {
		return dao.selectAll();
	}
	public CinemaDto selectOne(int cinemaseq) {
		// TODO Auto-generated method stub
		return dao.selectOne(cinemaseq);
	}

	@Override
	public List<CinemaDto> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	@Override
	public int getCinemaSeq(String cinema) {
		// TODO Auto-generated method stub
		return dao.getCinemaSeq(cinema);
	}

	@Override
	public String getCinema(int cinemaseq) {
		// TODO Auto-generated method stub
		return dao.getCinema(cinemaseq);

	}
	@Override
	public int insertCinema(CinemaDto cinemaDto) {
		// TODO Auto-generated method stub
		return dao.insertCinema(cinemaDto);
	}
	@Override
	public int deleteCinema(int cinemaseq) {
		// TODO Auto-generated method stub
		return dao.deleteCinema(cinemaseq);
	}
}
