package it.fperfetti.asos.botteghino.model;

import it.fperfetti.asos.botteghino.stub.Event;

public class OrderItem {
	
	private Event event;
	private Integer quantity;
	
	public OrderItem() {
		super();
	}
	
	public OrderItem(Event event, Integer quantity) {
		super();
		this.event = event;
		this.quantity = quantity;
	}
	
	public Event getEvent() {
		return event;
	}
	public void setEvent(Event event) {
		this.event = event;
	}
	
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	public Double getTotal(){
		Double tot = (double) (event.getPrice()*quantity);
		return tot;
	}
	

}
