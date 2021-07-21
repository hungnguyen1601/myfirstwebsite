/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import Model.Feedback;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Feedback_DAO extends DBContext {

    public ArrayList<Feedback> getListFb() {
        ArrayList<Feedback> list = new ArrayList();

        // get danh sách fb từ database
        try {
            PreparedStatement ps = connection.prepareStatement("select * from tblFeedback Order By ID DESC");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString(1));
                String name = rs.getString(2);
                String subject = rs.getString(3);
                String phone = rs.getString(4);
                String massage = rs.getString(5);
                boolean display = rs.getBoolean(6);
//                if (!display) {
                    list.add(new Feedback(id, name, subject, phone, massage, display));
//                }
            }
        } catch (Exception e) {
            System.out.println("Loi getFeedback: " + e.getMessage());
        }
        return list;
    }

    public boolean addFb(Feedback feedback) {
        try {
            String sql = "insert into tblFeedback values (?,?,?,?,0)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, feedback.getName());
            ps.setString(2, feedback.getSubject());
            ps.setString(3, feedback.getPhone());
            ps.setString(4, feedback.getMassage());
            ps.executeUpdate();
            //stm.execute("insert into tblFeedback values ('" + name + "','" + subject + "','" + phone + "','" + massage + "',0)");
            return true;
        } catch (Exception e) {
            System.out.println("Insert feedback fail: " + e.getMessage());
            return false;
        }
    }

    public boolean addDisplay(Feedback feedback) {
        String sql="UPDATE tblFeedback SET display = 1 WHERE ID=?";
        if (feedback.isDisplay()) {
            sql="UPDATE tblFeedback SET display = 0 WHERE ID=?";
        }
        try {
            
            PreparedStatement ps=connection.prepareStatement(sql);
            ps.setInt(1, feedback.getId());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Update feedback fail: " + e.getMessage());
            return false;
        }
    }
}
