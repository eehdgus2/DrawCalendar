package com.draw_calendar.project.VO;

public class ItemsVO {

	private String brand_code;
	private String brand_name;
	private String model_name;
	private String model_code;
	private int price;
	private String s_size;
	private String collaboration;
	private String draw_date;
	private String announce_date;
	private String purchase_date;
	private String site_code;
	private int reg_management;
	private int rank;
	
	private String item_img;
	
	private String search_condition;
	private String search_keyword;
	
	
	public String getItem_img() {
		return item_img;
	}
	public void setItem_img(String item_img) {
		this.item_img = item_img;
	}
	public String getBrand_code() {
		return brand_code;
	}
	public void setBrand_code(String brand_code) {
		this.brand_code = brand_code;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getModel_name() {
		return model_name;
	}
	public void setModel_name(String model_name) {
		this.model_name = model_name;
	}
	public String getModel_code() {
		return model_code;
	}
	public void setModel_code(String model_code) {
		this.model_code = model_code;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getS_size() {
		return s_size;
	}
	public void setS_size(String s_size) {
		this.s_size = s_size;
	}
	public String getCollaboration() {
		return collaboration;
	}
	public void setCollaboration(String collaboration) {
		this.collaboration = collaboration;
	}
	public String getDraw_date() {
		return draw_date;
	}
	public void setDraw_date(String draw_date) {
		this.draw_date = draw_date;
	}
	public String getAnnounce_date() {
		return announce_date;
	}
	public void setAnnounce_date(String announce_date) {
		this.announce_date = announce_date;
	}
	public String getPurchase_date() {
		return purchase_date;
	}
	public void setPurchase_date(String purchase_date) {
		this.purchase_date = purchase_date;
	}
	public String getSite_code() {
		return site_code;
	}
	public void setSite_code(String site_code) {
		this.site_code = site_code;
	}
	public int getReg_management() {
		return reg_management;
	}
	public void setReg_management(int reg_management) {
		this.reg_management = reg_management;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getSearch_condition() {
		return search_condition;
	}
	public void setSearch_condition(String search_condition) {
		this.search_condition = search_condition;
	}
	public String getSearch_keyword() {
		return search_keyword;
	}
	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}
	
	@Override
	public String toString() {
		return "ItemsVO [brand_code=" + brand_code + ", brand_name=" + brand_name + ", model_name=" + model_name
				+ ", model_code=" + model_code + ", price=" + price + ", s_size=" + s_size + ", collaboration="
				+ collaboration + ", draw_date=" + draw_date + ", announce_date=" + announce_date + ", purchase_date="
				+ purchase_date + ", site_code=" + site_code + ", reg_management=" + reg_management + ", rank=" + rank
				+ ", search_condition=" + search_condition + ", search_keyword=" + search_keyword + "]";
	}

	
	
}