package it.fperfetti.asos.botteghino.model;

public class Customer {
	
	public Customer() {}
	
	private Long id;
	public Long getId() { return id; }
	public void setId(Long id) { this.id = id; }

	private String name; 
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }

	private String surname;
	public String getSurname() { return surname; }
	public void setSurname(String surname) { this.surname = surname; }
	
	private String email;
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }

	private String creditcard;
	public String getCreditcard() { return creditcard; }
	public void setCreditcard(String creditcard) { this.creditcard = creditcard; }
	
	private String cvv;
	public String getCvv() { return cvv; }
	public void setCity(String cvv) { this.cvv = cvv; }

	private String circuit;
	public String getCircuit() { return circuit; }
	public void setCircuit(String circuit) { this.circuit = circuit; }
	
}
