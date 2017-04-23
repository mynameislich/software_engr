/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.text.DateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author LICH and Emily
 */
public class Flight {

    String flight_id;
    Date arrivingTime;
    Date departingTime;
    String origin;
    String destination;
    String airplane_id;
    double price;
    DateFormat formatter ; 
    String frequency;
//changes add a Calendar and Date data type
    public Flight(String m_flight_id, Date aTime, Date dTime ,String m_airplane_id, String m_origin, String m_destination, double m_price ,String m_freq) {
        flight_id = m_flight_id;
        arrivingTime = aTime;
        departingTime = dTime;
        origin = m_origin;
        destination = m_destination;
        airplane_id = m_airplane_id;
        price = m_price;
        frequency = m_freq;
    }

        public Date getArrivingTime() {
        return arrivingTime;
    }

    public void setArrivingTime(Date arrivingTime) {
        this.arrivingTime = arrivingTime;
    }

    public Date getDepartingTime() {
        return departingTime;
    }

    public void setDepartingTime(Date departingTime) {
        this.departingTime = departingTime;
    }
    
    public String getFlight_id() {
        return flight_id;
    }

    public void setFlight_id(String flight_id) {
        this.flight_id = flight_id;
    }

    public String getFrequency() {
        return frequency;
    }

    public void setFrequency(String frequency) {
        this.frequency = frequency;
    }
    public String getArrivingTime2()
    {
        formatter = null;
        String time = formatter.format(getArrivingTime());
        return time;
    
    }
        public String getDepartingTime2()
    {
        formatter = null;
        String time = formatter.format(getDepartingTime());
        return time;
    
    }
    public void setId(String m_flight_id) {
        flight_id = m_flight_id;
    }

  
    public void setOrigin(String m_origin) {
        origin = m_origin;
    }

    public void setDestination(String m_destination) {
        destination = m_destination;
    }

    public void setAirplane_id(String m_airplane_id) {
        airplane_id = m_airplane_id;
    }

    public void setPrice(double m_price) {
        price = m_price;
    }

    public String getId() {
        return flight_id;
    }

 

    public String getOrigin() {
        return origin;
    }

    public String getDestination() {
        return destination;
    }

    public String getAirplane_id() {
        return airplane_id;
    }

    public double getPrice() {
        return price;
    }
}
