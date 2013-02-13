package it.fperfetti.asos.botteghino.model;

public class Guest {
	
	private Long id;
	public Long getId() { return id; }
	public void setId(Long id) { this.id = id; }

	private String name = new String(); 
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }

	private String surname = new String();
	public String getSurname() { return surname; }
	public void setSurname(String surname) { this.surname = surname; }

	private String identity = new String();
	public String getIdentity() { return identity; }
	public void setIdentity(String identity) { this.identity = identity; }

}
