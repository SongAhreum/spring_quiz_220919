package com.quiz.lesson05.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson05.model.WeatherHistory;

@Repository
public interface WeatherHistoryDAO {

	public List<WeatherHistory> selectWeatherHistoryList();
	
	public void insertWeatherHistory(
			@Param("date") String date, //String으로 인서트해도 db에서는 date타입으로 잘저장
			//@Param("date") @DateTimeFormat(pattern="yyyy-MM-dd") Date date,
			@Param("weather") String weather,
			@Param("temperatures") double temperatures,
			@Param("precipitation")double precipitation,
			@Param("microDust") String microDust,
			@Param("windSpeed") double windSpeed			
			);
}
