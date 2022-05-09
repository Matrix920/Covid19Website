/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import java.sql.Statement;
import data.DBConnection;
import entity.Sick;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import entity.SickInfection;
import entity.SickSymptom;
import entity.Symptom;
import entity.State;
/**
 *
 * @author Matrix
 */
public class SickApi {
    
    private static Statement db=DBConnection.getConnection();
    
    public static List<Sick> get_all()throws SQLException{
        String sql="select * from sicks";
        
        ResultSet res=db.executeQuery(sql);
        
        List<Sick>sicks=new ArrayList<Sick>();
        
        while(res.next()){
            Sick s=new Sick(res.getInt(1), res.getString(2), res.getString(3),res.getInt(4), res.getInt(5),res.getInt(6), res.getInt(7),res.getString(8),res.getInt(9), res.getInt(10));
            sicks.add(s);
            
        }
        return sicks;
    }
    
    public static List<Sick> get_suspects()throws SQLException{
        
        List<Sick>sicks=get_all();
        
        List<Sick>suspects=new ArrayList<>();
        for(Sick s : sicks)
            if(s.is_suspect())
                suspects.add(new Sick(s));
        return suspects;
    }
    
    public static List<Sick> get_injuries()throws SQLException{
        
        List<Sick>sicks=get_all();
        
        List<Sick>injuries=new ArrayList<>();
        for(Sick s : sicks)
            if(! s.is_suspect())
                injuries.add(new Sick(s));
        return injuries;
    }
    
    public static List<Sick> get_healthies()throws SQLException{
        String sql="select * from sicks where state_id="+State.HEALTHY;
        
        ResultSet res=db.executeQuery(sql);
        
        List<Sick>sicks=new ArrayList<Sick>();
        
        while(res.next()){
            Sick s=new Sick(res.getInt(1), res.getString(2), res.getString(3),res.getInt(4), res.getInt(5),res.getInt(6), res.getInt(7),res.getString(8),res.getInt(9), res.getInt(10));
            sicks.add(s);
            
        }
        return sicks;
    }

    public static List<Sick> get_deads()throws SQLException{
        String sql="select * from sicks where state_id="+State.DEAD;
        
        ResultSet res=db.executeQuery(sql);
        
        List<Sick>sicks=new ArrayList<Sick>();
        
        while(res.next()){
            Sick s=new Sick(res.getInt(1), res.getString(2), res.getString(3),res.getInt(4), res.getInt(5),res.getInt(6), res.getInt(7),res.getString(8),res.getInt(9), res.getInt(10));
            sicks.add(s);
            
        }
        return sicks;
    }
    //____________________________________________
    
    public static List<Sick> get_healthies(int governorate_id)throws SQLException{
        String sql="select * from sicks where state_id="+State.HEALTHY+" and governorate_id="+governorate_id;
        
        ResultSet res=db.executeQuery(sql);
        
        List<Sick>sicks=new ArrayList<Sick>();
        
        while(res.next()){
            Sick s=new Sick(res.getInt(1), res.getString(2), res.getString(3),res.getInt(4), res.getInt(5),res.getInt(6), res.getInt(7),res.getString(8),res.getInt(9), res.getInt(10));
            sicks.add(s);
            
        }
        return sicks;
    }
    public static List<Sick> get_suspects(int governorate_id)throws SQLException{
        String sql="select * from sicks where state_id="+State.SUSPECT+" and governorate_id="+governorate_id;
        
        ResultSet res=db.executeQuery(sql);
        
        List<Sick>sicks=new ArrayList<Sick>();
        
        while(res.next()){
            Sick s=new Sick(res.getInt(1), res.getString(2), res.getString(3),res.getInt(4), res.getInt(5),res.getInt(6), res.getInt(7),res.getString(8),res.getInt(9), res.getInt(10));
            sicks.add(s);
            
        }
        return sicks;
    }
    
    public static List<Sick> get_injuries(int governorate_id)throws SQLException{
        String sql="select * from sicks where state_id="+State.INJURED+" and governorate_id="+governorate_id;
        
        ResultSet res=db.executeQuery(sql);
        
        List<Sick>sicks=new ArrayList<Sick>();
        
        while(res.next()){
            Sick s=new Sick(res.getInt(1), res.getString(2), res.getString(3),res.getInt(4), res.getInt(5),res.getInt(6), res.getInt(7),res.getString(8),res.getInt(9), res.getInt(10));
            sicks.add(s);
            
        }
        return sicks;
    }
    
    public static List<Sick> get_deads(int governorate_id)throws SQLException{
        String sql="select * from sicks where state_id="+State.DEAD+" and governorate_id="+governorate_id;
        
        ResultSet res=db.executeQuery(sql);
        
        List<Sick>sicks=new ArrayList<Sick>();
        
        while(res.next()){
            Sick s=new Sick(res.getInt(1), res.getString(2), res.getString(3),res.getInt(4), res.getInt(5),res.getInt(6), res.getInt(7),res.getString(8),res.getInt(9), res.getInt(10));
            sicks.add(s);
            
        }
        return sicks;
    }
    //___________________________________________
    public static List<Sick> get_all_by_governorate(int governorate_id)throws SQLException{
        String sql="select * from sicks where governorate_id="+governorate_id;
        
        ResultSet res=db.executeQuery(sql);
        
        List<Sick>sicks=new ArrayList<Sick>();
        
        while(res.next()){
            Sick s=new Sick(res.getInt(1), res.getString(2), res.getString(3),res.getInt(4), res.getInt(5),res.getInt(6), res.getInt(7),res.getString(8),res.getInt(9), res.getInt(10));
            sicks.add(s);
            
        }
        return sicks;
    }
    public static Sick get(int sick_id)throws SQLException{
        String sql=String.format("select * from sicks where sick_id=%d", sick_id);
        
        Sick s=new Sick();
        ResultSet res=db.executeQuery(sql);
        if(res.next()){
            s=new Sick(res.getInt(1), res.getString(2), res.getString(3),res.getInt(4), res.getInt(5),res.getInt(6), res.getInt(7),res.getString(8),res.getInt(9), res.getInt(10));
        }

        return new Sick(s);
    }
    
    
    public static int add(Sick sick) throws SQLException{
        String sql=String.format("insert into sicks("
                + "sick_name,"
                + "address,"
                + "phone,"
                + "mobile,"
                + "nationality_number,"
                + "identity_number,"
                + "mail,"
                + "state_id,"
                + "governorate_id)values('%s','%s',%d,%d,%d,%d,'%s',%d,%d)",
                sick.sick_name,
                sick.address,
                sick.phone,
                sick.mobile,
                sick.nationality_number,
                sick.identity_number,
                sick.mail,
                sick.state_id,
                sick.governorate_id);
        
        db.execute(sql);
        return get_last_id();
    }
    
    public static int get_last_id()throws SQLException{
         String sql="select * from sicks order by sick_id desc";
        
         int id=0;
        
         ResultSet res=db.executeQuery(sql);
        if(res.next())
            id=res.getInt(1);

        return id;
    }
    
    public  static void update(Sick sick) throws SQLException{
        String sql=String.format("update sicks set "
                + "sick_name='%s',"
                + "address='%s',"
                + "phone=%d,"
                + "mobile=%d,"
                + "nationality_number=%d"
                + "identity_number=%d"
                + "mail='%s'"
                + "state_id=%d"
                + "governorate_id=%d"
                + "where sick_id=%id",
                sick.sick_name,
                sick.address,
                sick.phone,
                sick.mobile,
                sick.nationality_number,
                sick.identity_number,
                sick.mail,
                sick.state_id,
                sick.governorate_id,
                sick.sick_id);
        
        db.execute(sql);
    }
     
    public  static void update_state(Sick sick) throws SQLException{
        String sql=String.format("update sicks set "
                + "state_id=%d"
                + "where sick_id=%id",
                sick.state_id,
                sick.sick_id);
        
        db.execute(sql);
    }
      
    public  static void update_state(int sick_id,int state_id) throws SQLException{
        String sql=String.format("update sicks set "
                + "state_id=%d "
                + "where sick_id=%d",
                state_id,
                sick_id);
        
        db.execute(sql);
    }
}
