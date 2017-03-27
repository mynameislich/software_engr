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
public class Bank_acc {

    String acc_id;
    String acc_holder_name;
    double balance;

    public Bank_acc(String m_acc_id, String m_acc_holder_name, double m_balance) {
        acc_id = m_acc_id;
        acc_holder_name = m_acc_holder_name;
        balance = m_balance;
    }

    public void setId(String m_acc_id) {
        acc_id = m_acc_id;
    }

    public void setName(String m_acc_holder_name) {
        acc_holder_name = m_acc_holder_name;
    }

    public void setBalance(double m_balance) {
        balance = m_balance;
    }

    public String getId() {
        return acc_id;
    }

    public String getName() {
        return acc_holder_name;
    }

    public double getBalance() {
        return balance;
    }
}
