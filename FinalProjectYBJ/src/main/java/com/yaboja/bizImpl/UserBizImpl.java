package com.yaboja.bizImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yaboja.biz.UserBiz;
import com.yaboja.dao.UserDao;
import com.yaboja.daoImpl.UserDaoImpl;
import com.yaboja.dto.CinemaDto;
import com.yaboja.dto.ReviewboardDto;
import com.yaboja.dto.UserDto;

@Service
public class UserBizImpl implements UserBiz {

	@Autowired
	UserDao dao;

	@Override

	public UserDto selectOne(String id) {
		UserDto dto = dao.selectOne(id);
		return dto;
	}

	public int insert(UserDto userdto) {
		return dao.insert(userdto);
	}

	public UserDto login(String userid, String userpw) {
		return dao.login(userid, userpw);

	}

	public List<UserDto> selectAll() {
		return dao.selectAll();
	}

	@Override
	public int updateUser(int userseq, String grade) {
		return dao.updateUser(userseq, grade);
	}

	public UserDto selectOne(int userseq) {
		// TODO Auto-generated method stub
		return dao.selectOne(userseq);

	}

	@Override
	public UserDto getLogin(String userid, String userpw) {
		return dao.getLogin(userid, userpw);
	}

	@Override
	public UserDto selectOne1(String userid) {
		return dao.selectOne1(userid);
	}

	@Override
	public int update(UserDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(String userid) {
		return dao.delete(userid);
	}

	@Override
	public List<ReviewboardDto> myboardList(int userseq) {
		return dao.myboardList(userseq);
	}

	@Override
	public int gradeUpdate(UserDto dto) {
		return dao.gradeUpdate(dto);
	}
}
