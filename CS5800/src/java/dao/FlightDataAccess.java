/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import DB_Util.DB_Util;
import Model.Flight;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
            ps.setString(2, n.getTime());
            ps.setString(3, n.getOrigin());
            ps.setString(4, n.getDestination());
            ps.setString(5, n.getAirplane_id());
            ps.setDouble(6, n.getPrice());
            ps.executeUpdate();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
      public List<Flight> getAll() {
        List<Flight> ls = new ArrayList<>();

        try {
            ResultSet rs = DB_Util.getPreparedStatement("select * from flight").executeQuery();
            while (rs.next()) {
                Flight n = new Flight(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),rs.getDouble(6));
                ls.add(n);

            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }

        return ls;
    }
}
