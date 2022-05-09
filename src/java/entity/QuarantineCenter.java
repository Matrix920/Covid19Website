package entity;

import api.GovernorateApi;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Matrix
 */
public class QuarantineCenter {
    public int quarantine_center_id;
    public String quarantine_center_name;
    public int governorate_id;
    public static final String NAME="quarantine_center_name";
    public static final String ID="quarantine_center_id";
    public Governorate governorate;
    
    public boolean isEmpty(){
        return quarantine_center_id==0;
    }
    public QuarantineCenter(int quarantine_center_id,String quarantine_center_name,int governorate_id){
        this.quarantine_center_id=quarantine_center_id;
        this.quarantine_center_name=quarantine_center_name;
        this.governorate_id=governorate_id;
    }
    
    public QuarantineCenter(QuarantineCenter q)throws SQLException{
        this.quarantine_center_id=q.quarantine_center_id;
        this.quarantine_center_name=q.quarantine_center_name;
        this.governorate_id=q.governorate_id;
        
        this.governorate=GovernorateApi.get(q.governorate_id);
    }

    public QuarantineCenter() {
        this.quarantine_center_id=0;
    }
   
    
    
}
