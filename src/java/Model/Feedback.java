/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;


/**
 *
 * @author Admin
 */
public class Feedback {

    private int id;
    private String name, subject, phone, massage;
    private boolean display;

    public Feedback() {
    }

    public Feedback(int id, String name, String subject, String phone, String massage, boolean display) {
        this.id = id;
        this.name = name;
        this.subject = subject;
        this.phone = phone;
        this.massage = massage;
        this.display = display;
    }

    public Feedback(String name, String subject, String phone, String massage) {
        this.name = name;
        this.subject = subject;
        this.phone = phone;
        this.massage = massage;
    }

    public Feedback(int id, boolean display) {
        this.id = id;
        this.display = display;
    }

    public int getId() {
        return id;
    }

    public boolean isDisplay() {
        return display;
    }

    public void setDisplay(boolean display) {
        this.display = display;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMassage() {
        return massage;
    }

    public void setMassage(String massage) {
        this.massage = massage;
    }

}
