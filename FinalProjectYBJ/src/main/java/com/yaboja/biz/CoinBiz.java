package com.yaboja.biz;

import java.util.List;

import com.yaboja.dto.CoinDto;



public interface CoinBiz {
	
	// 포인트 충전 내역
		public List<CoinDto> coin_selectAll(int userseq);
		public int coin(int userseq, String coinstate);
		
		//포인트 충전
		public int coin_insert(int userseq, int point_val, String coinstate);
		

}
