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
public class Infection {
    public int infection_id;
    public String infection_name;
    
    public Infection(int infection_id,String infection_name){
        this.infection_id=infection_id;
        this.infection_name=infection_name;
    }

    public Infection() {
        this.infection_id=0;
    }
    
}
