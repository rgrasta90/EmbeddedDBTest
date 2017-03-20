package com.daos;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.model.Flight;
import com.model.FlightDetails;

@Component
public class TestDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}


	public List<Flight> getQuery(){

	Session s =	sessionFactory.openSession();

	s.beginTransaction();
	
	List<Flight> f =  s.createQuery("from Flight").list();
	return f;
	}
	
	public List<FlightDetails> getDetails(String det){
		Session s;
	    s = this.sessionFactory.openSession();
	    
	    
		s.beginTransaction();
		org.hibernate.Query q = s.createQuery("from FlightDetails where flight_id like :flightId");
		q.setParameter("flightId", det.trim() + "%");
	
		List<FlightDetails> l = q.list();
	
		return l;
	}
}
