package com.quiz.lesson06.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	@Autowired
	private BookingDAO bookingDAO;
	
	public void addBooking(String name,int headcount,int day,Date date,String phoneNumber) {
		bookingDAO.insertBooking(name, headcount, day, date, phoneNumber);
	}
	
	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}
	
	public int deleteBookingById(int id) {
		return bookingDAO.deleteBookingById(id);
	}
	public Booking getBooking(String name,String phoneNumber) {
		return bookingDAO.selectBooking(name, phoneNumber);
	}
}
