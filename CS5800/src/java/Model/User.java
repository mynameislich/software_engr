/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Zuoyuan
 */
public class User {

    String m_email;
    String m_password;
    String m_address;
    String m_zipcode;
    String m_firstname;
    String m_lastname;
    int m_loggedin;
    int m_work_id;
    int m_valid;
    int m_age;
    String m_phone;
    String m_gender;
    int m_confirmed;

    public User(String email, String password, String address, String zipcode, String firstname, String lastname, int loggedin, int work_id, int valid, int age, String phone, String gender, int confirm) {
        m_email = email;
        m_password = password;
        m_address = address;
        m_zipcode = zipcode;
        m_firstname = firstname;
        m_lastname = lastname;
        m_loggedin = loggedin;
        m_work_id = work_id;
        m_valid = valid;
        m_age = age;
        m_phone = phone;
        m_gender = gender;
        m_confirmed = confirm;
    }

    public void setId(String input) {
        m_email = input;
    }
    public void comfirmIt(int code){
        m_confirmed = code;
    }
    public int getComfirm(){
        return m_confirmed;
    }
    public void setPass(String input) {
        m_password = input;
    }

    public void setAdr(String input) {
        m_address = input;
    }

    public void setZip(String input) {
        m_zipcode = input;
    }

    public void setFirstName(String input) {
        m_firstname = input;
    }

    public void setLastName(String input) {
        m_lastname = input;
    }

    public void setLog(int input) {
        m_loggedin = input;
    }

    public void setWork(int input) {
        m_work_id = input;
    }

    public void setValid(int input) {
        m_valid = input;
    }

    public void setAge(int input) {
        m_age = input;
    }

    public void setPhone(String input) {
        m_phone = input;
    }

    public void setGender(String input) {
        m_gender = input;
    }

    public String getId() {
        return m_email;
    }

    public String getPass() {
        return m_password;
    }

    public String getAdr() {
        return m_address;
    }

    public String getZip() {
        return m_zipcode;
    }

    public String getFirstName() {
        return m_firstname;
    }

    public String getLastName() {
        return m_lastname;
    }

    public int getLog() {
        return m_loggedin;
    }

    public int getWork() {
        return m_work_id;
    }

    public int getValid() {
        return m_valid;
    }

    public int getAge() {
        return m_age;
    }

    public String getPhone() {
        return m_phone;
    }

    public String getGender() {
        return m_gender;
    }
}
