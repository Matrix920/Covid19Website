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
public class State {
    public int state_id;
    public String state_name;
    
    public static final String STATE_ID="state_id";
    
    public static final int SUSPECT=1;
    public static final int INJURED=2;
    public static final int HEALTHY=4;
    public static final int DEAD=3;
    
    public State(int state_id,String state_name){
        this.state_id=state_id;
        this.state_name=state_name;
    }

    public State() {
        this.state_id=0;
    }
    
    
}
