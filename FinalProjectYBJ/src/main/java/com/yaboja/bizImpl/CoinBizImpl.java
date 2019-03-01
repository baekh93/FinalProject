package com.yaboja.bizImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yaboja.biz.CoinBiz;
import com.yaboja.dao.CoinDao;
import com.yaboja.daoImpl.CoinDaoImpl;
import com.yaboja.dto.CoinDto;
@Service
public class CoinBizImpl implements CoinBiz {

	@Autowired
	CoinDaoImpl dao;

	@Override
	public List<CoinDto> coin_selectAll(int userseq) {
		return dao.selectAll(userseq);
	}

	@Override
	public int coin(int userseq, String coinstate) {
		return dao.select(userseq, coinstate); 
	}

	@Override
	public int coin_insert(int userseq, int point_val, String coinstate) {

		return dao.CoinInsert(userseq, point_val, coinstate);
	}

	
}
