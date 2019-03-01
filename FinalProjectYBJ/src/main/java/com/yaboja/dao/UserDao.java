package com.yaboja.dao;

import java.util.List;
import java.util.Map;

import com.yaboja.dto.CinemaDto;
import com.yaboja.dto.ReviewboardDto;
import com.yaboja.dto.UserDto;

public interface UserDao {

	String namespace = "user.";

	public UserDto selectOne(String id);

	public int insert(UserDto userdto);

	public UserDto login(String userid, String userpw);

	public List<UserDto> selectAll();

	public int updateUser(int userseq, String grade);

	public UserDto getLogin(String userid, String userpw);

	// 내정보보기
	public UserDto selectOne(int userseq);

	// 내정보수정
	public int update(UserDto dto);

	public int gradeUpdate(UserDto dto);

	// 회원탈퇴
	public int delete(String userid);

	public UserDto selectOne1(String userid);

	// 내게시글보기
	public List<ReviewboardDto> myboardList(int userseq);
	
}
