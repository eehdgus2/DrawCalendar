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

@Repository
public class BrandDAO {
	
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@drawcalendar.cyeadvl5x6ht.ap-northeast-2.rds.amazonaws.com:1521:ORCL";
	private String user_name = "jung";
	private String user_pwd = "jung12!#";

	
	
	public void insert_brand(BrandVO vo) {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user_name, user_pwd);
			ps = con.prepareStatement("insert into brand values(?,?)");
			ps.setString(1, vo.getBrand_code());
			ps.setString(2, vo.getBrand_name());
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
	
	public void delete_brand(BrandVO vo) {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user_name, user_pwd);
			ps = con.prepareStatement("delete brand where brand_code = ?");
			ps.setString(1, vo.getBrand_code());
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
	
	public void update_brand(BrandVO vo) {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user_name, user_pwd);
			ps = con.prepareStatement("update brand set brand_code = ? where brand_name = ?");
			ps.setString(1, vo.getBrand_code());
			ps.setString(2, vo.getBrand_name());
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
	
	public BrandVO select_brand(BrandVO vo) {
		BrandVO brand = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user_name, user_pwd);
			ps = con.prepareStatement("select * from brand where brand_code = ?");
			ps.setString(1, vo.getBrand_code());
			rs = ps.executeQuery();
			while( rs.next() ) {
				brand = new BrandVO();
				brand.setBrand_code(rs.getString("brand_code"));
				brand.setBrand_name(rs.getString("brand_name"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
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
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return brand;
	}
	
	public List<BrandVO> select_brand_list(BrandVO vo) {
		List<BrandVO> list = new ArrayList<BrandVO>();
		BrandVO brand = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user_name, user_pwd);
			ps = con.prepareStatement("select * from brand");
			rs = ps.executeQuery();
			while( rs.next() ) {
				brand = new BrandVO();
				brand.setBrand_code(rs.getString("brand_code"));
				brand.setBrand_name(rs.getString("brand_name"));
				
				list.add(brand);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
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
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return list;
	}
}
