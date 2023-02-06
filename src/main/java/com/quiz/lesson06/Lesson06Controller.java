package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

@RequestMapping("/lesson06")
@Controller
public class Lesson06Controller {
	
	@Autowired
	private FavoriteBO favoriteBO;
	
	// http:/localhost/lesson06/quiz01/add_favorite_view
	@GetMapping("/quiz01/add_favorite_view")
	public String addFavoritView() {
		return "lesson06/quiz01/addFavorite";
	}

	
	@ResponseBody //ajax :view가 없다는 뜻, model은 담아 jsp에서 쓰기때문에 model안씀 
	@PostMapping("/quiz01/add_favorite")
	public Map<String,String> addFavorite(
			@RequestParam(value="name",required=true) String name,
			@RequestParam(value="url",required=true) String url
			) {

		//db insert
		favoriteBO.addFavorite(name,url);
		
		//성공값 응답값(api형태 정해진 json모양? (String이아닌 객체일때 json변환):list,ma등)
		Map<String,String> result = new HashMap<>();
		result.put("result","성공");
		
		return result; //jackson => JSON String
	}
	
	@GetMapping("/quiz01/after_add_favorite_view")
	public String afterAddFavorite(Model model) {
		//db select
		List<Favorite> favorite = favoriteBO.getFavorite();
		model.addAttribute("favoriteList", favorite);
		return"lesson06/quiz01/afterAddFavorite";
	}

}
