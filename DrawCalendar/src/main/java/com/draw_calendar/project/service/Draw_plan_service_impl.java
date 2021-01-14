package com.draw_calendar.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.draw_calendar.project.DAO.Draw_planDAO;
import com.draw_calendar.project.VO.Draw_planVO;

@Repository
public class Draw_plan_service_impl implements Draw_plan_service {

	@Autowired
	Draw_planDAO dao;
	
	@Override
	public void insert_draw_plan(Draw_planVO vo) {
		dao.insert_draw_plan(vo);
	}

	@Override
	public void delete_draw_plan(Draw_planVO vo) {
		dao.delete_draw_plan(vo);
	}

	@Override
	public void update_draw_plan(Draw_planVO vo) {
		dao.update_draw_plan(vo);
	}

	@Override
	public Draw_planVO select_draw_plan(Draw_planVO vo) {
		return dao.select_draw_plan(vo);
	}

	@Override
	public List<Draw_planVO> select_draw_plan_list() {
		return dao.select_draw_plan_list();
	}

}
