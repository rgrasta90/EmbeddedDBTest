package com.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Flight;
import com.model.FlightDetails;
import com.services.TestService;

@Controller
public class SpringController {
	
@Autowired
private TestService testService;	

@RequestMapping("/SayHello")
@ResponseBody
public List<Flight> sayHello(HttpServletRequest request, HttpServletResponse response){
  	List<Flight> l;
	l = this.testService.getQuery();
	return l;
}
@RequestMapping(value = "/GetDetails", method=RequestMethod.GET)
@ResponseBody
public List<FlightDetails>getFlightDetails(HttpServletRequest request, HttpServletResponse response){

return this.testService.getDetails(request.getParameter("flightId"));
}

@RequestMapping(value ="/BookFlight", method=RequestMethod.POST)
public String bookFlight(@RequestParam("firstname") String firstname, @RequestParam("lastname") String lastname, 
		@RequestParam("bookFlightId") String id){
	System.out.println(firstname + " " + lastname + " " + id);
	
	return "/jsp/hi.jsp";
}
}
