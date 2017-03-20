package com.model;

import javax.persistence.*;

@Entity  
@Table(name="SA.FLIGHT_DETAILS")
public class FlightDetails {
	

	public FlightDetails(){
		super();
	}
	
	@Id
	@Column(name="ID")
	private String flightDetId;
	
	@Column(name="FLIGHT_NO")
	private String flightCd;
	
	@Column(name="DEPT_TIME")
	private String departureTime;
	
	@Column(name="FLIGHT_ID")
	private String flightId;
	
	@Column(name="ECONOMIC")
	private String economic;
	
	@Column(name="EXECUTIVE")
	private String executive;
	
	public String getFlightId() {
		return flightId;
	}
	
	public void setFlightId(String flightId){
		this.flightId = flightId;
	}
	
	public String getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(String destination) {
		this.departureTime = destination;
	}
	public String getFlightDetId() {
		return flightDetId;
	}
	public void setFlightDetId(String flightDetId) {
		this.flightDetId = flightDetId;
	}

	
	
	public String getFlightCd() {
		return flightCd;
	}
	public void setFlightCd(String flightCd) {
		this.flightCd = flightCd;
	}

	public String getEconomic() {
		return economic;
	}

	public void setEconomic(String economic) {
		this.economic = economic;
	}

	public String getExecutive() {
		return executive;
	}

	public void setExecutive(String executive) {
		this.executive = executive;
	}
	
	

}
