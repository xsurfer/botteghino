package it.fperfetti.asos.botteghino.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Cascade;

@Entity
@Table(name = "ORDERS")
public class Order {

	public Order() {}
	
	@Id @GeneratedValue
	private Long id;
	public Long getId() { return id; }
	public void setId(Long id) { this.id = id; }
	
	@Column(name = "REMOTE_EVENT_ID")
	@NotNull
	private Long remoteid;
	public Long getRemoteid() { return remoteid; }
	public void setRemoteid(Long remoteid) { this.remoteid = remoteid; }

	@Transient
	private List<Ticket> tickets = new ArrayList<Ticket>();
	public List<Ticket> getTickets() { return tickets; }
	public void setTickets(List<Ticket> tickets) { this.tickets = tickets; }
	public void addTicket(Ticket detail) { tickets.add(detail); }
	
	@Temporal(TemporalType.DATE) @NotNull @Column(updatable=false)
	public Date getDate() { return date; }
	public void setDate(Date date) { this.date = date; }
	private Date date;
	
	@Column(name = "TOTAL")
	@NotNull
	private Double total;
	public Double getTotal() { return total; }
	public void setTotal(Double total) { this.total = total; }
	
	@ManyToOne
	@Cascade( org.hibernate.annotations.CascadeType.SAVE_UPDATE )
	@JoinColumn(name="customer_id")
	@NotNull
	private Customer customer;
	public Customer getCustomer(){ return customer; }
	public void setCustomer(Customer customer){ this.customer = customer; }
}
