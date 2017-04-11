/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import DB_Util.DB_Util;
import Model.Airplanes;
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
public class AirplaneDataAccess {
    public AirplaneDataAccess(){}
     public void addNew(Airplanes n){
      try {
            PreparedStatement ps = DB_Util.getPreparedStatement("insert into airplane values(?,?,?)");
            ps.setString(1, n.getAirplaneID());
            ps.setString(2, n.getPlaneType());
            ps.setString(3, n.getDescription());
            
            ps.executeUpdate();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
     }
      public static List<Airplanes> getAllType() {
        List<Airplanes> ls = new ArrayList<>();

        try {
            ResultSet rs = DB_Util.getPreparedStatement("select * from flight").executeQuery();
            while (rs.next()) {
                Airplanes n = new Airplanes(rs.getString(1), rs.getString(2), rs.getString(3));
                ls.add(n);

            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }

        return ls;
    }
}
