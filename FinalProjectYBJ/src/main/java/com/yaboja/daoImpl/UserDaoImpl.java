package com.yaboja.daoImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.yaboja.dao.UserDao;
import com.yaboja.dto.CinemaDto;
import com.yaboja.dto.ReviewboardDto;
import com.yaboja.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public UserDto selectOne(String id) {
		UserDto dto = null;
		try {

			dto = sqlSession.selectOne(namespace + "selectOne", id);
		} catch (Exception e) {
			System.out.println("selectOne 에러");
			e.printStackTrace();
		}
		return dto;

	}

	public UserDto selectOne(int userseq) {
		UserDto dto = null;

		try {

			dto = sqlSession.selectOne(namespace + "selectOne2", userseq);
		} catch (Exception e) {
			System.out.println("selectOne2 에러");

			e.printStackTrace();
		}
		return dto;

	}

	public int insert(UserDto userdto) {
		int res = 0;

		try {

			userdto.setUsergrade("user");
			res = sqlSession.insert(namespace + "insert", userdto);

		} catch (Exception e) {
			System.out.println(namespace + "insert 에러");
			e.printStackTrace();
		}
		return res;
	}

	public UserDto login(String userid, String userpw) {
		UserDto userdto = null;
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("userpw", userpw);

		try {
			userdto = sqlSession.selectOne(namespace + "Login", map);
//			System.out.println(userdto);
		} catch (Exception e) {
			System.out.println("login 에러(userDao.login)");
		}
		return userdto;

	}

	public List<UserDto> selectAll() {
		List<UserDto> list = null;

		try {
			list = sqlSession.selectList(namespace + "selectAll");
		} catch (Exception e) {
			System.out.println("userList 에러 (userDao.selectAll)");
		}

		return list;
	}

	public int updateUser(int userseq, String grade) {
		int res = 0;
		UserDto dto = new UserDto();
		dto.setUserseq(userseq);
		dto.setUsergrade(grade);
		try {
			res = sqlSession.update(namespace + "userUpdate", dto);
		} catch (Exception e) {
			System.out.println("userUpdate 에러");
		}
		return res;

	}

	@Override
	public UserDto getLogin(String userid, String userpw) {
		UserDto res = null;
		UserDto dto = new UserDto();
		dto.setUserid(userid);
		dto.setUserpw(userpw);
		try {
			res = sqlSession.selectOne(namespace + "selectOne", dto);
		} catch (Exception e) {
			System.out.println("selectOne 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public UserDto selectOne1(String userid) {
		UserDto dto = sqlSession.selectOne(namespace + "userOne", userid);
		return dto;
	}

	@Override
	public int update(UserDto dto) {
		System.out.println("mappertest시작전");
		System.out.println(dto);
		int res = sqlSession.update(namespace + "userUpdate2", dto);
		System.out.println("mappertest시작후" + res);
		System.out.println("dao id : " + dto.toString());
		return res;
	}

	@Override
	public int delete(String userid) {
		int res = sqlSession.delete(namespace + "userDelete", userid);
		return res;
	}
	
	@Override
	public int gradeUpdate(UserDto dto) {
		int res = sqlSession.update(namespace + "userDelete",dto);
		return res;
	}

	@Override
	public List<ReviewboardDto> myboardList(int userseq) {
		List<ReviewboardDto> res = new ArrayList<ReviewboardDto>();
		try {
			res = sqlSession.selectList(namespace + "myboard", userseq);
			
		} catch (Exception e) {
			System.out.println("내게시글출력실패");
			e.printStackTrace();
		}
		return res;
	}
}
