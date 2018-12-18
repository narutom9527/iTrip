package org.itrip.pojo;

import java.io.Serializable;

public class User implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3517432214348792020L;
	
	private int id;
	private String username;
	private String password;
	private String bieming;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getBieming() {
		return bieming;
	}
	public void setBieming(String bieming) {
		this.bieming = bieming;
	}
}
