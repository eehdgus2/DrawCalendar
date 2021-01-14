package com.draw_calendar.project.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.draw_calendar.project.VO.MemberVO;
import com.draw_calendar.project.VO.PagingVO;

@Repository
public class MemberDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	private final String insert_memeber = "insert into member values(?,?,?,?,?,?,?,?)";
	private final String delete_memeber = "delete member where id = ?";
	private final String update_member = "update member set password = ?, email = ?, phone = ?, name = ?, gender = ?, address = ? where id = ?";
	private final String member_id_check = "select count(*) from member where id = ?";
	private final String select_member = "select * from member where id = ? ";
	
	private RowMapper<MemberVO> row_map = new RowMapper<MemberVO>() {
		@Override
		public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			MemberVO vo = new MemberVO();
			vo.setId(rs.getString("id"));
			vo.setPassword(rs.getString("password"));
			vo.setEmail(rs.getString("email"));
			vo.setPhone(rs.getString("phone"));
			vo.setName(rs.getString("name"));
			vo.setGender(rs.getInt("gender"));
			vo.setBirth(rs.getString("birth"));
			vo.setAddress(rs.getString("address"));
			return vo;
		}
	};
	
	public void insert_member(MemberVO vo) {
		jdbcTemplate.update(insert_memeber, vo.getId(), vo.getPassword(), vo.getEmail(), vo.getPhone(), vo.getName(),  vo.getGender(), vo.getBirth(), vo.getAddress());
	}
	
	public void delete_member(MemberVO vo) {
		jdbcTemplate.update(delete_memeber, vo.getId());
	}
	
	public void update_member(MemberVO vo) {
		jdbcTemplate.update(update_member, vo.getPassword(), vo.getEmail(), vo.getPhone(), vo.getName(), vo.getGender(), vo.getAddress(), vo.getId());
	}
	
	public int member_id_check(MemberVO vo) {
		return jdbcTemplate.queryForObject(member_id_check, new Object[] {vo.getId()}, Integer.class );
	}
	
	public int count_member(MemberVO vo) {
		String count_member = "select count(*) from member where "+vo.getSearch_condition()+" like '%'||?||'%'";
		return jdbcTemplate.queryForObject(count_member, new Object[] {vo.getSearch_keyword()}, Integer.class);
	}
	
	public MemberVO select_member(MemberVO vo) {
		return jdbcTemplate.queryForObject(select_member, new Object[] {vo.getId()}, row_map);
	}
	
	public List<MemberVO> select_member_list(PagingVO vo) {
		String select_member_list = "select * from (select rownum rn, a.* from (select * from member where "+vo.getSearch_condition()+" like '%'||?||'%') a ) where rn between ? and ?";
		return jdbcTemplate.query(select_member_list, new Object[] {vo.getSearch_keyword(), vo.getStart(), vo.getEnd()},row_map);
	}
}
