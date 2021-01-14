package com.draw_calendar.project.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.draw_calendar.project.VO.BrandVO;
import com.draw_calendar.project.VO.Draw_planVO;
import com.draw_calendar.project.util.Jdbc_util;

@Repository
public class Draw_planDAO {

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public void insert_draw_plan(Draw_planVO vo) {
		try {
			con = Jdbc_util.getConnetion();
			ps = con.prepareStatement("insert into draw_plan values(?, ?, ?, ?, ?)");
			ps.setString(1, vo.getDraw_date());
			ps.setString(2, vo.getDraw_time());
			ps.setString(3, vo.getAnnounce_time());
			ps.setString(4, vo.getPuchase_time());
			ps.setString(5, vo.getModel_code());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if( con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public void delete_draw_plan(Draw_planVO vo) {
		try {
			con = Jdbc_util.getConnetion();
			ps = con.prepareStatement("delete draw_plan where draw_date = ?");
			ps.setString(1, vo.getDraw_date());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if( con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public void update_draw_plan(Draw_planVO vo) {
		try {
			con = Jdbc_util.getConnetion();
			ps = con.prepareStatement("update draw_plan set draw_time = ?, announce_time = ?, puchase_time = ? where draw_date = ?");
			ps.setString(1, vo.getDraw_time());
			ps.setString(2, vo.getAnnounce_time());
			ps.setString(3, vo.getPuchase_time());
			ps.setString(4, vo.getDraw_date());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if( con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public Draw_planVO select_draw_plan(Draw_planVO vo) {
		Draw_planVO plan = null;
		try {
			con = Jdbc_util.getConnetion();
			ps = con.prepareStatement("select * from draw_plan where draw_date = ?");
			ps.setString(1, vo.getDraw_date());
			rs = ps.executeQuery();
			while(rs.next()) {
				plan = new Draw_planVO();
				plan.setDraw_date(rs.getString("draw_date"));
				plan.setDraw_time(rs.getString("draw_time"));
				plan.setAnnounce_time(rs.getString("announce_time"));
				plan.setPuchase_time(rs.getString("puchase_time"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if( con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return plan;
	}
	
	public List<Draw_planVO> select_draw_plan_list() {
		List<Draw_planVO> list = new ArrayList<Draw_planVO>();
		Draw_planVO vo = null;
		try {
			con = Jdbc_util.getConnetion();
			ps = con.prepareStatement("select * from draw_plan");
			rs = ps.executeQuery();
			while(rs.next()) {
				vo = new Draw_planVO();
				vo.setDraw_date(rs.getString("draw_date"));
				vo.setDraw_time(rs.getString("draw_time"));
				vo.setAnnounce_time(rs.getString("announce_time"));
				vo.setPuchase_time(rs.getString("puchase_time"));
				vo.setModel_code(rs.getString("model_code"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if( con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return list;
	}
}
