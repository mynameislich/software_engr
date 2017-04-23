/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import DB_Util.DB_Util;
import Model.Flight;
import static com.sun.xml.bind.util.CalendarConv.formatter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LICH
 */
public class FlightDataAccess {
    public FlightDataAccess(){}
     public void addNew(Flight n){
      try {
            PreparedStatement ps = DB_Util.getPreparedStatement("insert into flight values(?,?,?,?,?,?)");
            ps.setString(1, n.getId());
            ps.setString(2, n.getArrivingTime2());
            ps.setString(3, n.getDepartingTime2());
            ps.setString(5, n.getOrigin());
            ps.setString(6, n.getDestination());
            ps.setString(4, n.getAirplane_id());
            ps.setDouble(7, n.getPrice());
            ps.setString(8,n.getFrequency());
            ps.executeUpdate();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
      public static List<Flight> getAll() throws ParseException {
        List<Flight> ls = new ArrayList<>();

        try {
            ResultSet rs = DB_Util.getPreparedStatement("select * from flight").executeQuery();
            while (rs.next()) {
                DateFormat formatter = null; 
                Flight n = new Flight(rs.getString(1),  (Date)formatter.parse(rs.getString(2)),(Date)formatter.parse(rs.getString(3)) ,rs.getString(3), rs.getString(4),rs.getString(5),rs.getDouble(6), rs.getString(7));
                ls.add(n);
            }
        } catch (ClassNotFoundException | SQLException ex) {

            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }

        return ls;
    }
}
