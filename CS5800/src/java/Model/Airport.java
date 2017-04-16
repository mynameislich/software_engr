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
public class Airport {
    int m_id;
    String m_name; 
    String m_abbr;     // abbreviation
    String m_location; // address
    
    public Airport(){}
    public Airport(int id, String name, String abbr, String loc){
        m_id = id;
        m_name = name;
        m_abbr = abbr;
        m_location = loc;
    }
    public void setId(int id){
        m_id = id;
    }
    
    public void setName(String name){
        m_name = name;
    }
    
    public void setAbbr(String Abbr){
        m_abbr = Abbr;
    }
    
    public void setLoc(String loc){
        m_location = loc;
    }
    
    public int getId(){
        return m_id;
    }
    public String getName(){
        return m_name;
    }
    public String getAbbr(){
        return m_abbr;
    }
    public String getLoc(){
        return m_location;
    }
}
