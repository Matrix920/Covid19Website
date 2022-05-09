package entity;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import api.GovernorateApi;
import java.sql.SQLException;

public class HealthCenter {
    public int health_center_id;
    public String health_center_name;
    public int governorate_id;
    
    public Governorate governorate;
    
    public static final String NAME="health_center_name";
    public static final String ID="health_center_id";
    
    public HealthCenter(int health_center_id,String health_center_name,int governorate_id)throws SQLException{
        this.health_center_id=health_center_id;
        this.health_center_name=health_center_name;
        this.governorate_id=governorate_id;       
    }
    
    public HealthCenter(HealthCenter h)throws SQLException{
        this.health_center_id=h.health_center_id;
        this.health_center_name=h.health_center_name;
        this.governorate_id=h.governorate_id;
        
        governorate=GovernorateApi.get(governorate_id);
    }
    public HealthCenter(){
        this.health_center_id=0;
    }
    
    public boolean isEmpty(){
        return health_center_id==0;
    }
}
