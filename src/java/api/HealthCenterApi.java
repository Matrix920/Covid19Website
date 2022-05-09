/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import data.DBConnection;
import java.sql.SQLException;
import java.sql.Statement;
import entity.HealthCenter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Matrix
 */
public class HealthCenterApi {
     private static Statement db=DBConnection.getConnection();
     
     public static void add(HealthCenter h)throws SQLException{
         String sql=String.format("insert into health_centers(governorate_id,health_center_name)values(%d,'%s')", h.governorate_id,h.health_center_name);
         db.execute(sql);
     }
     
     public static void update(HealthCenter h)throws SQLException{
         String sql=String.format("update health_centers set governorate_id=%d,health_center_name='%s' where health_center_id=%d", h.governorate_id,h.health_center_name,h.health_center_id);
         db.execute(sql);
     }
     
     public static List<HealthCenter> get_all()throws SQLException{
         String sql="select * from health_centers";
         
         ResultSet r=db.executeQuery(sql);
         List<HealthCenter> hs=new ArrayList<>();
         while(r.next()){
             HealthCenter h=new HealthCenter(r.getInt(1), r.getString(3), r.getInt(2));
             hs.add(h);
         }
         
         List<HealthCenter> hss=new ArrayList<>();
         for(HealthCenter h:hs){
             hss.add(new HealthCenter(h));
         }
         
         return hss;
     }
     
     public static void delete(int id)throws SQLException{
         String sql=String.format("delete from health_centers where health_center_id=%d", id);
         db.execute(sql);
     }
     
     public static HealthCenter get(int id)throws SQLException{
         String sql=String.format("select * from health_centers where health_center_id=%d", id);
         
         ResultSet r=db.executeQuery(sql);
         HealthCenter h=new HealthCenter();
         if(r.next()){
             h=new HealthCenter(r.getInt(1), r.getString(3), r.getInt(2));
         }
         
         return h;
     }
}
