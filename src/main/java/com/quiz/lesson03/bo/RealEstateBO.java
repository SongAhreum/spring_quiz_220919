package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateDAO;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {
	
	@Autowired
	private RealEstateDAO realEstateDAO;
	
	public RealEstate getRealEstateById(int id) {
		return realEstateDAO.selectRealEstateById(id);
	}
	
	public List<RealEstate> getRealEstateListByRentPrice(int rentPrice) {
		return realEstateDAO.selectRealEstateListByRentPrice(rentPrice);
	}
	
	public List<RealEstate> getRealEstateListByAreaPrice(int area,int price) {
		return realEstateDAO.selectRealEstateListByAreaPrice(area, price);
	}
	
	public int addRealEstate(RealEstate realEstate) {
		return realEstateDAO.insertRealEstate(realEstate);
	}
	//String address, int	area,String type,int price,Integer rentPrice
	public int addRealEstateAsField(int realtorId,String address, int area,String type,int price,Integer rentPrice) {
		return realEstateDAO.insertRealEstateAsField(realtorId,address,area,type,price,rentPrice);
	}
	
	public int updateRealEstateById(int id,String type,int price) {
		return realEstateDAO.updateRealEstateById(id,type,price);
	}
	
	public int deleteRealEstateById(int id) {
		return realEstateDAO.deleteRealEstateById(id);
	}
}
