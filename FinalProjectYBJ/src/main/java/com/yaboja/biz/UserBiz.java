package com.yaboja.biz;

import java.util.List;
import java.util.Map;

import com.yaboja.dto.CinemaDto;
import com.yaboja.dto.ReviewboardDto;
import com.yaboja.dto.UserDto;

public interface UserBiz {

	public UserDto selectOne(String id);

	public int insert(UserDto userdto);

	public UserDto login(String userid, String userpw);

	public List<UserDto> selectAll();

	public int updateUser(int userseq, String grade);

	// 내게스글 보기
	public List<ReviewboardDto> myboardList(int userseq);

	public UserDto selectOne(int userseq);

	public UserDto getLogin(String userid, String userpw);

	// 마이페이지
	public UserDto selectOne1(String userid);

	public int update(UserDto dto);

	public int gradeUpdate(UserDto dto);

	public int delete(String userid);
	
}
