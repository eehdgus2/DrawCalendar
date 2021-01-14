package com.draw_calendar.project;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.draw_calendar.project.DAO.BrandDAO;
import com.draw_calendar.project.DAO.Com_memberDAO;
import com.draw_calendar.project.VO.Com_memberVO;
import com.draw_calendar.project.service.Com_member_service;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:root-context.xml")
public class DBTest {

	@Autowired
	Com_memberDAO dao;
	
	@Test
	public void ttest() {
		
		
//		BrandDAO dao = new BrandDAO();
		
		Com_memberVO vo = new Com_memberVO();
		vo.setId("eehdgus2");
		vo.setPassword("eehdgus2");
		vo.setEmail("eehdgus2@gmail.com");
		vo.setPhone("821076190020");
		vo.setAddress("서울시 수명로2가길 22");
		vo.setReg_num(1234567890);
		vo.setBrand_name("NIKE");
		vo.setBrand_name_ko("나이키");
		
		dao.insert_com_member(vo);
	}
	
}
