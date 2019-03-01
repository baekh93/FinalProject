package com.yaboja.bizImpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yaboja.biz.ChattingBiz;
import com.yaboja.daoImpl.ChattingDaoImpl;
import com.yaboja.dto.ChattingDto;
@Service
public class ChattingBizImpl implements ChattingBiz {

	@Autowired
	ChattingDaoImpl dao;

	@Override
	public int submit(String userseq1, String userseq2, String chatContent) {
		// TODO Auto-generated method stub
		return dao.submit(userseq1,userseq2,chatContent);
	}

	@Override
	public ArrayList<ChattingDto> getChatListByID(String userseq1, String userseq2, String chatseq) {
		// TODO Auto-generated method stub
		return dao.getChatListByID(userseq1,userseq2,chatseq);
	}

	@Override
	public ArrayList<ChattingDto> getChatListByRecent(String userseq1, String userseq2, int number) {
		// TODO Auto-generated method stub
		return dao.getChatListByRecent(userseq1,userseq2,number);
	}

	@Override
	public int readChat(String userseq1, String userseq2) {
		// TODO Auto-generated method stub
		return dao.readChat(userseq1,userseq2);
	}
	@Override
	public int getAllUnreadChat(int userseq) {
		// TODO Auto-generated method stub
		return dao.getAllUnreadChat(userseq);
	}

	@Override
	public int delete(int userseq) {
		// TODO Auto-generated method stub
		return dao.delete(userseq);
	}

}
