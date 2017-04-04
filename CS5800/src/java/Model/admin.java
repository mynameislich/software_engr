/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author LICH
 */
public class admin {

    String m_email;
    String m_user;
    String m_pass;

    public admin() {
    }

    public admin(String email, String userName, String password) {
        m_email = email;
        m_user = userName;
        m_pass = password;
    }

    public String getId() {
        return m_email;
    }

    public String getName() {
        return m_user;
    }

    public String getPass() {
        return m_pass;
    }

}
