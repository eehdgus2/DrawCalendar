package com.draw_calendar.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.draw_calendar.project.DAO.ItemsDAO;
import com.draw_calendar.project.VO.Draw_planVO;
import com.draw_calendar.project.VO.ItemsVO;
import com.draw_calendar.project.service.Draw_plan_service;
import com.draw_calendar.project.service.Items_service;

@Controller
public class Draw_plan_controller {

	@Autowired
	Draw_plan_service service;
	@Autowired
	ItemsDAO dao;;
	
	@RequestMapping(value="/insert_draw_plan.do")
	public String insert_draw_plan(Draw_planVO vo) {
		ItemsVO items = new ItemsVO();
		items.setModel_code(vo.getModel_code());
		items.setReg_management(2);
		dao.update_reg_management(items);
		service.insert_draw_plan(vo);
		return "insert_draw_plan.jsp";
	};
	
	@RequestMapping(value="/select_draw_plan_list.do")
	public String select_draw_plan_list(Draw_planVO vo, Model model) {
		model.addAttribute("plan_list", service.select_draw_plan_list());
		return "calendar.jsp";
	}
}
