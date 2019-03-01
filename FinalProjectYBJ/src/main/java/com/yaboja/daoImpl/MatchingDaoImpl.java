package com.yaboja.daoImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yaboja.dao.MatchingDao;
import com.yaboja.dto.MatchingDto;
@Repository
public class MatchingDaoImpl implements MatchingDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insert(MatchingDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(namespace+"insert",dto);
			
		} catch(Exception e) {
			System.out.println("insert 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public MatchingDto selectOne(int userseq) {
		MatchingDto dto = null;
		try {
			dto = sqlSession.selectOne(namespace+"selectOne",userseq);
		} catch(Exception e) {
			System.out.println("selectOne 에러");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int delete(int matchingseq) {
		int res = 0;
		
			try {
				res = sqlSession.delete(namespace+"delete", matchingseq);
			} catch (Exception e) {
				System.out.println("matchingdelet 에러");
				e.printStackTrace();
			}
		
		return res;
	}
	
	@Override
	public int matchingcut(int matchingseq) {
		int res = 0;
		
			try {
				System.out.println("매칭컷1");
				res = sqlSession.update(namespace+"matchingcut", matchingseq);
				System.out.println("매칭컷");
			} catch (Exception e) {
				System.out.println("matchingCut 에러");
				e.printStackTrace();
			}
		
		return res;
	}

	@Override
	public List<MatchingDto> getMatchingApplicant(int userseq) {
		List<MatchingDto> list = new ArrayList<MatchingDto>();
		try {
			list = sqlSession.selectList(namespace+"getMatchingApplicant",userseq);
		} catch(Exception e) {
			System.out.println("getMatchingApplicant 에러");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int acceptance(Map<String, String> map) {
		int res = 0;
		try {
			res = sqlSession.update(namespace+"acceptance",map);
		} catch(Exception e) {
			System.out.println("acceptance 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int rejection(Map<String, String> map) {
		int res = 0;
		try {
			res = sqlSession.update(namespace+"rejection",map);
		} catch(Exception e) {
			System.out.println("rejection 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int rejectionOne(Map<String, String> map) {
		int res = 0;
		try {
			res = sqlSession.update(namespace+"rejectionOne",map);
		} catch(Exception e) {
			System.out.println("rejectionOne 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public MatchingDto matchSuccess(int userseq) {
		MatchingDto matchingDto = null;
		try {
			matchingDto = sqlSession.selectOne(namespace+"matchSuccess",userseq);
		} catch(Exception e) {
			System.out.println("matchSuccess 에러");
			e.printStackTrace();
		}
		return matchingDto;
	}

	@Override
	public MatchingDto insertCheck(int userseq) {
		MatchingDto matchingDto = null;
		try {
			matchingDto = sqlSession.selectOne(namespace+"insertCheck",userseq);
		}catch(Exception e) {
			System.out.println("insertCheck 에러");
			e.printStackTrace();
		}
		return matchingDto;
	}

	@Override
	public MatchingDto userOne(int userseq) {
		MatchingDto matchingDto = null;
		try {
			matchingDto = sqlSession.selectOne(namespace+"userOne",userseq);
		} catch(Exception e) {
			System.out.println("userOne 에러");
			e.printStackTrace();
		}
		return matchingDto;
	}

	@Override
	public int getAllUnreadMatching(int userseq) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(namespace+"getAllUnreadMatching",userseq);
			
		}catch(Exception e) {
			System.out.println("getAllUnreadMatching 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int readMatchSuccess(int userseq) {
		int res = 0;
		
		try {
			res = sqlSession.update(namespace+"readMatchSuccess",userseq);
		} catch(Exception e) {
			System.out.println("readMatchSuccess 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int readMatchRequested(int userseq) {
		int res = 0;
		try {
			res = sqlSession.update(namespace+"readMatchRequested",userseq);
		} catch(Exception e) {
			System.out.println("readMatchRequested 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int unreadSuccess(int userseq) {
		int res = 0;
		try {
			res = sqlSession.selectOne(namespace+"unreadSuccess",userseq);
		} catch(Exception e) {
			System.out.println("unreadSuccess 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int unreadRequested(int userseq) {
		int res = 0;
		try {
			res = sqlSession.selectOne(namespace+"unreadRequested",userseq);
		} catch(Exception e) {
			System.out.println("unreadRequested 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int unreadRejection(int userseq) {
		int res = 0;
		try {
			res = sqlSession.selectOne(namespace+"unreadRejection",userseq);
		}catch(Exception e) {
			System.out.println("unreadRejection+ 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int readMatchRejection(int userseq) {
		int res = 0;
		try {
			res = sqlSession.update(namespace+"readMatchRejection",userseq);
		} catch(Exception e) {
			System.out.println("readMatchRejection 에러");
		}
		return res;
	}

	@Override
	public List<MatchingDto> rejectionAll(Map<String, String> map) {
		List<MatchingDto> list = new ArrayList<MatchingDto>();
		try {
			list = sqlSession.selectList(namespace+"rejectionAll",map);
		} catch(Exception e){
			System.out.println("rejectionAll 에러");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<MatchingDto> history(int userseq) {
		List<MatchingDto> list = new ArrayList<MatchingDto>();
		try {
			list = sqlSession.selectList(namespace+"history",userseq);
		} catch(Exception e) {
			System.out.println("history 에러");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int autoReject(int userseq) {
		int res = 0;
		try {
			res = sqlSession.update(namespace+"autoReject",userseq);
		} catch(Exception e) {
			System.out.println("autoReject 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public MatchingDto selectMaxSeq(int userseq) {
		MatchingDto matchingDto = null;
		try {
			matchingDto = sqlSession.selectOne(namespace+"selectMaxSeq",userseq);
		} catch(Exception e) {
			System.out.println("selectMaxSeq 에러");
			e.printStackTrace();
		}
		return matchingDto;
	}

	
}
