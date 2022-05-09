package entity;

import api.GovernorateApi;
import api.SickHealthCenterApi;
import api.SickInfectionApi;
import api.SickSymptomApi;
import api.StateApi;
import java.sql.SQLException;
import java.util.List;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Matrix
 */
public class Sick {
    public int sick_id;
    public String sick_name;
    public String address;
    public int phone;
    public int mobile;
    public int governorate_id;
    public int state_id;
    public int nationality_number;
    public int identity_number;
    public String mail;
    public SickInfection infection;
    public List<SickSymptom>symptoms;
    public State state;
    public SickHealthCenter sickHealthCenter;
    public Governorate governorate;
    
    public static final String SICK_ID="sick_id";
    public static final String SICK_NAME="sick_name";
    public static final String ADDRESS="address";
    public static final String MOBILE="mobile";
    public static final String PHONE="phone";
    public static final String VOERNORATE_ID="governorate_id";
    public static final String NATIOPNALITY_NUMBER="nationality_number";
    public static final String IDENTITY_NUMBER="identity_number";
    public static final String MAIL="mail";
    public static final String STATE_ID="state_id";

    public Sick(Sick s)throws SQLException{
        this.sick_id = s.sick_id;
        this.sick_name = s.sick_name;
        this.address = s.address;
        this.phone =s. phone;
        this.mobile = s.mobile;
        this.governorate_id =s. governorate_id;
        this.state_id = s.state_id;
        this.nationality_number = s.nationality_number;
        this.identity_number = s.identity_number;
        this.mail = s.mail;
        
        infection=SickInfectionApi.get(sick_id);
        symptoms=SickSymptomApi.get(sick_id);
        state=StateApi.get(state_id);
        governorate=GovernorateApi.get(governorate_id);
        sickHealthCenter=SickHealthCenterApi.get_by_sick_id(sick_id);
        
    }
    
    public boolean is_suspect(){
        if(state_id==State.SUSPECT)
            return true;
        return false;
    }
    
    public Sick(int sick_id, String sick_name, String address, int phone, int mobile, int nationality_number, int identity_number, String mail, int state_id, int governorate_id) throws SQLException{
        this.sick_id = sick_id;
        this.sick_name = sick_name;
        this.address = address;
        this.phone = phone;
        this.mobile = mobile;
        this.governorate_id = governorate_id;
        this.state_id = state_id;
        this.nationality_number = nationality_number;
        this.identity_number = identity_number;
        this.mail = mail;
        
          
//        infections=SickInfectionApi.get(sick_id);
//        symptoms=SickSymptomApi.get(sick_id);
//        state=StateApi.get(state_id);
//        sickHealthCenter=SickHealthCenterApi.get_by_sick_id(sick_id);
    }
    

    public Sick(String sick_name, String address, int phone, int mobile, int governorate_id, int state_id, int nationality_number, int identity_number, String mail) {
        this.sick_name = sick_name;
        this.address = address;
        this.phone = phone;
        this.mobile = mobile;
        this.governorate_id = governorate_id;
        this.state_id = state_id;
        this.nationality_number = nationality_number;
        this.identity_number = identity_number;
        this.mail = mail;
    }
    
    public Sick(){
        this.sick_id=0;
    }
    
}
