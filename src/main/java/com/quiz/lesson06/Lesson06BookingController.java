package com.quiz.lesson06;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;


@Controller
public class Lesson06BookingController {
	@Autowired
	private BookingBO bookingBO;
	
	//메인view가기
	//  http://localhost/lesson06/booking_check_view
	@GetMapping("/lesson06/booking_check_view")
	public String bookingCheck() {
		return"lesson06/booking/mainTemplate";
	}
	
	//main view에서 예약조회하기
	@ResponseBody
	@PostMapping("/lesson06/check_booking")
	public Map<String,Object> checkBooking(
			@RequestParam(value="name",required=true) String name,
			@RequestParam(value="phoneNumber",required=false) String phoneNumber
			) {
		//db select 최신예약정보 한건
		Booking booking = bookingBO.getBooking(name, phoneNumber);
		
		Map<String,Object> result = new HashMap<>();
		if(booking != null) {
			result.put("result","성공");
			result.put("booking", booking);
		} else {
			result.put("result", "실패");
		}
		return result;
	}
	
	//예약하기 view
	//  http://localhost/lesson06/booking_view
	@GetMapping("/lesson06/booking_view")
	public String booking() {
		return"lesson06/booking/bookingTemplate";
	}
	
	//예약 insert
	@ResponseBody
	@PostMapping("/lesson06/add_booking")
	public Map<String,Object> addBooking(
			@RequestParam(value="name", required=true) String name,
			@RequestParam(value="headcount", required=true)int headcount,
			@RequestParam(value="day", required=true)int day,
			@RequestParam(value="date", required=true)@DateTimeFormat(pattern="yyyy-MM-dd")Date date,
			@RequestParam(value="phoneNumber",required=false)String phoneNumber
			) {
		bookingBO.addBooking(name, headcount, day, date, phoneNumber);
		Map<String,Object> result = new HashMap<>();
		result.put("code",200);
		result.put("result","성공");
		return result;
	}
	
	//예약목록 view select
	//  http://localhost/lesson06/booking_list_view
	@GetMapping("/lesson06/booking_list_view")
	public String bookingList(Model model) {
		
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		
		return"lesson06/booking/bookingListTemplate";
	}
	
	//목록삭제 delete
	@ResponseBody
	@DeleteMapping("/lesson06/delete_booking")
	public Map<String,Object> deleteBooking(
			@RequestParam("id") int id
			){
		Map<String,Object> result= new HashMap<>();
		//db delete
		int row = bookingBO.deleteBookingById(id);
		
		if(row > 0) {
			result.put("code", 200);
			result.put("result","성공");
			
		} else {
			result.put("code",500); //실패
			result.put("result","실패");
			result.put("error_message","삭제하는데 실패하였습니다.");
		}
		return result;
	}	
}
