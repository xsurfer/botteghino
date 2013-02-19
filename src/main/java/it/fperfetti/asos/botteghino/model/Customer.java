package it.fperfetti.asos.botteghino.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "CUSTOMERS")
public class Customer {
	
	public Customer() {}
	
	@Id @GeneratedValue
	private Long id;
	public Long getId() { return id; }
	public void setId(Long id) { this.id = id; }

	@Column(name = "NAME")
	private String name; 
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }

	@Column(name = "SURNAME")
	private String surname;
	public String getSurname() { return surname; }
	public void setSurname(String surname) { this.surname = surname; }
	
	@Column(name = "EMAIL", unique=true)
	private String email;
	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }

	@Transient
	private String creditcard;
	public String getCreditcard() { return creditcard; }
	public void setCreditcard(String creditcard) { this.creditcard = creditcard; }
	
	@Transient
	private String cvv;
	public String getCvv() { return cvv; }
	public void setCvv(String cvv) { this.cvv = cvv; }

	@Transient
	private String circuit;
	public String getCircuit() { return circuit; }
	public void setCircuit(String circuit) { this.circuit = circuit; }
	
	@OneToMany(mappedBy = "customer")
	private List<Order> orders = new ArrayList<Order>();
	public List<Order> getOrders(){ return this.orders; }
	public void setOrders(List<Order> orders){ this.orders=orders; }
	
}
