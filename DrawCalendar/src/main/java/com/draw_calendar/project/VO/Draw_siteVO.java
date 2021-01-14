package com.draw_calendar.project.VO;

public class Draw_siteVO {

	private String site_code;
	private String site_name;
	private String site_domain;
	
	//getter and setter
	public String getSite_code() {
		return site_code;
	}
	public void setSite_code(String site_code) {
		this.site_code = site_code;
	}
	public String getSite_name() {
		return site_name;
	}
	public void setSite_name(String site_name) {
		this.site_name = site_name;
	}
	public String getSite_domain() {
		return site_domain;
	}
	public void setSite_domain(String site_domain) {
		this.site_domain = site_domain;
	}
	
	//toString
	@Override
	public String toString() {
		return "Draw_site [site_code=" + site_code + ", site_name=" + site_name + ", site_domain=" + site_domain + "]";
	}
	
	
}