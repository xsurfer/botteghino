package it.fperfetti.asos.botteghino.model;

import it.fperfetti.asos.botteghino.stub.Event;

public class OrderItem {
		
	public OrderItem() {
		super();
	}
	
	public OrderItem(Event event, Integer quantity) {
		this.event = event;
		this.quantity = quantity;
	}
	
	private Event event;
	public Event getEvent() { return event; }
	public void setEvent(Event event) { this.event = event; }
	
	private Integer quantity;
	public Integer getQuantity() { return quantity; }
	public void setQuantity(Integer quantity) { if(quantity > 0) this.quantity = quantity; }
	
	public Double getTotal(){ Double tot = (double) (event.getPrice()*quantity); return tot; }
	
	@Override
	public int hashCode(){
		return event.getTitle().hashCode() * event.getAuthor().hashCode(); 
	}
	
	@Override
	public boolean equals(Object o){
		if(this == o)
			return true;
		if((o == null) || (o.getClass() != this.getClass())) 
			return false;
		Event ev = (Event) o;
		return (this.event.getId() == ev.getId());
	}
}
