package com.yaboja.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.yaboja.bizImpl.MovieBizImpl;
 
public class CronTask {
     //스케쥴러
	@Autowired
	private MovieBizImpl biz; //오토와이어드 : 의존성주입 -> 스케쥴러사용했음
     // 대용량의 대이터 : 배치 , 아니면 스케쥴러, 쿼츠(의존성주입을 못읽음)
    @Scheduled(cron="0 0 * * * *") // cron 표기법 0초 마다 (초,분,시,일,월,요일) "0 0 * * * *" 로 하면 매 정각마다 실행
    public void scheduleRun() {
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        
        System.out.println("------크롤링 배치 스케줄 실행  (현재 1분마다) : " + dateFormat.format(calendar.getTime()));
        int res[] = biz.insert();
		if (res[1] > 0) {
			System.out.println("새로운 상영작" + res[1] +"개 db에 삽입," + res[0] + "개 종영작으로 업데이트! ");
		}else {
			System.out.println("자동 크롤링 결과 네이버 영화 업데이트 없음");
		}	
		
    }
 
}