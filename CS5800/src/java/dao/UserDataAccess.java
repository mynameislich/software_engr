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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import Model.User;

/**
 *
 * @author Zuoyuan
 */
public class UserDataAccess {
    public UserDataAccess(){}
    public void addNewUser(User n) {

        try {
            PreparedStatement ps = DB_Util.getPreparedStatement("insert into User values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
            ps.setString(1, n.getId());
            ps.setString(2, n.getPass());
            ps.setString(3, n.getAdr());
            ps.setString(4, n.getZip());
            ps.setString(5, n.getFirstName());
            ps.setString(6, n.getLastName());
            ps.setInt(7, 0);
            ps.setInt(8, n.getWork());
            ps.setInt(10, 0);
            ps.setInt(9, n.getAge());
            ps.setString(11, n.getPhone());
            ps.setString(12, n.getGender());
            ps.setInt(13, 0);
            ps.executeUpdate();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static List<User> getAllUser() {
        List<User> ls = new ArrayList<>();

        try {
            ResultSet rs = DB_Util.getPreparedStatement("select * from User").executeQuery();
            while (rs.next()) {
                User n = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getString(11), rs.getString(12), rs.getInt(13));
                ls.add(n);

            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }

        return ls;
    }

    public void editUserSession(String email, int loggedIn) {
        try {
            String sql = "update user SET loggedin = ?" + " where email = ?";
            PreparedStatement ps = DB_Util.getPreparedStatement(sql);

            ps.setInt(1, loggedIn);
            ps.setString(2, email);
            ps.executeUpdate();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void confirm(String email, int code) {
        try {
            String sql = "update user SET confirm = ?" + " where email = ?";
            PreparedStatement ps = DB_Util.getPreparedStatement(sql);

            ps.setInt(1, code);
            ps.setString(2, email);
            ps.executeUpdate();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public User matchUser(String userName, String pass) {
        User n = new User();
        try {
            String sql = "call matchUser(? , ?)";
            PreparedStatement ps = DB_Util.getPreparedStatement(sql);
            ps.setString(1, pass);
            ps.setString(2, userName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                n = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getString(11), rs.getString(12), rs.getInt(13));
                
            }else {
                return null;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    public User matchUserById(String userName) {
        User n = new User();
        try {
            String sql = "call matchUserById(?)";
            PreparedStatement ps = DB_Util.getPreparedStatement(sql);
            
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                n = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8), rs.getInt(9), rs.getInt(10), rs.getString(11), rs.getString(12), rs.getInt(13));
                
            }else {
                return null;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDataAccess.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
}
