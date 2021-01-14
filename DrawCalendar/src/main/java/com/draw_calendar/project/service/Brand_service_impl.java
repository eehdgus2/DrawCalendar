package com.draw_calendar.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.draw_calendar.project.DAO.BrandDAO;
import com.draw_calendar.project.VO.BrandVO;

@Repository
public class Brand_service_impl implements Brand_service{
	
	@Autowired
	BrandDAO dao;
	
	@Override
	public void insert_brand(BrandVO vo) {
		dao.insert_brand(vo);
	}
	@Override
	public void delete_brand(BrandVO vo) {
		dao.delete_brand(vo);
	}
	@Override
	public void update_brand(BrandVO vo) {
		dao.update_brand(vo);
	}
	@Override
	public BrandVO select_brand(BrandVO vo) {
		return dao.select_brand(vo);
	}
	@Override
	public List<BrandVO> select_brand_list(BrandVO vo) {
		return dao.select_brand_list(vo);
	}
}
