package it.fperfetti.asos.botteghino.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Order {

	public Order() {}
	
	private Long id;
	public Long getId() { return id; }
	public void setId(Long id) { this.id = id; }
	
	private Long remoteid;
	public Long getRemoteid() { return remoteid; }
	public void setRemoteid(Long remoteid) { this.remoteid = remoteid; }

	public List<Ticket> getTickets() { return tickets; }
	public void setTickets(List<Ticket> tickets) { this.tickets = tickets; }
	public void addTicket(Ticket detail) { tickets.add(detail); }
	private List<Ticket> tickets = new ArrayList<Ticket>();

	public Date getDate() { return date; }
	public void setDate(Date date) { this.date = date; }
	private Date date;
	
	private Double total;
	public Double getTotal() { return total; }
	public void setTotal(Double total) { this.total = total; }
}
