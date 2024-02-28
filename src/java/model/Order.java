/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author ASUS
 */
public class Order {
    private int orderId;
    private Date orderDate;
    private double toltalmoney;
    private int userId;
    

    public Order() {
    }

    public Order(int orderId, Date orderDate, double toltalmoney, int userId) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.toltalmoney = toltalmoney;
        this.userId = userId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getToltalmoney() {
        return toltalmoney;
    }

    public void setToltalmoney(double toltalmoney) {
        this.toltalmoney = toltalmoney;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    
}
