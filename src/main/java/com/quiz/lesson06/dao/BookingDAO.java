package com.quiz.lesson06.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Booking;

@Repository
public interface BookingDAO {

	public List<Booking> selectBookingList();
	
	public int deleteBookingById(int id);
	
	public void insertBooking(
			@Param("name") String name,
			@Param("headcount")int headcount,
			@Param("day")int day,
			@Param("date")@DateTimeFormat(pattern="yyyy-MM-dd")Date date,
			@Param("phoneNumber")String phoneNumber);

	public Booking selectBooking(
			@Param("name") String name,
			@Param("phoneNumber")String phoneNumber);
}
