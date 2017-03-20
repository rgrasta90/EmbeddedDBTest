package com.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.daos.TestDao;
import com.model.Flight;
import com.model.FlightDetails;

@Service
public class TestService {
	
	@Autowired
	private TestDao testDao;
	
	
	public List<Flight>  getQuery(){
		return this.testDao.getQuery();
	}
	
	public List<FlightDetails> getDetails(String fDet){
		
		return this.testDao.getDetails(fDet);
	}
}
