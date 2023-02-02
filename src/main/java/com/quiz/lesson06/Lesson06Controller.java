package com.quiz.lesson06;

import java.util.List;

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

	
	@ResponseBody
	@PostMapping("/quiz01/add_favorite")
	public String addFavorite(
			@RequestParam(value="name",required=true) String name,
			@RequestParam(value="url",required=true) String url
			) {

		//db insert
		favoriteBO.addFavorite(name,url);
		
		
		return"입력성공";
	}
	
	@GetMapping("/quiz01/after_add_favorite")
	public String afterAddFavorite(Model model) {
		//db select
		List<Favorite> favorite = favoriteBO.getFavorite();
		model.addAttribute("favoriteList", favorite);
		return"lesson06/quiz01/afterAddFavorite";
	}

}
