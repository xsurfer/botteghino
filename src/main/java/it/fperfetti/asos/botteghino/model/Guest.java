package it.fperfetti.asos.botteghino.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "GUESTS")
public class Guest {
	
	public Guest() {}
	
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

	@Column(name = "IDENTITY",unique=true)
	private String identity;
	public String getIdentity() { return identity; }
	public void setIdentity(String identity) { this.identity = identity; }

}
