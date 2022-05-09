/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Matrix
 */
public class User {
    public int user_id;
    public String username;
    public String password;
    public boolean is_login;
    
    public static final String IS_LOGIN="is_login";
    public static final String USERNAME="username";
    public static final String PASSWORD="password";

    public User(int user_id, String username, String password) {
        this.user_id = user_id;
        this.username = username;
        this.password = password;
    }

    public User() {
        this.user_id=0;
        this.is_login=false;
    }
    
    
}
