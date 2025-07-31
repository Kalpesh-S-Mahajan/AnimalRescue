package com.animal.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import org.springframework.stereotype.Component;

@Entity
@Component
public class Reporter {

    @Id
    private String contact;  // Primary Key (unique identifier)

    private String name;
    private String address;
    private String email;
    private String password;

    public Reporter() {}

    // Parameterized Constructor
    public Reporter(String contact, String name, String address, String email, String password) {
        this.contact = contact;
        this.name = name;
        this.address = address;
        this.email = email;
        this.password = password;
    }

    // Getters and Setters
    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Reporter [contact=" + contact + ", name=" + name + ", address=" + address +
                ", email=" + email + ", password=" + password + "]";
    }
}
