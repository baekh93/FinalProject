package com.yaboja.daoImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yaboja.dao.CoinDao;
import com.yaboja.dto.CoinDto;
@Repository
public class CoinDaoImpl implements CoinDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public List<CoinDto> selectAll(int userseq) {
		List<CoinDto> coinlist = new ArrayList<CoinDto>();
		try {
		coinlist = sqlSession.selectList(namespace+"selectAll",userseq);
		}catch(Exception e) {
			System.out.println("SelectAll 에러");
			e.printStackTrace();
		}
		return coinlist;
	}


	@Override
	public int select(int userseq, String coinstate) {
		int coin = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userseq", userseq);
		map.put("coinstate", coinstate);
		
		try {
		coin=sqlSession.selectOne(namespace+"select",map);
		}catch(Exception e) {
			System.out.println("select 에러");
			e.printStackTrace();
		}
		
		return coin;
	}


	@Override
	public int CoinInsert(int userseq, int coinlog, String coinstate) {
		int res = 0;
		Map<String, Object> coinMap = new HashMap<String, Object>();
		
		coinMap.put("userseq", userseq);
		coinMap.put("coinlog", coinlog);
		coinMap.put("coinstate", coinstate);
		
		try {
		res=sqlSession.insert(namespace+"CoinInsert",coinMap);
		}catch(Exception e) {
			System.out.println("CoinInsert 에러");
			e.printStackTrace();
		}
		
		return res;
	}

	
}
