/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author LICH
 */
public class Flight {

    String flight_id;
    String Time;
    String origin;
    String destination;
    String airplane_id;
    double price;

    public Flight(String m_flight_id, String m_Time, String m_origin, String m_destination, String m_airplane_id, double m_price) {
        flight_id = m_flight_id;
        Time = m_Time;
        origin = m_origin;
        destination = m_destination;
        airplane_id = m_airplane_id;
        price = m_price;
    }

    public void setId(String m_flight_id) {
        flight_id = m_flight_id;
    }

    public void setTime(String m_Time) {
        Time = m_Time;
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

    public String getTime() {
        return Time;
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
