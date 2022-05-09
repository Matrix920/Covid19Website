package entity;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Matrix
 */
public class Governorate {
    public int governorate_id;
    public String governorate_name;
    
    public static final String ID="governorate_id";
    public static final String NAME="governorate_name";
    
    public Governorate(int governorate_id,String governorate_name){
        this.governorate_id=governorate_id;
        this.governorate_name=governorate_name;
    }

    public Governorate() {
        this.governorate_id=0;
    }
    
    
    
}
