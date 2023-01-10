package com.quiz.lesson02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;

@RestController
public class Lesson02quiz01RestController {
	
	@Autowired
	private StoreBO storeBO;
	
	@RequestMapping("/lesson02/quiz01")
	public List<Store> ex01(){ //무슨컬럼인지 알기어려우니 MAP보다는 CLASS로
		//List<Store> storeList = storeBO.getStoreList();
		//return storeList; //JSON 
		return storeBO.getStoreList();
	}
}
