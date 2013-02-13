package it.fperfetti.asos.botteghino.model;

import java.util.Date;
import java.util.List;

public class Order {

	private Long id;
	public Long getId() { return id; }
	public void setId(Long id) { this.id = id; }

	public List<Ticket> getTickets() { return tickets; }
	public void addTicket(Ticket detail) { tickets.add(detail); }
	private List<Ticket> tickets;

	public Date getDate() { return date; }
	public void setDate(Date date) { this.date = date; }
	private Date date;
	
	private Double total;
	public Double getTotal() { return total; }
	public void setTotal(Double total) { this.total = total; }	
	
	
}
