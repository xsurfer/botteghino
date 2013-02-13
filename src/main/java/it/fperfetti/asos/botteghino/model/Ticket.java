package it.fperfetti.asos.botteghino.model;


public class Ticket {
	
	public Ticket() { }
	
	private Long id;
	public Long getId() { return id; }
	public void setId(Long id) { this.id = id; }
	
	private String event = new String();
	public String getEvent() { return event; }
	public void setEvent(String event) { this.event = event; }
	
	private Order order = new Order();
	public Order getOrder() { return order; }
	public void setOrder(Order order) { this.order = order; }
	
	private Guest guest = new Guest();
	public Guest getGuest() { return guest; }
	public void setGuest(Guest guest) { this.guest = guest; }
	
}
 