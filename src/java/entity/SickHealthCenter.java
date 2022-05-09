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
public class SickHealthCenter {
    public int sick_health_center_id;
    public int sick_id;
    public int health_center_id;

    public SickHealthCenter(int sick_health_center_id, int sick_id, int health_center_id) {
        this.sick_health_center_id = sick_health_center_id;
        this.sick_id = sick_id;
        this.health_center_id = health_center_id;
    }
    public SickHealthCenter(){
        this.sick_health_center_id=0;
    }
    
}
