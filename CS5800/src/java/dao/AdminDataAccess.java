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

import Model.Admin;

/**
 *
 * @author Zuoyuan
 */
public class AdminDataAccess {

    public AdminDataAccess() {
    }

    public void addNewAdmin(Admin n) {

        try {
            PreparedStatement ps = DB_Util.getPreparedStatement("insert into admin values(?,?,?)");
            ps.setString(1, n.getId());
            ps.setString(2, n.getName());
            ps.setString(3, n.getPass());

            ps.executeUpdate();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Admin matchManager(String userName, String pass) {
        Admin n = new Admin();
        try {
            String sql = "call matchAdmin(? , ?)";
            PreparedStatement ps = DB_Util.getPreparedStatement(sql);
            ps.setString(1, userName);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                n = new Admin(rs.getString(1), rs.getString(2), rs.getString(3));
            } else {
                return null;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Admin matchAdmin(String userName, String password) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
