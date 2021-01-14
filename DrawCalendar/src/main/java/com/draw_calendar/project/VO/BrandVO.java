package com.draw_calendar.project.VO;

public class BrandVO {

	private String brand_code;
	private String brand_name;
	
	//getter and setter
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

	//toString
	@Override
	public String toString() {
		return "BrandVO [brand_code=" + brand_code + ", brand_name=" + brand_name + "]";
	}
	
	
}
