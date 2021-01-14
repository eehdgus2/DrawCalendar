package com.draw_calendar.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.draw_calendar.project.DAO.MemberDAO;
import com.draw_calendar.project.VO.MemberVO;
import com.draw_calendar.project.VO.PagingVO;

@Repository
public class Member_service_impl implements Member_service {

	@Autowired
	MemberDAO dao;
	
	@Override
	public void insert_member(MemberVO vo) {
		dao.insert_member(vo);
	}

	@Override
	public void delete_member(MemberVO vo) {
		dao.delete_member(vo);
	}

	@Override
	public void update_member(MemberVO vo) {
		dao.update_member(vo);
	}

	@Override
	public int member_id_check(MemberVO vo) {
		return dao.member_id_check(vo);
	}
	
	@Override
	public int count_member(MemberVO vo) {
		return dao.count_member(vo);
	}

	@Override
	public MemberVO select_member(MemberVO vo) {
		return dao.select_member(vo);
	}

	@Override
	public List<MemberVO> select_member_list(PagingVO vo) {
		return dao.select_member_list(vo);
	}



}
