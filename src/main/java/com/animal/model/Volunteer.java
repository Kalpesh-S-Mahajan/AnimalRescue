package com.animal.model;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.stereotype.Component;

@Entity
@Component
public class Volunteer {
	   @Id
	    private String contact; // Primary Key
	    private String name;
	    private String zone;
	    private String email;
	    private String password;
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
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
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
	public Volunteer(String contact, String name, String zone, String email, String password) {
		super();
		this.contact = contact;
		this.name = name;
		this.zone = zone;
		this.email = email;
		this.password = password;
	}
	public Volunteer() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Volunteer [contact=" + contact + ", name=" + name + ", zone=" + zone + ", email=" + email
				+ ", password=" + password + "]";
	}
	 

}
