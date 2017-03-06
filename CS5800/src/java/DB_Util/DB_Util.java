/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB_Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Lich
 */
public class DB_Util {

    public static PreparedStatement getPreparedStatement(String sql) throws ClassNotFoundException, SQLException {
        PreparedStatement ps = null;
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/cs5800?autoReconnect=true&useSSL=false";;
        String user = "root";
        String pass = "lich";

        Connection con = DriverManager.getConnection(url, user, pass);
        ps = con.prepareStatement(sql);

        return ps;
    }

    //Check connections.
   /* public static void main(String[] args) throws ClassNotFoundException, SQLException {
        getPreparedStatement("select * form User");
    }*/
}
