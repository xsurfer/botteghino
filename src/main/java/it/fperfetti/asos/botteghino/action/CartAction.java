/*
 * $Id: HelloWorld.java 739661 2009-02-01 00:06:00Z davenewton $
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package it.fperfetti.asos.botteghino.action;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.apache.struts2.interceptor.SessionAware;
import it.fperfetti.asos.botteghino.model.Cart;
import it.fperfetti.asos.botteghino.model.OrderItem;
import it.fperfetti.asos.botteghino.model.Ticket;
import it.fperfetti.asos.botteghino.stub.Event;
import it.fperfetti.asos.botteghino.stub.FornitoreService;
import it.fperfetti.asos.botteghino.stub.FornitoreService_Service;
import it.fperfetti.asos.botteghino.model.Order;

/**
 * <code>Set welcome message.</code>
 */
public class CartAction extends ExampleSupport implements SessionAware {

	Map<String, Object> session;
	public void setSession(Map<String, Object> session) { this.session = session; }

	private Cart cart;
	public Cart getCart() { return cart; }

	private Long idEvent;
	public Long getIdEvent() { return idEvent; }
	public void setIdEvent(Long idEvent) { this.idEvent = idEvent; }

	private Event event;
	public Event getEvent() { return event; }
	public void setEvent(Event event) { this.event = event; }

	private Integer idItem;
	public Integer getIdItem() { return idItem; }
	public void setIdItem(Integer idItem) { this.idItem = idItem; }

	private OrderItem item;
	public OrderItem getItem() { return item; }
	public void setItem(OrderItem item) { this.item = item; }

	private List<OrderItem> items;
	public List<OrderItem> getItems() { return items; }
	public void setItems(List<OrderItem> items) { this.items = items; }

	private String token = new String();
	public String getToken(){ return token; }
	public void setToken(String tok) { token = tok; }
	
	private List<Ticket> tickets;
	public List<Ticket> getTickets() { return tickets; }
	public void setTickets(List<Ticket> tickets) { this.tickets = tickets; }

	/*************/
	/*  Actions  */
	/*************/

	public String remove() throws Exception {
		if (!session.containsKey("carrello")){
			cart = new Cart();
			session.put("carrello", cart);
		} else {
			cart = (Cart) session.get("carrello");
		}
		item = cart.getItems().get(idItem);
		cart.removeItem(item);
		return SUCCESS;
	}

	public String update() throws Exception {
		if (!session.containsKey("carrello")){
			cart = new Cart();
			session.put("carrello", cart);
		} else {
			cart = (Cart) session.get("carrello");
		}

		OrderItem tmpItem = cart.getItems().get(idItem);
		tmpItem.setQuantity(item.getQuantity());

		if(item.getQuantity()<=0){
			cart.removeItem(tmpItem);
		} else {
			cart.updateItem(idItem, tmpItem);
		}  	
		return SUCCESS;
	}

	public String add() throws Exception {
		if (!session.containsKey("carrello")){
			cart = new Cart();
			session.put("carrello", cart);
		} else {
			cart = (Cart) session.get("carrello");
		}

		FornitoreService eP = new FornitoreService_Service().getFornitore();
		event = eP.getEvent(idEvent);
		this.item.setEvent(event);
		cart.addItem(this.item);

		return SUCCESS;
	}

	public String checkout() throws Exception {
		if (!session.containsKey("carrello")){
			cart = new Cart();
			session.put("carrello", cart);
		} else {
			cart = (Cart) session.get("carrello");
		}

		items = cart.getItems();

		this.token = UUID.randomUUID().toString();
		session.put("token", token);
		if(cart.getNumberItems()<=0)
			return "empty";
		return SUCCESS;
	}

	public String step1() throws Exception {
		if (!session.containsKey("carrello")){
			cart = new Cart();
			session.put("carrello", cart);
		} else {
			cart = (Cart) session.get("carrello");
		}
		System.out.println("Current token:" + token);
		System.out.println("Session token:" + session.get("token"));
		String tok_session = (String) session.get("token");
		
		if(tok_session == null || token.compareTo( tok_session )!=0){
			return ERROR;
		}

		/* Creating order */
		Order order = new Order();
		order.setDate(new Date());
		order.setTotal(cart.getTotal());
		session.put("order", order);
		session.put("token", token);
		
		/* initially all tickets empty */
		tickets = order.getTickets();
		items = cart.getItems();
		this.token = UUID.randomUUID().toString();
		session.put("token", token);
		return SUCCESS;
	}
	
	public String step2() throws Exception {
		if (!session.containsKey("carrello")){
			cart = new Cart();
			session.put("carrello", cart);
		} else {
			cart = (Cart) session.get("carrello");
		}
		System.out.println("Current token:" + token);
		System.out.println("Session token:" + session.get("token"));
		String tok_session = (String) session.get("token");
		
		if(tok_session == null || token.compareTo( tok_session )!=0){
			return ERROR;
		}

		Order order = (Order) session.get("order");
		session.put("token", token);
		for(Ticket ticket : this.tickets){
			order.addTicket(ticket);
		}
		this.tickets = order.getTickets();
		
		this.token = UUID.randomUUID().toString();
		session.put("token", token);
		return SUCCESS;
	}
	
	public String step3() throws Exception {
		if (!session.containsKey("carrello")){
			cart = new Cart();
			session.put("carrello", cart);
		} else {
			cart = (Cart) session.get("carrello");
		}
		System.out.println("Current token:" + token);
		System.out.println("Session token:" + session.get("token"));
		String tok_session = (String) session.get("token");
		
		if(tok_session == null || token.compareTo( tok_session )!=0){
			return ERROR;
		}

		Order order = (Order) session.get("order");
		session.put("token", token);
//		for(Ticket ticket : this.tickets){
//			order.addTicket(ticket);
//		}
//		this.tickets = order.getTickets();
		
		this.token = UUID.randomUUID().toString();
		session.put("token", token);
		return SUCCESS;
	}

}
