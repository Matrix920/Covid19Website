/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import data.DBConnection;
import java.sql.SQLException;
import java.sql.Statement;
import entity.State;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Matrix
 */
public class StateApi {
    private static Statement db=DBConnection.getConnection();
    
    public static  List<State> get_all()throws SQLException{
        String sql="select * from states";
        
        ResultSet r=db.executeQuery(sql);
        List<State> states=new ArrayList<>();
        while(r.next()){
            State s=new State(r.getInt(1), r.getString(2));
            states.add(s);
        }
        
        return states;
    }
    
    public static  List<State> get_all_sicks()throws SQLException{
        String sql="select * from states where state_id!="+State.SUSPECT;
        
        ResultSet r=db.executeQuery(sql);
        List<State> states=new ArrayList<>();
        while(r.next()){
            State s=new State(r.getInt(1), r.getString(2));
            states.add(s);
        }
        
        return states;
    }
    
    public static State get(int state_id)throws SQLException{
        String sql=String.format("select * from states where state_id=%d", state_id);
        
        ResultSet r=db.executeQuery(sql);
        State s=new State();
        if(r.next()){
            s=new State(r.getInt(1), r.getString(2));
        }
        return s;
    }
}
