package it.fperfetti.asos.botteghino.model;

public class Customer {
	
	private Long id;
	public Long getId() { return id; }
	public void setId(Long id) { this.id = id; }

	private String name; 
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }

	private String surname;
	public String getSurname() { return surname; }
	public void setSurname(String surname) { this.surname = surname; }

	private String address;
	public String getAddress() { return address; }
	public void setAddress(String address) { this.address = address; }
	
	private String city;
	public String getCity() { return city; }
	public void setCity(String city) { this.city = city; }

	private CreditCard cc;
	public CreditCard getCc() { return cc; }
	public void setCc(CreditCard cc) { this.cc = cc; }
	
}
