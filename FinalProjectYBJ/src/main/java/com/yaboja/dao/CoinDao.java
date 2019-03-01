package com.yaboja.dao;

import java.util.List;

import com.yaboja.dto.CoinDto;

public interface CoinDao {
	String namespace="coin.";
	
	public List<CoinDto> selectAll(int userseq);
	public int select(int userseq, String coinstate);
	public int CoinInsert(int userseq, int coinlog, String coinstate);
}
