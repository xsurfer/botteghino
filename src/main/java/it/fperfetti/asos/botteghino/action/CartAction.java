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
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import it.fperfetti.asos.botteghino.model.Cart;
import it.fperfetti.asos.botteghino.model.OrderItem;
import it.fperfetti.asos.botteghino.stub.Category;
import it.fperfetti.asos.botteghino.stub.Event;
import it.fperfetti.asos.botteghino.stub.FornitoreService;
import it.fperfetti.asos.botteghino.stub.FornitoreService_Service;

/**
 * <code>Set welcome message.</code>
 */
public class CartAction extends ExampleSupport implements SessionAware {

	Map<String, Object> session;
	private Cart cart;
	private Event event;
	private Integer idEvent;
	private String quantity;
	
	public String update() throws Exception {
    	if (!session.containsKey("carrello")){
    		cart = new Cart();
    	    session.put("carrello", cart);
    	} else {
    		cart = (Cart) session.get("carrello");
    	}
    	
    	
    	FornitoreService eP = new FornitoreService_Service().getFornitore();
    	event = eP.getEvent(idEvent);
    	OrderItem ord = new OrderItem(event,Integer.parseInt(quantity));
    	cart.addItem(ord);
    	
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
    	OrderItem ord = new OrderItem(event,Integer.parseInt(quantity));
    	cart.addItem(ord);
    	
        return SUCCESS;
    }
    
    
    private ArrayList<OrderItem> items;
    
	public String checkout() throws Exception {
    	if (!session.containsKey("carrello")){
    		cart = new Cart();
    	    session.put("carrello", cart);
    	} else {
    		cart = (Cart) session.get("carrello");
    	}
    	
    	items = cart.getItems();
    	
        return SUCCESS;
    }

	public Cart getCart() {
		return cart;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	public Integer getIdEvent() {
		return idEvent;
	}

	public void setIdEvent(Integer idEvent) {
		this.idEvent = idEvent;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}
	
    public ArrayList<OrderItem> getItems() {
		return items;
	}

	public void setItems(ArrayList<OrderItem> items) {
		this.items = items;
	}
}
