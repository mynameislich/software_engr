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
public class Airplane_type {

    int m_id = 0;
    int m_seat_num = 0;
    float m_speed = 0;
    String m_description = "";

    public Airplane_type() {
    }

    public Airplane_type(int id, int seat_num, float speed, String description) {
        m_id = id;
        m_seat_num = seat_num;
        m_speed = speed;
        m_description = description;
    }

    public int getId() {
        return m_id;
    }

    public String getDesc() {
        return m_description;
    }

    public void setDesc(String input) {
        m_description = input;
    }

    public int getmSeatNum() {
        return m_seat_num;
    }

    public float getSpeed() {
        return m_speed;
    }

    public void setId(int input) {
        m_id = input;
    }

    public void setmSeatNum(int input) {
        m_seat_num = input;
    }

    public void setSpeed(float input) {
        m_speed = input;
    }

}
