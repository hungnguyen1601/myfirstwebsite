/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.List;

/**
 *
 * @author Admin
 */
public class CusOrder {
    private String name,address,phone,note;
    private List<ProductOrder> order;
    public CusOrder() {
    }

    public CusOrder(String name, String address, String phone, String note,List<ProductOrder> order) {
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.note = note;
        this.order=order;
    }

    public List<ProductOrder> getOrder() {
        return order;
    }

    public void setOrder(List<ProductOrder> order) {
        this.order = order;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    
}
