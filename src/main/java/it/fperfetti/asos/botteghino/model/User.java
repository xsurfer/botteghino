package it.fperfetti.asos.botteghino.model;

public class User {
	
	private Integer id;
	private String name;
	private String surname;
	private String address;
	private CreditCard cc;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public CreditCard getCc() {
		return cc;
	}
	public void setCc(CreditCard cc) {
		this.cc = cc;
	}
	

}
