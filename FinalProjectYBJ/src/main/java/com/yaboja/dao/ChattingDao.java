package com.yaboja.dao;

import java.util.ArrayList;

import com.yaboja.dto.ChattingDto;

public interface ChattingDao {
	String namespace="chatting.";
	
	public int submit(String userseq1, String userseq2, String chatContent);
	public ArrayList<ChattingDto> getChatListByID(String userseq1, String userseq2, String chatseq);
	public ArrayList<ChattingDto> getChatListByRecent(String userseq1, String userseq2, int number);
	public int readChat(String userseq1, String userseq2);
	public int getAllUnreadChat(int userseq);
	public int delete(int userseq);
}
