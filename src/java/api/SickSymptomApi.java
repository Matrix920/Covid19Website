/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import data.DBConnection;
import entity.SickSymptom;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Matrix
 */
public class SickSymptomApi {
      private static Statement db=DBConnection.getConnection();
     
     public static void add(SickSymptom s)throws SQLException{
         String sql=String.format("insert into sick_symptoms(sick_id,symptom_id) values(%d,%d)", s.sick_id,s.symptom_id);
         db.execute(sql);
     }
     
     public static List<SickSymptom>get(int sick_id)throws SQLException{
         String sql=String.format("select * from sick_symptoms where sick_id=%d",sick_id);
         
         List<SickSymptom> ss=new ArrayList<>();
         ResultSet r=db.executeQuery(sql);
         while(r.next()){
             SickSymptom s=new SickSymptom(r.getInt(1), r.getInt(2),r.getInt(3));
             ss.add(s);
         }
         
         return ss;
     }
}
