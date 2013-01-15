package it.fperfetti.asos.botteghino.model;

import java.util.ArrayList;
import java.util.Date;

public class Cart {
	
	private ArrayList<OrderItem> items = new ArrayList<OrderItem>();
	private Date date = new Date();
		
	public Cart() {
		super();
	}

	public ArrayList<OrderItem> getItems() {
		return items;
	}

	public void setItems(ArrayList<OrderItem> items) {
		this.items = items;
	}

	public Date getDate() {
		return date;
	}
	
	public void addItem(OrderItem item){
		this.items.add(item);
	}
	
	public void removeItem(Integer index){
		this.items.remove(index);
	}
	
	public Double getTotal(){
		Double tot = new Double(0);
		for (OrderItem oi : this.items){
			tot+=oi.getTotal();
		}
		return tot;
	}
	
	public Integer getNumberItems(){
		return this.items.size();
	}

}
