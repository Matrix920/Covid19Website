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
public class SickSymptom {
    public int sick_symptom_id;
    public int sick_id;
    public int symptom_id;

    public SickSymptom(int sick_symptom_id, int sick_id, int symptom_id) {
        this.sick_symptom_id = sick_symptom_id;
        this.sick_id = sick_id;
        this.symptom_id = symptom_id;
    }
    
    
}
