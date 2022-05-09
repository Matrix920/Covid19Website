/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import data.DBConnection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import entity.QuarantineCenter;
import java.util.List;

/**
 *
 * @author Matrix
 */
public class QuarantineCenterApi {
    private static Statement db=DBConnection.getConnection();
     
     public static void add(QuarantineCenter q)throws SQLException{
         String sql=String.format("insert into quarantine_centers(quarantine_center_name,governorate_id)values('%s',%d)",q.quarantine_center_name, q.governorate_id);
         db.execute(sql);
     }
     
     
     
     public static void update(QuarantineCenter q)throws SQLException{
         String sql=String.format("update quarantine_centers set governorate_id=%d,quarantine_center_name='%s' where quarantine_center_id=%d", q.governorate_id,q.quarantine_center_name,q.quarantine_center_id);
         db.execute(sql);
     }
     
     public static List<QuarantineCenter> get_all()throws SQLException{
         String sql="select * from quarantine_centers";
         
         ResultSet r=db.executeQuery(sql);
         List<QuarantineCenter> hs=new ArrayList<>();
         while(r.next()){
             QuarantineCenter h=new QuarantineCenter(r.getInt(1), r.getString(2), r.getInt(3));
             hs.add(h);
         }
         
         List<QuarantineCenter> hss=new ArrayList<>();
         for(QuarantineCenter h:hs){
             hss.add(new QuarantineCenter(h));
         }
         
         return hss;
     }
     
     public static void delete(int id)throws SQLException{
         String sql=String.format("delete from quarantine_centers where quarantine_center_id=%d", id);
         db.execute(sql);
     }
     
     public static QuarantineCenter get(int id)throws SQLException{
         String sql=String.format("select * from quarantine_centers where quarantine_center_id=%d", id);
         
         ResultSet r=db.executeQuery(sql);
         QuarantineCenter h=new QuarantineCenter();
         if(r.next()){
             h=new QuarantineCenter(r.getInt(1), r.getString(2), r.getInt(3));
         }
         
         return h;
     }
}
