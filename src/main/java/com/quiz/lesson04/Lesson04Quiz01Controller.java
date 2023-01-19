package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {
	
	@Autowired
	private SellerBO sellerBO;
	
	//http://localhost/lesson04/quiz01/add_seller_veiw
	@GetMapping("/add_seller_veiw")
	public String addSellerView() {
		// /WEB-INF/jsp/ (lesson04/addSeller) .jsp
		return"lesson04/addSeller";
	}
	
	@PostMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImageUrl",required=false) String profileImageUrl,
			@RequestParam("temperature") double temperature
			) {
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		return "lesson04/afterAddSeller";
	}
	
	//SELECT
	//http://localhost/lesson04/quiz01/seller_info
	//http://localhost/lesson04/quiz01/seller_info?id=1
	@GetMapping("/seller_info")
	public String SellerInfo(@RequestParam(value="id",required=false) Integer id,Model model) {
		Seller seller = null;
		if(id==null) {
			seller =sellerBO.getSellerInfo();
		} else {
			seller =sellerBO.getSeller(id);
		}
		model.addAttribute("seller", seller);
		return "lesson04/sellerInfo";
	}
	
}
