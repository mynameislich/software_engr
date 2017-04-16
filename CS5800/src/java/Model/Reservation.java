/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.List;

/**
 *
 * @author Emily
 */
public class Reservation {
    int month;
    int day;
    int year;
    float cost;
    String flightClass;
    int userID;
    int planeID;
    List <Flight> flights;


    public Reservation(int month, int day, int year, int cost, String flightClass, int userID, int planeID,    List <Flight> flights)
    {
        this.month = month;
        this.day = day;
        this.year = year;
        this.cost = cost;
        this.flightClass = flightClass;
        this.userID = userID;
        this.planeID = planeID;
        this.flights = flights;
     }//end constructor
        public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public String getFlightClass() {
        return flightClass;
    }

    public void setFlightClass(String flightClass) {
        this.flightClass = flightClass;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getPlaneID() {
        return planeID;
    }

    public void setPlaneID(int planeID) {
        this.planeID = planeID;
    }

    public List<Flight> getFlights() {
        return flights;
    }

    public void setFlights(List<Flight> flights) {
        this.flights = flights;
    }
}
