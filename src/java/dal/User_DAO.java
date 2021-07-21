/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
public class User_DAO extends DBContext {

    public boolean checkLogin(String account, String password) {
        // check xem acc có tồn tại trong DB hay ko
        try {
            String sql = "select * from tblUser where account=? and password=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, account);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error check login: " + e.getMessage());
        }

        return false;
    }
}
