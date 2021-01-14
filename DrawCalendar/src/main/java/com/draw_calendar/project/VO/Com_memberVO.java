package com.draw_calendar.project.VO;

 

public class Com_memberVO {

	private String id;
	private String password;
	private String email;
	private String phone;
	private String address;
	private int reg_num;
	private String brand_name;
	private String brand_name_ko;
	
	private String search_condition;
	private String search_keyword;

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
	//getter and setter
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getReg_num() {
		return reg_num;
	}
	public void setReg_num(int reg_num) {
		this.reg_num = reg_num;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getBrand_name_ko() {
		return brand_name_ko;
	}
	public void setBrand_name_ko(String brand_name_ko) {
		this.brand_name_ko = brand_name_ko;
	}

	@Override
	public String toString() {
		return "Com_memberVO [id=" + id + ", password=" + password + ", email=" + email + ", phone=" + phone
				+ ", address=" + address + ", reg_num=" + reg_num + ", brand_name=" + brand_name + ", brand_name_ko="
				+ brand_name_ko + "]";
	}

}
