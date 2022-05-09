/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import data.DBConnection;
import java.sql.SQLException;
import java.sql.Statement;
import entity.SickHealthCenter;
import java.sql.ResultSet;

/**
 *
 * @author Matrix
 */
public class SickHealthCenterApi {
     private static Statement db=DBConnection.getConnection();
    
    public static void add(SickHealthCenter s) throws SQLException{
        if(!check_sick_exist(s.sick_id)){
        String sql=String.format("insert into sick_health_centers("
                + "sick_id,"
                + "health_center_id)"+
                "values(%d,%d)",
                s.sick_id,
                s.health_center_id);
        
        db.execute(sql);
        }
    }
    
    public static void update(SickHealthCenter s)throws SQLException{
        String sql=String.format("update sick_health_centers set health_center_id=%d",s.sick_health_center_id);
        db.execute(sql);
    }
    
    public static void delete(SickHealthCenter s)throws SQLException{
        String sql=String.format("delete from sick_health_centers where sick_health_id=%d", s.sick_health_center_id);
        db.execute(sql);
    }
    
     public static void delete(int id)throws SQLException{
        String sql=String.format("delete from sick_health_centers where sick_health_id=%d", id);
        db.execute(sql);
    }
     
     
    public static boolean check_sick_exist(int sick_id)throws SQLException{
        if(get_by_sick_id(sick_id).health_center_id==0)
            return false;
        return true;
    }
    
    public static SickHealthCenter get_by_sick_id(int sick_id)throws SQLException{
         String sql=String.format("select * from sick_health_centers where sick_id=%d", sick_id);
        
        SickHealthCenter s=new SickHealthCenter();
        ResultSet res=db.executeQuery(sql);
        if(res.next()){
            s=new SickHealthCenter(res.getInt(1),res.getInt(2),res.getInt(3));
        }
        
        return s;
    }
    
    public static SickHealthCenter get_by_id(int id)throws SQLException{
          String sql=String.format("select * from sick_health_centers whrere sick_health_center_id=%d", id);
        
        SickHealthCenter s=new SickHealthCenter();
        ResultSet res=db.executeQuery(sql);
        if(res.next()){
            s=new SickHealthCenter(res.getInt(1),res.getInt(2),res.getInt(3));
        }
        
        return s;
    }
}
