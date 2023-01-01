package com.quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/quiz02")
@RestController
public class Lesson01Quiz02RestController {
	
	// http://localhost:8080/lesson01/quiz02/1
	@RequestMapping("/1")
	public List<Map<String,Object>> printList(){
		//@ResponseBody + String리턴 => HttpMessageConverter String내용을 response body에 담아서 HTML로 내린다
		//@ResponseBody + 객체리턴 => HttpMessageConverter jackson라이브러리 => JSON응답
		
		
		List<Map<String, Object>> list = new ArrayList<>();
			Map<String, Object> map1 = new HashMap<>();
			map1.put("rate", 15);
			map1.put("director", "봉준호");
			map1.put("time", 130);
			map1.put("title","기생충");
			list.add(map1);
			
			Map<String, Object> map2 = new HashMap<>();
			map2.put("rate", 0);
			map2.put("director", "로베르토 베니니");
			map2.put("time", 116);
			map2.put("title","인생은 아름다워");
			list.add(map2);
			
			Map<String, Object> map3 = new HashMap<>();
			map3.put("rate", 12);
			map3.put("director", "크리스토퍼 놀란");
			map3.put("time", 147);
			map3.put("title","인셉션");
			list.add(map3);
			
			Map<String, Object> map4 = new HashMap<>();
			map4.put("rate", 19);
			map4.put("director", "윤종빈");
			map4.put("time", 133);
			map4.put("title","범죄와의 전쟁 : 나쁜놈들의 전성시대");
			list.add(map4);
			
			Map<String, Object> map5 = new HashMap<>();
			map5.put("rate", 15);
			map5.put("director", "프란시스 로렌스");
			map5.put("time", 137);
			map5.put("title","헝거게임");
			list.add(map5);
			
			return list;
	}
	@RequestMapping("/2")
	public List post() {
		List<MessageBoard> list = new ArrayList<>();
		
		MessageBoard mb = new MessageBoard();
		mb.setTitle("안녕하세요 가입인사 드립니다");
		mb.setUser("hagulu");
		mb.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		list.add(mb);
		
		mb = new MessageBoard(); //변수재활용가능 new를해서 힙영역에 새로 데이터를 할당
		mb.setTitle("헐 대박");
		mb.setUser("bada");
		mb.setContent("오늘 목요일이었어 금요일인줄...");
		list.add(mb);
		
		mb = new MessageBoard();
		mb.setTitle("오늘 데이트 한 이야기 해드릴게요");
		mb.setUser("dulumary");
		mb.setContent("...");
		list.add(mb);
		return list; //JSON으로 리턴
		
	}
	// http://localhost:8080/lesson01/quiz02/3
	@RequestMapping("/3")
	public ResponseEntity<MessageBoard> quiz02_3(){
		MessageBoard mb = new MessageBoard();
		mb.setTitle("안녕하세요 가입인사 드립니다");
		mb.setUser("hagulu");
		mb.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		return new ResponseEntity<>(mb,HttpStatus.INTERNAL_SERVER_ERROR);		
	}

}
