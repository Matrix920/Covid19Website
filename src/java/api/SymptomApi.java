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
import java.util.List;
import entity.Symptom;

/**
 *
 * @author Matrix
 */
public class SymptomApi {
    private static Statement db=DBConnection.getConnection();
    
    public static  List<Symptom> get_all()throws SQLException{
        String sql="select * from symptoms";
        
        ResultSet r=db.executeQuery(sql);
        List<Symptom> symptoms=new ArrayList<>();
        while(r.next()){
            Symptom s=new Symptom(r.getInt(1), r.getString(2));
            symptoms.add(s);
        }
        
        return symptoms;
    }
    
    public static Symptom get(int symptom_id)throws SQLException{
        String sql=String.format("select * from symptoms where symptom_id=%d", symptom_id);
        
        ResultSet r=db.executeQuery(sql);
        Symptom s=new Symptom();
        if(r.next()){
            s=new Symptom(r.getInt(1), r.getString(2));
        }
        return s;
    }
}
