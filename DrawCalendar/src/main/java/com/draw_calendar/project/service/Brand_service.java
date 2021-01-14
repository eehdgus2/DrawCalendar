package com.draw_calendar.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.draw_calendar.project.VO.BrandVO;

@Service
public interface Brand_service {
	void insert_brand(BrandVO vo);
	void delete_brand(BrandVO vo);
	void update_brand(BrandVO vo);
	BrandVO select_brand(BrandVO vo);
	List<BrandVO> select_brand_list(BrandVO vo);
}
