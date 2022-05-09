/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import data.DBConnection;
import java.sql.ResultSet;
import entity.Governorate;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Matrix
 */
public class GovernorateApi {
      private static Statement db=DBConnection.getConnection();
    
    public static  List<Governorate> get_all()throws SQLException{
        String sql="select * from governorates";
        
        ResultSet r=db.executeQuery(sql);
        List<Governorate> gs=new ArrayList<>();
        while(r.next()){
            Governorate s=new Governorate(r.getInt(1), r.getString(2));
            gs.add(s);
        }
        
        return gs;
    }
    
    public static   Governorate get(int governorate_id)throws SQLException{
        String sql="select * from governorates where governorate_id="+governorate_id;
        
        ResultSet r=db.executeQuery(sql);
        Governorate g=new Governorate();
        if(r.next()){
            g=new Governorate(r.getInt(1), r.getString(2));
        }
        
        return g;
    }
}
