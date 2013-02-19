package it.fperfetti.asos.botteghino.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Cart {

	public Cart() {}
	
	private Set<OrderItem> items = new HashSet<OrderItem>();
	public Set<OrderItem> getItems(){
		return this.items;
	}

	public boolean addItem(OrderItem oitem){
		if(items.contains(oitem))
			return false;
		items.add(oitem);
		return true;
	}
	
	public void updateItem(int hashCode, int quantity){
		OrderItem oi = getByHashCode(hashCode);
		if(oi!=null){
			if(quantity<=0){
				removeItem(hashCode);
			}else{
				oi.setQuantity(quantity);
			}
		}
	}
	
	public void removeItem(int hashCode){
		OrderItem oi = getByHashCode(hashCode);
		if(oi!=null){
			this.items.remove(oi);
		}
	}
	
	private OrderItem getByHashCode(int hashCode){
		OrderItem ret = null;
		for(OrderItem oi : items){
			if(oi.hashCode() == hashCode){
				ret=oi;
				break;
			}
		}
		return ret;
		
	}
	
	
	public boolean OrderItem(OrderItem oitem){
		if(items.contains(oitem))
			return false;
		items.add(oitem);
		return true;
	}
	
	private Date date = new Date();
	public Date getDate() { return date; }
	
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
