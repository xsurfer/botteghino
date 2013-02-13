package it.fperfetti.asos.botteghino.model;


import it.fperfetti.asos.botteghino.stub.Event;


public class Ticket {
	
	private Long id;
	public Long getId() { return id; }
	public void setId(Long id) { this.id = id; }
	
	private Event event;
	public Event getEvent() { return event; }
	public void setEvent(Event event) { this.event = event; }
	
	private Order order;
	public Order getOrder() { return order; }
	public void setOrder(Order order) { this.order = order; }
	
	private Guest guest;
	public Guest getGuest() { return guest; }
	public void setGuest(Guest guest) { this.guest = guest; }
	
}
 