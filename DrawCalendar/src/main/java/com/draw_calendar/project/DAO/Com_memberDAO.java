package com.draw_calendar.project.DAO;

import java.util.List;

import com.draw_calendar.project.VO.Com_memberVO;
import com.draw_calendar.project.VO.PagingVO;

public interface Com_memberDAO {

	public void insert_com_member(Com_memberVO vo);
	void update_com_member(Com_memberVO vo);
	void delete_com_member(Com_memberVO vo);
	int com_member_id_check(Com_memberVO vo);
	int count_com_member(Com_memberVO vo);
	Com_memberVO select_com_member(Com_memberVO vo);
	List<Com_memberVO> select_com_member_list(PagingVO vo);
	
}