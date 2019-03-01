package com.yaboja.daoImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yaboja.dao.ChattingDao;
import com.yaboja.dto.ChattingDto;
@Repository
public class ChattingDaoImpl implements ChattingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int submit(String userseq1, String userseq2, String chatContent) {
		int res = 0;
		ChattingDto chattingDto = new ChattingDto();
		chattingDto.setUserseq1(Integer.parseInt(userseq1));
		chattingDto.setUserseq2(Integer.parseInt(userseq2));
		chattingDto.setChatcontent(chatContent);
		
		try {
			res = sqlSession.insert(namespace+"submit",chattingDto);
		} catch(Exception e) {
			System.out.println("submit 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public ArrayList<ChattingDto> getChatListByID(String userseq1, String userseq2, String chatseq) {
		ArrayList<ChattingDto> chatList = null;
		ChattingDto chattingDto = new ChattingDto();
		chattingDto.setUserseq1(Integer.parseInt(userseq1));
		chattingDto.setUserseq2(Integer.parseInt(userseq2));
		chattingDto.setChatseq(Integer.parseInt(chatseq));
		try {
			chatList = (ArrayList)sqlSession.selectList(namespace+"getChatListByID",chattingDto);
			for(int i = 0 ; i < chatList.size() ; i++) {
				chatList.get(i).setUserseq1(chatList.get(i).getUserseq1());
				chatList.get(i).setUserseq2(chatList.get(i).getUserseq2());
				chatList.get(i).setChatcontent(chatList.get(i).getChatcontent().replaceAll(" ","&nbsp").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>"));
			}
			
		}catch(Exception e) {
			System.out.println("getChatListByID 에러");
			e.printStackTrace();
		}
		return chatList;
	}

	@Override
	public ArrayList<ChattingDto> getChatListByRecent(String userseq1, String userseq2, int number) {
		ArrayList<ChattingDto> chatList = null;
		Map<String, String> map = new HashMap<String, String>();
		map.put("uersseq1", userseq1);
		map.put("userseq2", userseq2);
		map.put("number", number+"");
		
		try {
			chatList  = (ArrayList)sqlSession.selectList(namespace+"getChatListByRecent",map);
			for(int i = 0 ; i < chatList.size() ; i++) {
				chatList.get(i).setUserseq1(chatList.get(i).getUserseq1());
				chatList.get(i).setUserseq2(chatList.get(i).getUserseq2());
				chatList.get(i).setChatcontent(chatList.get(i).getChatcontent().replaceAll(" ","&nbsp").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n","<br>"));
			}
		}catch(Exception e) {
			System.out.println("getChatListByRecent 에러");
			e.printStackTrace();
		}
		
		
		return chatList;
	}

	@Override
	public int readChat(String userseq1, String userseq2) {
		int res = 0;
		ChattingDto chattingDto = new ChattingDto();
		chattingDto.setUserseq1(Integer.parseInt(userseq1));
		chattingDto.setUserseq2(Integer.parseInt(userseq2));
		
		try {
			res = sqlSession.update(namespace+"readChat",chattingDto);
		} catch(Exception e) {
			System.out.println("readChat 에러");
			e.printStackTrace();
		}
		
		return res;
	}
	@Override
	public int getAllUnreadChat(int userseq) {
	      int res = 0;
	      
	      try {
	         res = sqlSession.selectOne(namespace+"getAllUnreadChat",userseq);
	      }catch(Exception e) {
	    	  System.out.println("getAllUnreadChat 에러");
	         e.printStackTrace();
	      }
	      return res;
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
}