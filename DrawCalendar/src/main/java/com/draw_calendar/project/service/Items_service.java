package com.draw_calendar.project.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.draw_calendar.project.DAO.ItemsDAO;
import com.draw_calendar.project.VO.ItemsVO;
import com.draw_calendar.project.VO.PagingVO;

@Repository("itemsDAO")
public class Items_service implements ItemsDAO {
	
	@Autowired
	SqlSessionTemplate sql;

	@Override
	public void insert_items(ItemsVO vo) {
		sql.insert("itemsDAO.insert_items",vo);
		
	}
	
	@Override
	public void update_items(ItemsVO vo) {
		sql.insert("itemsDAO.update_items",vo);		
	}
	
	@Override
	public void delete_items(ItemsVO vo) {
		sql.delete("itemsDAO.delete_items",vo);		
	}

	@Override
	public void update_rank(ItemsVO vo) {
		sql.update("itemsDAO.update_rank", vo);
	}

	@Override
	public void update_reg_management(ItemsVO vo) {
		sql.update("itemsDAO.update_reg_management", vo);
	}
	
	@Override
	public ItemsVO select_items(ItemsVO vo) {
		return sql.selectOne("itemsDAO.select_items",vo);
	}

	@Override
	public List<ItemsVO> select_items_list(ItemsVO vo) {
		return sql.selectList("itemsDAO.select_items_list",vo);
	}

	@Override
	public int count_items(ItemsVO vo) {
		return sql.selectOne("itemsDAO.count_items", vo);
	}
	
	@Override
	public int count_items_com(ItemsVO vo) {
		return sql.selectOne("itemsDAO.count_items_com", vo);
	}


	@Override
	public List<ItemsVO> select_items_list_paging(PagingVO vo) {
		return sql.selectList("itemsDAO.select_items_list_paging",vo);
	}

	@Override
	public List<ItemsVO> select_items_list_com(PagingVO vo) {
		return sql.selectList("itemsDAO.select_items_list_com",vo);
	}



}
