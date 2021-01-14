package com.draw_calendar.project.VO;

public class Draw_planVO {
	private String draw_date;
	private String draw_time;
	private String announce_time;
	private String puchase_time;
	private String model_code;
	
	
	
	public String getModel_code() {
		return model_code;
	}
	public void setModel_code(String model_code) {
		this.model_code = model_code;
	}
	public String getDraw_date() {
		return draw_date;
	}
	public void setDraw_date(String draw_date) {
		this.draw_date = draw_date;
	}
	public String getDraw_time() {
		return draw_time;
	}
	public void setDraw_time(String draw_time) {
		this.draw_time = draw_time;
	}
	public String getAnnounce_time() {
		return announce_time;
	}
	public void setAnnounce_time(String announce_time) {
		this.announce_time = announce_time;
	}
	public String getPuchase_time() {
		return puchase_time;
	}
	public void setPuchase_time(String puchase_time) {
		this.puchase_time = puchase_time;
	}
	@Override
	public String toString() {
		return "Draw_planVO [draw_date=" + draw_date + ", draw_time=" + draw_time + ", announce_time=" + announce_time
				+ ", puchase_time=" + puchase_time + "]";
	}
	
	

}
