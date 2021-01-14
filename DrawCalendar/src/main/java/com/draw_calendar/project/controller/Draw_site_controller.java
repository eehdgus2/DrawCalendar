package com.draw_calendar.project.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.draw_calendar.project.VO.Draw_siteVO;
import com.draw_calendar.project.service.Draw_site_service;

 

@Controller
public class Draw_site_controller {
 
	@Autowired
	Draw_site_service service;

	@RequestMapping(value="/insert_draw_site.do")
	public String insert_draw_site(Draw_siteVO vo) {
		service.insert_draw_site(vo);
		return "redirect:index.jsp";
	}
	
	@RequestMapping(value="/update_draw_site.do")
	public String update_draw_site(Draw_siteVO vo) {
		service.update_draw_site(vo);
		return "redirect:index.jsp";
	}

	@RequestMapping(value="/delete_draw_site.do")
	public String delete_draw_site(Draw_siteVO vo) {
		service.delete_draw_site(vo);
		return "redirect:index.jsp";
	}
	
	@RequestMapping(value="/select_draw_site.do")
	public String select_draw_site(Draw_siteVO vo) {
		service.select_draw_site(vo);
		return "redirect:index.jsp";
	}

	@RequestMapping(value="/select_draw_site_list.do")
	public String select_draw_site_list(Draw_siteVO vo) {
		service.select_draw_site_list(vo);
		return "redirect:index.jsp";
	}

}