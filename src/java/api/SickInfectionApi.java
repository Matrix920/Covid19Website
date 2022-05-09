/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import data.DBConnection;
import java.sql.Statement;
import entity.SickInfection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Matrix
 */
public class SickInfectionApi {
     private static Statement db=DBConnection.getConnection();
     
     public static void add(SickInfection s)throws SQLException{
         String sql=String.format("insert into sick_infections(sick_id,infection_id) values(%d,%d)", s.sick_id,s.infection_id);
         db.execute(sql);
     }
     
     public static SickInfection get(int sick_id)throws SQLException{
         String sql=String.format("select * from sick_infections where sick_id=%d",sick_id);
         
         SickInfection infection= new SickInfection();
         ResultSet r=db.executeQuery(sql);
         if(r.next()){
             infection=new SickInfection(r.getInt(1), r.getInt(2),r.getInt(3));
         }
         
         return infection;
     }
}
