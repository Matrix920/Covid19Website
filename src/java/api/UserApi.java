/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import data.DBConnection;
import java.sql.Statement;
import entity.User;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Matrix
 */
public class UserApi {
    private static Statement db=DBConnection.getConnection();
    
    public static User login(String username,String password)throws SQLException{
        String sql=String.format("select * from users where username='%s' AND password='%s'", username,password);
        
        ResultSet r=db.executeQuery(sql);
        User user=new User();
        if(r.next()){
            user=new User(r.getInt(1), r.getString(2), r.getString(3));
        }
        
        return user;
    }
    
    public static boolean check_login(String username,String password)throws SQLException{
        User user=login(username, password);
        if(user.user_id==0)
            return false;
        return true;
    }
}
