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

import com.draw_calendar.project.DAO.BrandDAO;
import com.draw_calendar.project.VO.BrandVO;
import com.draw_calendar.project.VO.Com_memberVO;
import com.draw_calendar.project.VO.MemberVO;
import com.draw_calendar.project.VO.PagingVO;
import com.draw_calendar.project.service.Brand_service;
import com.draw_calendar.project.service.Com_member_service;

@Controller
public class Com_member_controller {
	
	@Autowired
	Com_member_service service;
	@Autowired
	Brand_service b_service;
	
	@ModelAttribute("com_member_condition")
	public Map<String, String> search_condition_map() {
		Map<String, String> com_member_condition = new LinkedHashMap<String, String>();
		com_member_condition.put("아이디", "id");
		com_member_condition.put("브랜드명(영문)", "brand_name");
		com_member_condition.put("브랜드명", "brand_name_ko");
		com_member_condition.put("사업자 등록번호", "birth");
		return com_member_condition;
	}
	
	@RequestMapping(value="/insert_com_member.do")
	public String insert_com_member(Com_memberVO vo) throws Exception {
		service.insert_com_member(vo);
		BrandVO brand = new BrandVO();
		brand.setBrand_code(vo.getBrand_name().toUpperCase().substring(0, 2));
		brand.setBrand_name(vo.getBrand_name());
		b_service.insert_brand(brand);
		return "redirect:index.jsp";
	}
	
	@RequestMapping(value="/update_com_member.do")
	public String update_com_member(Com_memberVO vo, HttpSession session) throws Exception {
		service.update_com_member(vo);
		session.invalidate();
		return "redirect:index.jsp";
	}
	
	@RequestMapping(value="/delete_com_member.do")
	public String delete_com_member(Com_memberVO vo) throws Exception {
		service.delete_com_member(vo);
		return "redirect:index.jsp";
	}
	
	@RequestMapping(value="/com_member_id_check.do",  method = RequestMethod.POST)
	@ResponseBody
	public String member_id_check(Com_memberVO vo) throws Exception {
		return String.valueOf(service.com_member_id_check(vo));
	}
	
	@RequestMapping(value="/com_login.do")
	public String select_com_member(Com_memberVO vo, BrandVO brand, BrandDAO dao, HttpSession session, HttpServletResponse response) throws Exception {
		Com_memberVO member = service.select_com_member(vo);
		
		if(service.com_member_id_check(vo) == 1) {
			if(vo.getId().equals(member.getId())&&vo.getPassword().equals(member.getPassword())) {
				session.setAttribute("id", member.getId());
				session.setAttribute("brand_name", member.getBrand_name());
				session.setAttribute("kind", "company");
				return "index.jsp";
			} else {
				response.setContentType("text/html; charset=UTF-8");
		        PrintWriter out = response.getWriter();
		        out.println("<script>alert('비밀번호가 틀렸습니다.'); history.go(-1);</script>");
		        out.flush();
		        return "login.jsp";
			}
		}
		if(service.com_member_id_check(vo) == 0) {
			response.setContentType("text/html; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
	        out.flush();
	        return "login.jsp";
		}
		
		return "";
	}
	
	@RequestMapping(value="/select_com_member.do")
	public String select_com_member(Com_memberVO vo, Model model, HttpSession session, HttpServletRequest request,
									@RequestParam( value="state", required=false ) String state
								   ) throws Exception {
		String kind = (String)session.getAttribute("kind");
		String id = "";
		if(kind.equals("admin")) {
			id = request.getParameter("id");
			vo.setId(id);	
			model.addAttribute("member",service.select_com_member(vo));
			
			if( state.equals("on")) {
				return "update_com_member.jsp";
			}
			if( state.equals("off")) {
				return "com_member_detail.jsp";
			}
		}
		if(kind.equals("normal") || kind.equals("company")) {
			vo.setId((String)session.getAttribute("id"));
			model.addAttribute("member",service.select_com_member(vo));
			return "update_com_member.jsp";
		}
		
		return "";
	}
	
	@RequestMapping(value="/select_com_member_list.do")
	public String select_com_member_list(Com_memberVO vo, Model model,
										@RequestParam( value="nowPage", required=false ) String nowPage,
										@RequestParam( value="cntPerPage", required=false ) String cntPerPage
										) throws Exception {
		if( vo.getSearch_condition() == null) vo.setSearch_condition("id"); 
		if( vo.getSearch_keyword() == null) vo.setSearch_keyword("");
		
		int total = service.count_com_member(vo);
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
		System.out.println(service.select_com_member_list(paging));
		
		model.addAttribute("paging", paging);
		model.addAttribute("com_member_list", service.select_com_member_list(paging));
		return "com_member_list.jsp";
	}

}

