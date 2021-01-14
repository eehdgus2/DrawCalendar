package com.draw_calendar.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.draw_calendar.project.VO.MemberVO;
import com.draw_calendar.project.VO.PagingVO;

@Service
public interface Member_service {
	void insert_member(MemberVO vo);
	void delete_member(MemberVO vo);
	void update_member(MemberVO vo);
	int member_id_check(MemberVO vo);
	int count_member(MemberVO vo);
	MemberVO select_member(MemberVO vo);
	List<MemberVO> select_member_list(PagingVO vo);
}
