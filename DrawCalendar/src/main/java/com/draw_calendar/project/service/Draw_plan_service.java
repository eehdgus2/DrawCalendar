package com.draw_calendar.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.draw_calendar.project.VO.Draw_planVO;

@Service
public interface Draw_plan_service {
	void insert_draw_plan(Draw_planVO vo);
	void delete_draw_plan(Draw_planVO vo);
	void update_draw_plan(Draw_planVO vo);
	Draw_planVO select_draw_plan(Draw_planVO vo);
	List<Draw_planVO> select_draw_plan_list();
}
