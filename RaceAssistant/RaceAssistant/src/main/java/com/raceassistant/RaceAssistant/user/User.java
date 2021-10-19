package com.raceassistant.RaceAssistant.user;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID")
	private int ID;
	@Column(name = "name")
	private String name;
	@Column(name = "password")
	private String password;
	private String passwordConfirm;
	@Column(name = "role")
	private String role;
	@Column(name = "status")
	private boolean status;

	public User(int iD, String name, String password, String role, boolean status) {
		super();
		ID = iD;
		this.name = name;
		this.password = password;
		this.role = role;
		this.status = status;
	}

	public User(User user) {
		super();
		ID = user.getID();
		this.name = user.getName();
		this.password = user.getPassword();
		this.role = user.getRole();
		this.status = user.isStatus();
	}

	public User() {
		super();
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirm() {
		return passwordConfirm;
	}

	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "User [ID=" + ID + ", name=" + name + ", password=" + password + ", role=" + role + ", status=" + status
				+ "]";
	}

}
