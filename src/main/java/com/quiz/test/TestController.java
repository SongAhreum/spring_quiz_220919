package com.quiz.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	//http://localhost:8080/test1
	@ResponseBody 
	@RequestMapping("/test1") //서블릿에서 @WebServlet("주소")와 같은역할, url매핑
	public String test1() {
		return "<h1>Hello world!!</h1>";
	}
}

