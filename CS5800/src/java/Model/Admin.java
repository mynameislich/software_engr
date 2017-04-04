/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Colleen
 */
public class Admin {

    String m_email;
    String m_user;
    String m_pass;
    int loggedIn;
    public Admin() {
    }

    public Admin(String email, String userName, String password, int LoggedIn) {
        m_email = email;
        m_user = userName;
        m_pass = password;
        loggedIn = LoggedIn;
    }

    public Admin(String string, String string0, String string1) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
    public int getLoggedIn()
    {
        return loggedIn;
    }

}
