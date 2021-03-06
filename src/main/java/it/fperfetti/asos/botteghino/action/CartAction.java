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

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jboss.resteasy.client.ClientRequest;
import org.jboss.resteasy.client.ClientResponse;

import it.fperfetti.asos.botteghino.util.HibernateUtil;
import it.fperfetti.asos.botteghino.model.Cart;
import it.fperfetti.asos.botteghino.model.Customer;
import it.fperfetti.asos.botteghino.model.Guest;
import it.fperfetti.asos.botteghino.model.OrderItem;
import it.fperfetti.asos.botteghino.model.Ticket;
import it.fperfetti.asos.botteghino.stub.Category;
import it.fperfetti.asos.botteghino.stub.Event;
import it.fperfetti.asos.botteghino.stub.FornitoreService;
import it.fperfetti.asos.botteghino.stub.FornitoreService_Service;
import it.fperfetti.asos.botteghino.model.Order;

/**
 * <code>Set welcome message.</code>
 */
public class CartAction extends ExampleSupport implements SessionAware {

	private static final String BANK_CHECK_ENDPOINT = "http://banca-paasfab.rhcloud.com/bank/check/{cnumber}/{cvv}/{name}/{surname}";
	private static final String BANK_WITHDRAWAL_ENDPOINT = "http://banca-paasfab.rhcloud.com/bank/withdrawal/{vendor}/{id}/{amount}";
	
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

	private Set<OrderItem> items;
	public Set<OrderItem> getItems() { return items; }
	public void setItems(Set<OrderItem> items) { this.items = items; }

	private String token = new String();
	public String getToken(){ return token; }
	public void setToken(String tok) { token = tok; }
	
	private List<Ticket> tickets = new ArrayList<Ticket>();
	public List<Ticket> getTickets() { return tickets; }
	public void setTickets(List<Ticket> tickets) { this.tickets = tickets; }
	
	private String message = new String();
	public String getMessage(){ return message; }
	public void setMessage(String msg){ this.message = msg; }
	
	private Customer customer;
	public Customer getCustomer(){ if(customer==null) customer=new Customer(); return customer; }
	public void setCustomer(Customer customer){ this.customer = customer; }

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
		
		cart.removeItem(idItem);
		
		return SUCCESS;
	}

	public String update() throws Exception {
		if (!session.containsKey("carrello")){
			cart = new Cart();
			session.put("carrello", cart);
		} else {
			cart = (Cart) session.get("carrello");
		}

		cart.updateItem(idItem, item.getQuantity());
		
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
		/* Loading the event from the provider */
		event = eP.getEvent(idEvent);
		
		/* Adding the event to the OrderItem */
		this.item.setEvent(event);
		
		cart.addItem(this.item);
		
		System.out.println("Aggiunto evento: " + item.getEvent().getId() + item.getEvent().getTitle());
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
		/* Copying, creating and checking tokens */
		String tok_session = (String) session.get("token");
		String tok_current = this.token;
		this.token = UUID.randomUUID().toString();
		session.put("token", token);
		if(tok_session == null || tok_current.compareTo( tok_session )!=0){
			return ERROR;
		}

		Boolean toInizialize = false;
		/* Creating order */
		Order order = (Order) session.get("order");
		if( order == null ){ 
			order = new Order();
			order.setDate(new Date());
			order.setTotal(cart.getTotal());
			toInizialize = true;
			session.put("order", order);
		}
		
		/* Preparing parameter for PRE-BOOK fase (and initializing the tickes)*/
		List<Event> eventArr = new ArrayList<Event>() ;
		List<Integer> quantityArr = new ArrayList<Integer>();
		for(OrderItem item : cart.getItems()){
			eventArr.add(item.getEvent());
			quantityArr.add(item.getQuantity());
			
			if(toInizialize){
				for(int i=0; i<item.getQuantity(); i++){
					order.getTickets().add(new Ticket());
				}
			}
		}  	
    	
		/* Executing pre-book */
		if(order.getRemoteid() == null || order.getRemoteid()<0 ){
			FornitoreService eP = new FornitoreService_Service().getFornitore();
			Long orderId = eP.prebook(eventArr, quantityArr, "botteghino.it");
			if(orderId>0) order.setRemoteid(orderId);	
			else {
				this.message="Alcuni eventi potrebbero non essere piu' disponibili. Provi a modificare la sua scelta o ripeta l'operazione in un prossimo momento";
				return "back";
			}
		}
    			
		/* initially all tickets empty */
    	
		tickets = order.getTickets();
		items = cart.getItems();
		
		/* generating token */
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
		/* Copying, creating and checking tokens */
		String tok_session = (String) session.get("token");
		String tok_current = this.token;
		this.token = UUID.randomUUID().toString();
		session.put("token", token);
		if(tok_session == null || tok_current.compareTo( tok_session )!=0){
			return ERROR;
		}

		/* Populatin order's tickets */
		Order order = (Order) session.get("order");	
		System.out.println("Ho " + tickets.size() + "tickets" );
		System.out.println("Ho " + order.getTickets().size() + "order tickets" );
		
		/*		NON serve perchè già punta lì
		order.getTickets().clear();
		for(Ticket ticket : this.tickets){
			ticket.setOrder(order);
			order.addTicket(ticket);
		}
	
		*/
		order.setTickets(this.tickets);
		this.tickets = order.getTickets(); // anche questo dovrebbe non servire
		
		this.items = cart.getItems();
		
		/* generating token */
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
		/* Copying, creating and checking tokens */
		String tok_session = (String) session.get("token");
		String tok_current = this.token;
		this.token = UUID.randomUUID().toString();
		session.put("token", token);
		if(tok_session == null || tok_current.compareTo( tok_session )!=0){
			return ERROR;
		}
		
		Order order = (Order) session.get("order");
		
		
		return SUCCESS;
	}
	
	public String payment() throws Exception {
		if (!session.containsKey("carrello")){
			cart = new Cart();
			session.put("carrello", cart);
		} else {
			cart = (Cart) session.get("carrello");
		}
		/* Copying, creating and checking tokens */
		String tok_session = (String) session.get("token");
		String tok_current = this.token;
		this.token = UUID.randomUUID().toString();
		session.put("token", token);
		if(tok_session == null || tok_current.compareTo( tok_session )!=0){
			return ERROR;
		}
		
		Order order = (Order) session.get("order");
		
    	ClientRequest req = new ClientRequest(BANK_CHECK_ENDPOINT);
        req
            .pathParameter("cnumber", customer.getCreditcard())
            .pathParameter("cvv", customer.getCvv())
            .pathParameter("name", customer.getName())
            .pathParameter("surname", customer.getSurname());
 
        ClientResponse<Long> accountId = req.get(Long.class);
        System.out.println(accountId.getEntity());
        if(accountId.getEntity()>0){
           	req = new ClientRequest(BANK_WITHDRAWAL_ENDPOINT);
            req
                .pathParameter("vendor", "botteghino.it")
                .pathParameter("id", accountId.getEntity().toString())
                .pathParameter("amount", order.getTotal());
     
            ClientResponse<Boolean> result = req.get(Boolean.class);
            System.out.println(result.getEntity());
            
            if(!result.getEntity()){
            	message="Si sono verificati problemi durante il pagamento. Riprovare";
    			return "back";
            }
            /* Executing book */
        	FornitoreService eP = new FornitoreService_Service().getFornitore();
        	eP.book(order.getRemoteid());
        	
        	
        	/* Persisting data */
        	Session _session = HibernateUtil.getSessionFactory().openSession();
    		Transaction tx = null;
    		try {
    			tx = _session.beginTransaction();
    			
    			for(Ticket tick : order.getTickets()){
    				_session.persist(tick);
    			}
    			@SuppressWarnings("unchecked")
				List<Customer> curr_customers = _session.createQuery("from Customer as cust where cust.email = :email")
    					.setString("email", customer.getEmail())
    					.list();
    			if(curr_customers.size()==0){
    				order.setCustomer(customer);
    				_session.persist(customer);
    			}
    			else
    				order.setCustomer(curr_customers.get(0));
    			
    			_session.persist(order);
    			tx.commit();
    		}
    		catch (Exception e) {
    			if (tx != null) tx.rollback();
    			e.printStackTrace();
    		}
    		finally {
    			_session.close();
    		}
    		session.clear();
        }
		
		return SUCCESS;
	}

}
