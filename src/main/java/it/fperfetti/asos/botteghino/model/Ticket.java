package it.fperfetti.asos.botteghino.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Cascade;

@Entity
@Table(name = "TICKETS")
public class Ticket {
	
	public Ticket() { }
	
	@Id @GeneratedValue
	private Long id;
	public Long getId() { return id; }
	public void setId(Long id) { this.id = id; }
	
	@Column(name = "EVENT_ID")
	@NotNull
	private String event = new String();
	public String getEvent() { return event; }
	public void setEvent(String event) { this.event = event; }
	
	@Transient
	private Order order = new Order();
	public Order getOrder() { return order; }
	public void setOrder(Order order) { this.order = order; }
	
	@ManyToOne
	@Cascade( org.hibernate.annotations.CascadeType.SAVE_UPDATE )
	@JoinColumn(name="guest_id")
	private Guest guest = new Guest();
	public Guest getGuest() { return guest; }
	public void setGuest(Guest guest) { this.guest = guest; }
	
}
 