package com.draw_calendar.project.VO;

public class Like_listVO {

	private String id;
	private String like_brand;
	private int like_size;
	private int min_price;
	private int max_price;
	
	//getter and setter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLike_brand() {
		return like_brand;
	}
	public void setLike_brand(String like_brand) {
		this.like_brand = like_brand;
	}
	public int getLike_size() {
		return like_size;
	}
	public void setLike_size(int like_size) {
		this.like_size = like_size;
	}
	public int getMin_price() {
		return min_price;
	}
	public void setMin_price(int min_price) {
		this.min_price = min_price;
	}
	public int getMax_price() {
		return max_price;
	}
	public void setMax_price(int max_price) {
		this.max_price = max_price;
	}
	
	//toString
	@Override
	public String toString() {
		return "Like_list [id=" + id + ", like_brand=" + like_brand + ", like_size=" + like_size + ", min_price="
				+ min_price + ", max_price=" + max_price + "]";
	}
	
	
	
}
