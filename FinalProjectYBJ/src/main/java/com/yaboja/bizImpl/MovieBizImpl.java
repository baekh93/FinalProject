package com.yaboja.bizImpl;


import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yaboja.biz.MovieBiz;
import com.yaboja.daoImpl.MovieDaoImpl;
import com.yaboja.dto.Criteria;
import com.yaboja.dto.MovieDto;

import com.yaboja.dto.ReviewboardDto;

import com.yaboja.util.Crawler;


@Service
public class MovieBizImpl implements MovieBiz {

	@Autowired
	MovieDaoImpl dao;

	@Override

	public List<MovieDto> selectPresentMovies() {

		return dao.selectPresentMovies();
	}

	@Override
	public List<MovieDto> selectEndMovies() {

		return dao.selectEndMovies();
	}

	@Override
	public int[] insert() {

		int res[] = {0,0};
		Crawler crawler = new Crawler();
		List<MovieDto> crawlMovies = crawler.getNaverMovie();
		/*List<MovieDto> crawlMovies = new ArrayList<MovieDto>();
		crawlMovies.add(new MovieDto(1111111,"해리포터4","1","2","3","4","상영작","6","7","8","9"));
		crawlMovies.add(new MovieDto(222222,"해리포터5","1","2","3","4","상영작","6","7","8","9"));
		crawlMovies.add(new MovieDto(333333,"해리포터6","1","2","3","4","상영작","6","7","8","9"));*/
		
		List<MovieDto> dbMovies = dao.selectPresentMovies();

		res[0] = updateToEndMovie(crawlMovies, dbMovies);
		List<MovieDto> movies = getInsertMovies(crawlMovies, dbMovies);
		if(movies.size()>0) {
			System.out.println("--------새로운 영화 " + movies.size() + "개 삽입 시도");
			res[1] = dao.insert(movies);
			if(movies.size()==res[1]) {
				System.out.println(movies.size()+"개 다중 삽입 성공 !!");
			}
		}
		return res;
	}

	public int updateToEndMovie(List<MovieDto> crawlMovies, List<MovieDto> dbMovies) {
		List<MovieDto> updateToEndMovies = new ArrayList<MovieDto>();
		int res = 0;
		for (MovieDto dbDto : dbMovies) {
			int i = 0;// 상영작이 크롤링한 상영작에 없는지 확인하기 위한 변수
			for (MovieDto crawlDto : crawlMovies) {
				if ((dbDto.getMovietitle().equals(crawlDto.getMovietitle()))) {
					i++;
					break;
				}
			}
			if (i==0) {
				updateToEndMovies.add(dbDto);
			}
			
		}
		if(updateToEndMovies.size()>0) {
			res=dao.updateToEnd(updateToEndMovies);			
		}
		return res;
	}

	public List<MovieDto> getInsertMovies(List<MovieDto> crawlMovies, List<MovieDto> dbMovies) {
		List<MovieDto> insertMovies = new ArrayList<MovieDto>();

		for (MovieDto crawlDto : crawlMovies) {
			int i = 0;// 크롤링한 영화가 디비에 있는지 없는지 확인하기 위한 변수
			for (MovieDto dbDto : dbMovies) {
				if (!(crawlDto.getMovietitle().equals(dbDto.getMovietitle()))) {
					i++;
				}
			}
			if (i == dbMovies.size()) {
				insertMovies.add(crawlDto);
			}
		}
		return insertMovies;
	}


	public MovieDto selectOne(int movieseq) {
		
		return dao.selectOne(movieseq) ;
	}

	@Override
	public List<MovieDto> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList();
	}

	@Override
	public int getMovieSeq(String movietitle) {
		// TODO Auto-generated method stub
		return dao.getMovieSeq(movietitle);
	}

	@Override
	public String getMovieTitle(int movieseq) {
		// TODO Auto-generated method stub
		return dao.getMovieTitle(movieseq);
	}


	@Override
	public MovieDto selectOneMovie(int movieSeq) {
		// TODO Auto-generated method stub
		MovieDto dto = dao.selectOneMovie(movieSeq);
		
		dto.setImgurl(dto.getImgurl().replace("?type=m99_141_2", ""));
		return dto;
	}

	@Override
	public List<MovieDto> selectPreMovies() {
		Crawler crawler = new Crawler();
		List<MovieDto> preMovies = crawler.getPreMovie();
		
		return preMovies;
	}
	
	//목록 + 페이징
	@Override
	public List<MovieDto> listPage(Criteria cri){
		System.out.println("글 목록 페이징 2 단계 성공 MovieBizlmpl");
		return dao.listPage(cri);
	}
	//게시물 총 개수
	@Override
	public int listCount() {
		System.out.println("게시물 총 계수 2 단계 성공 MovieBizlmpl");
		return dao.listCount();
	}


}
