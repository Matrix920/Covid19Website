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
public class Symptom {
    public int symptom_id;
    public String symptom_name;
    
    public Symptom(int symptom_id,String symptom_name){
        this.symptom_id=symptom_id;
        this.symptom_name=symptom_name;
    }

    public Symptom() {
        this.symptom_id=0;
    }
    
    
}
