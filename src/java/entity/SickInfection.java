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
public class SickInfection {
    public int sick_infection_id;
    public int sick_id;
    public int infection_id;

    public SickInfection(int sick_infection_id, int sick_id, int infection_id) {
        this.sick_infection_id = sick_infection_id;
        this.sick_id = sick_id;
        this.infection_id = infection_id;
    }

    public SickInfection() {
        this.sick_infection_id=0;
    }
    
    
}
