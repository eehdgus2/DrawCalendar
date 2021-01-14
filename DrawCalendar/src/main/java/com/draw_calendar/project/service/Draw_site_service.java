package com.draw_calendar.project.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.draw_calendar.project.DAO.Draw_siteDAO;
import com.draw_calendar.project.VO.Draw_siteVO;

@Repository
public class Draw_site_service implements Draw_siteDAO {

	@Autowired
	SqlSessionTemplate sql;

	@Override
	public void insert_draw_site(Draw_siteVO vo) {
		sql.insert("draw_siteDAO.insert_draw_site",vo);	
	}
	@Override
	public void update_draw_site(Draw_siteVO vo) {
		sql.update("draw_siteDAO.update_draw_site",vo);	
	}
	@Override
	public void delete_draw_site(Draw_siteVO vo) {
		sql.delete("draw_siteDAO.delete_draw_site",vo);	
	}
	@Override
	public Draw_siteVO select_draw_site(Draw_siteVO vo) {
		return sql.selectOne("draw_siteDAO.select_draw_site",vo);
	}
	@Override
	public List<Draw_siteVO> select_draw_site_list(Draw_siteVO vo) {
		return sql.selectList("draw_siteDAO.select_draw_site_list",vo);
	}
	
}