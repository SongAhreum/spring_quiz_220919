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

@RequestMapping("/lesson06/quiz01")
@Controller
public class Lesson06Controller {
	
	@Autowired
	private FavoriteBO favoriteBO;
	
	// http:/localhost/lesson06/quiz01/add_favorite_view
	@GetMapping("/add_favorite_view")
	public String addFavoritView() {
		return "lesson06/quiz01/addFavorite";
	}

	
	@ResponseBody //ajax :view가 없다는 뜻, model은 담아 jsp에서 쓰기때문에 model안씀 
	@PostMapping("/add_favorite")
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
	
	@GetMapping("/after_add_favorite_view")
	public String afterAddFavorite(Model model) {
		//db select
		List<Favorite> favorite = favoriteBO.getFavorite();
		model.addAttribute("favoriteList", favorite);
		return"lesson06/quiz01/afterAddFavorite";
	}
	
	@ResponseBody
	@GetMapping("/url_duplication")
	public Map<String,Boolean> urlIsDuplication(
			@RequestParam("url") String url
			){
		Map<String,Boolean> result = new HashMap<>();
		result.put("url_duplication",favoriteBO.existFavoriteByUrl(url));
		return result;
		
		/*중복확인
		mapper에서 select resultType을 Favorite로 하였을때
		Favorite favorite = favoriteBO.existFavoriteByUrl(url);
		//favorite가 null인지 판단
		 if(favorite != null){
		 	result.put("url_duplication",true);
		 } else {
		 	result.put("url_duplication",false);
		 }
		 return result;
		
		*/
	}
	
	@ResponseBody
	@GetMapping("/delet_favorite")
	public Map<String,Boolean> deleteFavoriteById(
			@RequestParam("id") int id
			) {
		//delete
		favoriteBO.deleteFavoriteById(id);
		//성공응답값
		Map<String,Boolean> result = new HashMap<>();
		result.put("result",true);
		
		return result;
	}
	
	//학원풀이 (open api 형식)
	/*
	@ResponseBody
	@DeleteMapping("/delet_favorite")
	public Map<String,Object> deleteFavorite(
			@RequestParam("id") int id
			) {
		Map<String,Object> result = new HashMap<>();
		
		//db delete
		int row = favoriteBO.deleteFavoriteById(int id);
		
		if(row>0){
			result.put("code",1);//성공 클라이언트는 코드를 보고 결과를본당
			result.put("result","성공");
		} else {
			result.put("code",500); //실패
			result.put("result","실패");
			result.put("error_message","삭제된 행이 없습니다.")
		} 
		return result;
	}
	 
	 
	  */
}
