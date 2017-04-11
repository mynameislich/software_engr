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

import Model.Airplane_type;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Zuoyuan
 */
public class TypeDataAccess {

    public TypeDataAccess() {
    }

    public void addNewType(Airplane_type n) {

        try {
            PreparedStatement ps = DB_Util.getPreparedStatement("insert into airplane_type values(?,?,?)");
            ps.setInt(1, n.getId());
            ps.setInt(2, n.getmSeatNum());
            ps.setFloat(3, n.getSpeed());

            ps.executeUpdate();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
public static List<Airplane_type> getAllType() {
        List<Airplane_type> ls = new ArrayList<>();

        try {
            ResultSet rs = DB_Util.getPreparedStatement("select * from airplane_type").executeQuery();
            while (rs.next()) {
                Airplane_type n = new Airplane_type(rs.getInt(1), rs.getInt(2), rs.getFloat(3), rs.getString(4));
                ls.add(n);

            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }

        return ls;
    }

    
}
