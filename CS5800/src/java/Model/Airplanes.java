/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Emily, LICH
 */
public class Airplanes {
   String airplane_id;
   String plane_type;
   String description;
   
   public Airplanes(String airplane_id, String plane_type, String description)
   {
       this.airplane_id = airplane_id;
       this.plane_type = plane_type;
       this.description = description;
   
   }
   public void setAirplaneID(String id)
   {
        this.airplane_id = id;
   }

   public void setPlaneType(String plane_type)
   {
        this.plane_type = plane_type;
   }
   public void setDescription(String description)
   {
       this.description = description;
   }
   
    public String getAirplaneID()
   {
       return this.airplane_id;
   }

   public String getPlaneType()
   {
        return this.plane_type;
   }
   public String getDescription()
   {
       return this.description;
   }
   
    
}

