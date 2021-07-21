/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import Model.Customer;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Customer_DAO extends DBContext {

    public ArrayList<Customer> getCustomer() {
        ArrayList<Customer> list = new ArrayList();
        try {
            PreparedStatement ps = connection.prepareStatement("select * from tblCustomer");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString(1));
                String name = rs.getString(2);
                String phone = rs.getString(3);
                String address = rs.getString(4);
                String note = rs.getString(5);

                list.add(new Customer(id, name, phone, address, note));
            }
        } catch (Exception e) {
            System.out.println("Loi getCustomer: " + e.getMessage());
        }
        return list;
    }

    public String getIDCustomertMax() {
        try {
            PreparedStatement ps = connection.prepareStatement("select MAX(CustomerId) from tblCustomer");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            System.out.println("Loi getCustomerIDMax: " + e.getMessage());
        }
        return "";
    }

    public boolean addCustomer(String name, String phone, String address, String note) {

        try {
            String sql = "insert into tblCustomer values (?,?,?,?)";
            //stm.execute("insert into tblCustomer values ('" + name + "','" + phone + "','" + address + "','" + note + "')");
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, address);
            ps.setString(4, note);
            ps.executeUpdate();

            return true;
        } catch (Exception e) {
            System.out.println("Loi Add Customer: " + e.getMessage());
        }
        return false;
    }

    public boolean deleteCustomer(int id) {
        try {
            String sql1 = "delete from tblBill where CustomerId=?";
            String sql2 = "delete from tblCustomer where CustomerId=?";
            PreparedStatement ps = connection.prepareStatement(sql1);
            ps.setInt(1, id);
            ps.executeUpdate();
            ps = connection.prepareStatement(sql2);
            ps.setInt(1, id);
            ps.executeUpdate();
//            stm.execute("delete from tblBill where CustomerId='" + id + "'");
//            stm.execute("delete from tblCustomer where CustomerId='" + id + "'");
            return true;
        } catch (Exception e) {
            System.out.println("Delete Customer fail: " + e.getMessage());
            return false;
        }
    }

    public ArrayList<Customer> getCustomerByBillID(int billID) {
        ArrayList<Customer> list = new ArrayList();
        try {
            String sql = "select * from tblCustomer inner join tblBill on tblCustomer.CustomerId=tblBill.CustomerId where BillId=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, billID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = Integer.parseInt(rs.getString(1));
                String name = rs.getString(2);
                String phone = rs.getString(3);
                String address = rs.getString(4);

                list.add(new Customer(id, name, phone, address));
            }
        } catch (Exception e) {
            System.out.println("Loi getCustomer By BillID: " + e.getMessage());
        }
        return list;
    }

    public Customer getCustomerByPhone(String p) {
        String sql = "select top 1 * from tblCustomer where phone=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, p);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int id = Integer.parseInt(rs.getString(1));
                String name = rs.getString(2);
                String phone = rs.getString(3);
                String address = rs.getString(4);

                return new Customer(id, name, phone, address);
            } else {
                return new Customer(0, "", "", "");
            }
        } catch (Exception e) {
            System.out.println("Error get customer by phone " + e.getMessage());
        }
        return null;
    }

    public int getIdCustomerByPhone(String p) {
        String sql = "select top 1 * from tblCustomer where phone=?";

            try {
                PreparedStatement ps = connection.prepareStatement(sql);
                ps.setString(1, p);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                   return Integer.parseInt(rs.getString(1));
                }
            } catch (Exception e) {
                System.out.println("Error get id customer by phone " + e.getMessage());
            }
            return 0;
        }
    }
