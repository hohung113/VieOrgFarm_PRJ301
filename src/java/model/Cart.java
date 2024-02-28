/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class Cart {

    List<Item> items;

    public Cart() {
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    private Item getItemById(int id) {
        for (Item item : items) {
            if (item.getProduct().getProductID() == id) {
                return item;
            }
        }
        return null;
    }

    public void addItem(Item t) {
        if (getItemById(t.getProduct().getProductID()) != null) {
            Item m = getItemById(t.getProduct().getProductID());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public double getToltalMoney() {
        double t = 0;
        for (Item i : items) 
            t += (i.getQuantity() * i.getPrice());
        

        return t;
    }
        
    private Product getProductById(int id,List<Product> list){
             for (Product product : list) {
            if(product.getProductID() ==id)
                return product;
        }
            return null;
    }
    
    public Cart(String txt, List<Product> list) {
        items = new ArrayList<>();
        
        try {
            
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split(",");
                for (String i : s) {
                    String[] n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    Product p = getProductById(id, list);
                    Item t = new Item(p, quantity, p.getPrice() * 2);
                    addItem(t);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
