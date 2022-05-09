/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import data.DBConnection;
import entity.Infection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Matrix
 */
public class InfectionApi {
    private static Statement db=DBConnection.getConnection();
    
    public static  List<Infection> get_all()throws SQLException{
        String sql="select * from infections";
        
        ResultSet r=db.executeQuery(sql);
        List<Infection> infections=new ArrayList<>();
        while(r.next()){
            Infection s=new Infection(r.getInt(1), r.getString(2));
            infections.add(s);
        }
        
        return infections;
    }
    
    public static Infection get(int infection_id)throws SQLException{
        String sql=String.format("select * from infections where infection_id=%d", infection_id);
        
        ResultSet r=db.executeQuery(sql);
        Infection s=new Infection();
        if(r.next()){
            s=new Infection(r.getInt(1), r.getString(2));
        }
        return s;
    }
}
