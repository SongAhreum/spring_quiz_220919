package com.quiz.lesson05;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson05.bo.WeatherHistoryBO;
import com.quiz.lesson05.model.WeatherHistory;

@RequestMapping("/lesson05")
@Controller
public class WeatherHistoryController {
	
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	//http://localhost/lesson05/weather_history
	@GetMapping("/weather_history")
	public String weatherHistory(Model model) {
		List<WeatherHistory> weatherHistoryList = new ArrayList<WeatherHistory>();
		weatherHistoryList = weatherHistoryBO.getWeatherHistoryList();
		model.addAttribute("weatherHistoryList", weatherHistoryList);
		
		return"lesson05/quiz05/weather_history";
	}
	
	@GetMapping("/weather_add_view")
	public String weatherAddView() {
		return"lesson05/quiz05/weather_add";
	}
	
	@PostMapping("/weather_add")
	public String weatherAdd(
			@RequestParam("date") String date,
			@RequestParam("weather") String weather,
			@RequestParam("temperatures") double temperatures,
			@RequestParam("precipitation") double precipitation,
			@RequestParam("microDust") String microDust,
			@RequestParam("windSpeed") double windSpeed
			) {
		weatherHistoryBO.addWeatherHistory(date, weather, temperatures, precipitation, microDust, windSpeed);		
		//파라미터에 HttpServletResponse response추가 후(windSpeed뒤)  response.sendRedirect("/lesson05/weather_history")
		return"redirect:/lesson05/weather_history";
	}
}
