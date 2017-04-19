/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.Date;

/**
 *
 * @author Emily
 */
public class Reservation {
    Date arrivingTime, departTime;
    int numPassengers;
    String currentAirport, destAirport, reservation_ID, user_ID, flight_ID, classType;
    boolean reservationStatus;
    float price;
    public Reservation(Date aTime, Date dTime, int numPeeps, String currentAirport, String destAirport, String resID, String userID, String flID, String type, float price, boolean status )    {
        this.arrivingTime = aTime;
        this.departTime = dTime;
        this.numPassengers = numPeeps;
        this.currentAirport = currentAirport;
        this.destAirport = destAirport;
        this.price = price;
        this.classType = type;
        this.reservation_ID = resID;
        this.user_ID = userID;
        this.flight_ID = flID;
        this.reservationStatus = status;
    }

    public String getReservation_ID() {
        return reservation_ID;
    }

    public void setReservation_ID(String reservation_ID) {
        this.reservation_ID = reservation_ID;
    }

    public String getUser_ID() {
        return user_ID;
    }

    public void setUser_ID(String user_ID) {
        this.user_ID = user_ID;
    }

    public String getFlight_ID() {
        return flight_ID;
    }

    public void setFlight_ID(String flight_ID) {
        this.flight_ID = flight_ID;
    }

    public String getClassType() {
        return classType;
    }

    public void setClassType(String classType) {
        this.classType = classType;
    }

    public boolean isReservationStatus() {
        return reservationStatus;
    }

    public void setReservationStatus(boolean reservationStatus) {
        this.reservationStatus = reservationStatus;
    }

    public Date getArrivingTime() {
        return arrivingTime;
    }

    public void setArrivingTime(Date arrivingTime) {
        this.arrivingTime = arrivingTime;
    }

    public Date getDepartTime() {
        return departTime;
    }

    public void setDepartTime(Date departTime) {
        this.departTime = departTime;
    }

    public int getNumPassengers() {
        return numPassengers;
    }

    public void setNumPassengers(int numPassengers) {
        this.numPassengers = numPassengers;
    }

    public String getCurrentAirport() {
        return currentAirport;
    }

    public void setCurrentAirport(String currentAirport) {
        this.currentAirport = currentAirport;
    }

    public String getDestAirport() {
        return destAirport;
    }

    public void setDestAirport(String destAirport) {
        this.destAirport = destAirport;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
    
}
