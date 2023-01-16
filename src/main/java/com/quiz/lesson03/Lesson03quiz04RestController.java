package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;

@RestController
public class Lesson03quiz04RestController {
	
	@Autowired
	private RealEstateBO realEstateBO; 
	
	//http://localhost/lesson03/quiz04/1?id=21
	@RequestMapping("/lesson03/quiz04/1")
	public String quiz04_1(int id) {
		int row = realEstateBO.deleteRealEstateById(id);
		return "삭제성공" + row;
	}
}
