/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import DB_Util.DB_Util;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import Model.Airport;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Zuoyuan
 */
public class AirportDataAccess {

    public AirportDataAccess() {
    }

    public void addNew(Airport n) {

        try {
            PreparedStatement ps = DB_Util.getPreparedStatement("insert into airports values(?,?,?,?)");
            ps.setInt(1, n.getId());
            ps.setString(3, n.getName());
            ps.setString(2, n.getAbbr());
            ps.setString(4, n.getLoc());

            ps.executeUpdate();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Airport> getAll() {
        List<Airport> ls = new ArrayList<>();

        try {
            ResultSet rs = DB_Util.getPreparedStatement("select * from airports").executeQuery();
            while (rs.next()) {
                Airport n = new Airport(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
                ls.add(n);

            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }

        return ls;
    }

}
