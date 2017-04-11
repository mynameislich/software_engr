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

    int m_id;
    int m_seat_num;
    float m_speed;

    public Airplane_type() {
    }

    public Airplane_type(int id, int seat_num, float speed) {
        m_id = id;
        m_seat_num = seat_num;
        m_speed = speed;
    }

    public int getId() {
        return m_id;
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
