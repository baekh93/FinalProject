package com.yaboja.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element; //이터레이터? html 태그들을 담고있는 배열
import org.jsoup.select.Elements;

import com.yaboja.dto.MovieDto;

public class Crawler {

	public static void main(String[] args) { //test : 무시해도됨

		Crawler crawler = new Crawler();

		ArrayList<MovieDto> movies = crawler.getPreMovie();

		for (MovieDto movie : movies) {
			System.out.println(movie);
		}

	}

	public ArrayList<MovieDto> getNaverMovie() {
		ArrayList<MovieDto> movies = new ArrayList<MovieDto>();

		setMovies(movies, "상영작");// 제목
		setImgUrlAndCode(movies,"상영작");// 이미지,코드
		setRating(movies);// 평점
		setEtc(movies,"상영작");// 장르, 개봉일, 감독, 상영시간, 배우

		setSeqAndState(movies); // seq랑 state 에 일단 더미 데이터 넣어주기

		return movies;

	}

	public ArrayList<MovieDto> getPreMovie() {
		ArrayList<MovieDto> movies = new ArrayList<MovieDto>();
		setMovies(movies, "예정작");
		setImgUrlAndCode(movies,"예정작");
		setEtc(movies,"예정작");// 장르, 개봉일, 감독, 상영시간, 배우

		return movies;
	}

	private void setSeqAndState(ArrayList<MovieDto> movies) {
		for (int i = 0; i < movies.size(); i++) {
			//movies.get(i).setMovieSeq(i);
			movies.get(i).setMoviestate("상영작");
		}

	}

	public String getContent(String code) {
		Document doc;
		String content = "";
		// 제목
		try {
			doc = Jsoup.connect("https://movie.naver.com/movie/bi/mi/basic.nhn?" + code.trim()).get();
			Elements elements = doc.select(".story_area .h_tx_story");

			if (elements.size() >= 1) {

				for (Element element : elements) {
					content += element.html();
					System.out.println(content);

				}
			} else {
				System.out.println("줄거리 못읽음");
			}

			content = "<h2>" + content + "</h2><br></br>";

			String content2 = "";

			elements = doc.select(".story_area .con_tx");

			if (elements.size() >= 1) {

				for (Element element : elements) {
					content2 += element.html();
					System.out.println(content);

				}
			} else {
				System.out.println("줄거리 못읽음");
			}
			content2 = "<div style='font-size:25px'>" + content2 + "</div>";

			content += content2;

			//
			String content3 = "";
			elements = doc.select(".people ul");

			if (elements.size() >= 1) {

				for (Element element : elements) {
					content3 += element.html();
					System.out.println(content);

				}
			} else {
				System.out.println("출연진 이미지 못읽음");
			}
			content3 = "<div><ul class='actorimage'>" + content3 + "</ul></div><br/>";

			content += content3;

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return content;
	}

	private void setImgUrlAndCode(ArrayList<MovieDto> movies, String state) {

		Document doc;
		// 이미지 및 영화 코드
		if (state.equals("상영작")) {
			try {
				doc = Jsoup.connect("https://movie.naver.com/movie/running/current.nhn").get();
				Elements elements = doc.select(".thumb"); //배열처럼 넣어줌
				System.out.println("현재 상영작 수 (이미지 및 코드 크롤링)" + elements.size() + "개");
				if (elements.size() > 1 && (elements.size() == movies.size())) {
					int i = 0;
					for (Element element : elements) {

						String str = element.html();
						String imgUrl = getImgUrl(str).trim();
						String movieCode = getMovieCode(str).trim();
						movies.get(i).setImgurl(imgUrl);
						movies.get(i).setCode(movieCode);
						i++;
					}
				} else {
					System.out.println("이미지, 코드  못읽음");
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(state.equals("예정작")){
			try {
				doc = Jsoup.connect("https://movie.naver.com/movie/running/premovie.nhn").get();
				Elements elements = doc.select(".thumb");
				System.out.println("현재 예정작 수(이미지 및 코드 크롤링) " + elements.size() + "개");
				if (elements.size() > 1 && (elements.size() == movies.size())) {
					int i = 0;
					for (Element element : elements) {

						String str = element.html();
						String imgUrl = getImgUrl(str).trim();
						String movieCode = getMovieCode(str).trim();
						movies.get(i).setImgurl(imgUrl);
						movies.get(i).setCode(movieCode);
						i++;
					}
				} else {
					System.out.println("이미지, 코드  못읽음");
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}

	}

	private void setRating(ArrayList<MovieDto> movies) {
		Document doc;
		// 평점

		try {
			doc = Jsoup.connect("https://movie.naver.com/movie/running/current.nhn").get();
			Elements elements = doc.select(".info_star .num");
			System.out.println("현재 상영작 수 (평점 크롤링) " + elements.size() + "개");
			if (elements.size() > 1 && (elements.size() == movies.size())) {
				int i = 0;
				for (Element element : elements) {
					movies.get(i++).setRating(element.text());
				}
			} else {
				System.out.println("평점  못읽음");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	private void setEtc(ArrayList<MovieDto> movies, String state) {
		Document doc;

		// 장르, 개봉일, 감독, 상영시간, 배우

		if(state.equals("상영작")) {
			
			try {
				doc = Jsoup.connect("https://movie.naver.com/movie/running/current.nhn").get();
				Elements elements = doc.select(".info_txt1");
				System.out.println("현재 상영작 수 (장르,개봉일,감독,상영시간, 배우 크롤링)" + elements.size() + "개");
				if (elements.size() > 1 && (elements.size() == movies.size())) {
					int i = 0;
					for (Element element : elements) {
						String text = element.text();
						// System.out.println("영화 장르 = " + text);

						String genre = getStr(text, "genre");
						String time = getStr(text, "time");
						String pupDate = getStr(text, "pupDate");
						String director = getStr(text, "director");
						String actor = getStr(text, "actor");

						/*
						 * System.out.println(genre); System.out.println(time);
						 * System.out.println(pupDate); System.out.println(director);
						 * System.out.println(actor);
						 */

						movies.get(i).setGenre(genre);
						movies.get(i).setTime(time);
						movies.get(i).setPupdate(pupDate);
						movies.get(i).setDirector(director);
						movies.get(i).setActor(actor);
						i++;
					}
				} else {
					System.out.println("Etc 못 읽음");

				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}else if(state.equals("예정작")) {
			try {
				doc = Jsoup.connect("https://movie.naver.com/movie/running/premovie.nhn").get();
				Elements elements = doc.select(".info_txt1");
				System.out.println("현재 예정작 수 (장르,개봉일,감독,상영시간, 배우 크롤링)" + elements.size() + "개");
				if (elements.size() > 1 && (elements.size() == movies.size())) {
					int i = 0;
					for (Element element : elements) {
						String text = element.text();
						// System.out.println("영화 장르 = " + text);

						String genre = getStr(text, "genre");
						String time = getStr(text, "time");
						String pupDate = getStr(text, "pupDate");
						String director = getStr(text, "director");
						String actor = getStr(text, "actor");

						/*
						 * System.out.println(genre); System.out.println(time);
						 * System.out.println(pupDate); System.out.println(director);
						 * System.out.println(actor);
						 */

						movies.get(i).setGenre(genre);
						movies.get(i).setTime(time);
						movies.get(i).setPupdate(pupDate);
						movies.get(i).setDirector(director);
						movies.get(i).setActor(actor);
						i++;
					}
				} else {
					System.out.println("Etc 못 읽음");

				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		

	}

	public static String getImgUrl(String text) {
		String regex = "src=\"(http://|https://)[^<>\"]+\"";
		Matcher m = Pattern.compile(regex).matcher(text);
		String str = "";

		while (m.find()) {
			str = m.group().replace("src=\"", "");
			// str = str.replace("?type=m99_141_2", "");
			str = str.replace("\"", "");
		}
		return str;
	}

	public static String getMovieCode(String text) {
		String regex = "code=[^<>\"]+\"";
		Matcher m = Pattern.compile(regex).matcher(text);
		String str = "";

		while (m.find()) {
			str = m.group();
			str = str.replace("\"", "");
		}
		return str;
	}

	public static String getStr(String text, String thing) {
		String str = "";
		String regex = "";
		Matcher m = null;

		if (thing.equals("genre")) {
			regex = "개요[^0-9]+(|)";
			m = Pattern.compile(regex).matcher(text);

			while (m.find()) {
				str = m.group();
				str = str.replace("개요", "").replace(" |", "").trim();
			}

		} else if (thing.equals("time")) {
			regex = "[0-9]+분";
			m = Pattern.compile(regex).matcher(text);

			while (m.find()) {
				str = m.group();
				str = str.trim();
			}

		} else if (thing.equals("pupDate")) {
			regex = "...........개봉";
			m = Pattern.compile(regex).matcher(text);

			while (m.find()) {
				str = m.group();
				str = str.replace("개봉", "").trim();
			}

		} else if (thing.equals("director")) {
			regex = "감독.+출연";
			m = Pattern.compile(regex).matcher(text);

			while (m.find()) {
				str = m.group();
				str = str.replace(" 출연", "").replace("감독 ", "").trim();
			}

		} else if (thing.equals("actor")) {
			regex = "출연.+";
			m = Pattern.compile(regex).matcher(text);

			while (m.find()) {
				str = m.group();
				str = str.replace("출연", "").trim();
			}

		}

		return str;
	}

	private void setMovies(ArrayList<MovieDto> movies, String str) {
		Document doc;
		// 제목
		if (str.equals("상영작")) {
			try {
				doc = Jsoup.connect("https://movie.naver.com/movie/running/current.nhn").get(); //이 url로 들어와서 가져오겠다
				Elements elements = doc.select(".tit a"); //tit의 앵커태그에 가져오겠다.
				System.out.println("현재 상영작 수 (제목 크롤링)" + elements.size() + "개");
				if (elements.size() > 1) {
					for (Element element : elements) {
						MovieDto movie = new MovieDto();
						movie.setMovietitle(element.text());
						movies.add(movie);
					}
				} else {
					System.out.println("제목 못읽음");
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (str.equals("예정작")) {
			try {
				doc = Jsoup.connect("https://movie.naver.com/movie/running/premovie.nhn").get();
				Elements elements = doc.select(".tit a");
				System.out.println("개봉 예정작 수 (제목 크롤링)" + elements.size() + "개");
				if (elements.size() > 1) {
					for (Element element : elements) {
						MovieDto movie = new MovieDto();
						movie.setMovietitle(element.text());
						movies.add(movie);
					}
				} else {
					System.out.println("제목 못읽음");
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}

}
