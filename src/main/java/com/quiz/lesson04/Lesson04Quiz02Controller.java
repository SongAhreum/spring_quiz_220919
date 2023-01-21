package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class Lesson04Quiz02Controller {

	@Autowired
	private RealtorBO realtorBO;
	
	//http://localhost/lesson04/quiz02/add_realtor_view
	@GetMapping("/add_realtor_view")
	public String addRealtorView() {
		///WEB-INF/jsp/   .jsp
		return"lesson04/addRealtor";
	}
	
	//http://localhost/lesson04/quiz02/add_realtor
	@PostMapping("/add_realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor,
			Model model
			) {
		realtorBO.addRealtor(realtor);
		realtor = realtorBO.getRealtorById(realtor.getId());
		//realtorBO.getRealtor(realtor.getId())이 select해온 객체
		model.addAttribute("realtor",realtor);
		model.addAttribute("title","공인중개사 추가");
		return"lesson04/afterAddRealtor";///WEB-INF/jsp/   .jsp
	}
}
