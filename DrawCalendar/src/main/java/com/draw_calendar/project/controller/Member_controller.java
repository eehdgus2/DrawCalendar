package com.draw_calendar.project.controller;

import java.io.PrintWriter;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.draw_calendar.project.VO.Com_memberVO;
import com.draw_calendar.project.VO.MemberVO;
import com.draw_calendar.project.VO.PagingVO;
import com.draw_calendar.project.service.Member_service;

@Controller
public class Member_controller {

	@Autowired
	Member_service service;
	
	@ModelAttribute("member_condition")
	public Map<String, String> search_condition_map() {
		Map<String, String> member_condition = new LinkedHashMap<String, String>();
		member_condition.put("아이디", "id");
		member_condition.put("성별", "gender");
		member_condition.put("생년월일", "birth");
		return member_condition;
	}
	
	@RequestMapping(value="/insert_member.do")
	public String insert_member(MemberVO vo) throws Exception {
		service.insert_member(vo);
		return "index.jsp";
	}
	
	@RequestMapping(value="/update_member.do")
	public String update_member(MemberVO vo, HttpSession session) throws Exception {
		service.update_member(vo);
		session.invalidate();
		return "index.jsp";
	}
	
	@RequestMapping(value="/delete_member.do")
	public String delete_mem(MemberVO vo, HttpSession session) throws Exception {
		service.delete_member(vo);
		return "index.jsp";
	}
	
	@RequestMapping(value="/select_member.do")
	public String select_member(MemberVO vo, Model model, HttpSession session, HttpServletRequest request, 
								@RequestParam( value="state", required=false ) String state
								) throws Exception {
		String kind = (String)session.getAttribute("kind");
		String id = "";
		
		if(kind.equals("admin")) {
			id = request.getParameter("id");
			vo.setId(id);	
			model.addAttribute("member",service.select_member(vo));
			
			if( state.equals("on")) {
				return "update_member.jsp";
			}
			if( state.equals("off")) {
				return "member_detail.jsp";
			}
		}
		
		if(kind.equals("normal") || kind.equals("company")) {
			id = (String)session.getAttribute("id");
			vo.setId(id);
			model.addAttribute("member",service.select_member(vo));
			return "update_member.jsp";
		}

		return "";
	}
	
	@RequestMapping(value="/select_member_list.do")
	public String select_member_list(MemberVO vo, Model model,
									@RequestParam( value="nowPage", required=false ) String nowPage,
									@RequestParam( value="cntPerPage", required=false ) String cntPerPage
									) throws Exception {
		
		if( vo.getSearch_condition() == null) vo.setSearch_condition("id"); 
		if( vo.getSearch_keyword() == null) vo.setSearch_keyword("");
		
		
		if( vo.getSearch_condition().equals("gender")) {
			if( vo.getSearch_keyword().equals("남")||
				vo.getSearch_keyword().equals("남자")||
				vo.getSearch_keyword().equals("남성")) {
					vo.setSearch_keyword("1");
			}
			if( vo.getSearch_keyword().equals("여")||
				vo.getSearch_keyword().equals("여자")||
				vo.getSearch_keyword().equals("여성")) {
					vo.setSearch_keyword("2");
				}
		}
			
		
		int total = service.count_member(vo);
		if( nowPage == null && cntPerPage == null ) {
			nowPage = "1";
			cntPerPage = "5";
		} else if( nowPage == null ) {
			nowPage = "1";
		} else if( cntPerPage == null ) {
			cntPerPage = "5";
		}
		
		PagingVO paging = new PagingVO( total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		paging.setSearch_condition(vo.getSearch_condition());
		paging.setSearch_keyword(vo.getSearch_keyword());
		
		
		System.out.println(paging.toString());
		System.out.println(service.select_member_list(paging));
		
		model.addAttribute("paging", paging);
		model.addAttribute("member_list", service.select_member_list(paging));
		return "member_list.jsp";
	}
	
	@RequestMapping(value="/login.do")
	public String login_member(MemberVO vo, HttpSession session, HttpServletResponse response) throws Exception {
		
		PrintWriter out = response.getWriter();
		if(service.member_id_check(vo) == 1) {			
			MemberVO member = service.select_member(vo);
			if( vo.getId().equals(member.getId()) && vo.getPassword().equals(member.getPassword())) {
				if( member.getId().equals("admin")) {
					out.println("<script>window.open('insert_draw_plan.jsp', '일정 등록', 'resizable=no, width=500, height=700, top=30, left=50');</script>");
					out.flush();
					session.setAttribute("kind", "admin");
					return "index.jsp";
				}
				session.setAttribute("kind", "normal");
				session.setAttribute("id", member.getId());
				return "index.jsp";
			} else {
				response.setContentType("text/html; charset=UTF-8");
		       
		        out.println("<script>alert('비밀번호가 틀렸습니다.'); history.go(-1);</script>");
		        out.flush();
		        return "login.jsp";
			}
			
		}
		
		if(service.member_id_check(vo) == 0) {
			 response.setContentType("text/html; charset=UTF-8");
	         out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
	         out.flush();
			return "login.jsp";
		}
		
		
		return "";
	}
	
	@RequestMapping(value = "logout.do")
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "index.jsp";
	}
	
	@RequestMapping(value="/member_id_check.do",  method = RequestMethod.POST)
	@ResponseBody
	public String member_id_check(MemberVO vo) throws Exception {
		System.out.println(service.member_id_check(vo));
		return String.valueOf(service.member_id_check(vo));
	}
}
