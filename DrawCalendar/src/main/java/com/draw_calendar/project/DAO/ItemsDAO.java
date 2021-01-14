package com.draw_calendar.project.DAO;

import java.util.List;

import com.draw_calendar.project.VO.ItemsVO;
import com.draw_calendar.project.VO.PagingVO;

public interface ItemsDAO {
	public void insert_items(ItemsVO vo);
	void update_items(ItemsVO vo);
	void update_rank(ItemsVO vo);
	void update_reg_management(ItemsVO vo);
	void delete_items(ItemsVO vo);
	ItemsVO select_items(ItemsVO vo);
	List<ItemsVO> select_items_list(ItemsVO vo);
	public int count_items(ItemsVO vo);
	public int count_items_com(ItemsVO vo);
	public List<ItemsVO> select_items_list_paging(PagingVO vo);
	public List<ItemsVO> select_items_list_com(PagingVO vo);
}