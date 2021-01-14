package com.draw_calendar.project.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.draw_calendar.project.DAO.Draw_siteDAO;
import com.draw_calendar.project.VO.Draw_siteVO;
import com.draw_calendar.project.VO.ItemsVO;
import com.draw_calendar.project.VO.PagingVO;
import com.draw_calendar.project.service.Items_service;

@Controller
public class Items_controller {
 
	@Autowired
	Items_service service;
	@Autowired
	Draw_siteDAO dao;
	
	
	@ModelAttribute("items_condition")
	public Map<String, String> search_condition_map() {
		Map<String, String> items_condition = new LinkedHashMap<String, String>();
		items_condition.put("브랜드", "brand_name");
		items_condition.put("모델 코드", "model_code");
		items_condition.put("응모일", "draw_date");
		return items_condition;
	}
	
	@ModelAttribute("items_condition_com")
	public Map<String, String> search_condition_map_com() {
		Map<String, String> items_condition_com = new LinkedHashMap<String, String>();
		items_condition_com.put("모델 코드", "model_code");
		items_condition_com.put("응모일", "draw_date");
		return items_condition_com;
	}
	
	@RequestMapping(value="/insert_item.do")
	public String insert_items(ItemsVO vo, HttpSession session) {
		String kind = (String)session.getAttribute("kind");
		
		service.insert_items(vo);
		if(kind.equals("company")) {
			return "item_list_com.do";			
		}
		if(kind.equals("admin")) {
			return "item_list_admin.do";
		}
		return "";
	}

	@RequestMapping(value="/update_item.do")
	public String update_items(ItemsVO vo, HttpSession session) {
		String kind = (String)session.getAttribute("kind");
		
		service.update_items(vo);
		if(kind.equals("company")) {
			return "item_list_com.do";			
		}
		if(kind.equals("admin")) {
			return "item_list_admin.do";
		}
		return "";
	}	

	@RequestMapping(value="/delete_item.do")
	public String delete_items(ItemsVO vo) {
		service.delete_items(vo);
		return "item_list_com.jsp";
	}

	@RequestMapping(value="/select_items.do")
	public String select_items(ItemsVO vo, Model model, HttpSession session,
							   HttpServletRequest request, HttpServletResponse response,
							   @RequestParam( value="state", required=false ) String state
							   ) {
		String kind = (String)session.getAttribute("kind");
		
		if(state.equals("none")) {
			ItemsVO item = service.select_items(vo);
			
			Cookie[] cookies  = request.getCookies();
			boolean item_cookie_state = false;
			Cookie cookie = null;
			
			if( cookies != null && cookies.length > 0) {
				for(int i = 0; i < cookies.length; i ++) {
					if (cookies[i].getName().equals("item_cookie")) {
						item_cookie_state = true;
						cookie =  new Cookie(cookies[i].getName(), cookies[i].getValue()+item.getBrand_code()+"/");
					}
				}
			}
			
			if( !item_cookie_state ) {
				cookie = new Cookie("item_cookie", item.getBrand_code()+"/"); 
			}
			
			List<Draw_siteVO> site_list = new ArrayList<Draw_siteVO>();
			String[] site_code = item.getSite_code().split("/");
			Draw_siteVO d_vo = new Draw_siteVO();
	
			for( int i = 0; i < site_code.length; i ++) {
				d_vo.setSite_code(site_code[i]);
				site_list.add(dao.select_draw_site(d_vo));
			}
			
			response.addCookie(cookie);
			
			model.addAttribute("site_list", site_list);
			model.addAttribute("item",service.select_items(vo));
			return "item_detail.jsp";			
		}
		
		if(state.equals("off")) {
			model.addAttribute("item",service.select_items(vo));
			return "item_detail_com.jsp";
		}
		
		if(state.equals("on")) {
			model.addAttribute("item",service.select_items(vo));
			return "update_item.jsp";
		}
		
		return "";
	}

	@RequestMapping(value="/item_list.do")
	public String select_items_list(ItemsVO vo ,Model model,
			 						@RequestParam( value="nowPage", required=false ) String nowPage,
			 						@RequestParam( value="cntPerPage", required=false ) String cntPerPage
									) {
		
		if( vo.getSearch_condition() == null) vo.setSearch_condition("brand_name"); 
		if( vo.getSearch_keyword() == null) vo.setSearch_keyword("");
	
		int total = service.count_items(vo);
		if( nowPage == null && cntPerPage == null ) {
			nowPage = "1";
			cntPerPage = "5";
		} else if( nowPage == null ) {
			nowPage = "1";
		} else if( cntPerPage == null ) {
			cntPerPage = "5";
		}
		
		PagingVO paging = new PagingVO( total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		paging.setStart(1);
		
		paging.setSearch_condition(vo.getSearch_condition());
		paging.setSearch_keyword(vo.getSearch_keyword());
		
		model.addAttribute("paging", paging);
		model.addAttribute("item_list", service.select_items_list_paging(paging));
		return "item_list_mem.jsp";
	}
	
	@RequestMapping(value="/item_list_admin.do")
	public String select_items_list_admin(ItemsVO vo ,Model model,
			 						@RequestParam( value="nowPage", required=false ) String nowPage,
			 						@RequestParam( value="cntPerPage", required=false ) String cntPerPage
									) {
		
		if( vo.getSearch_condition() == null) vo.setSearch_condition("brand_name"); 
		if( vo.getSearch_keyword() == null) vo.setSearch_keyword("");
	
		int total = service.count_items(vo);
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
		
		model.addAttribute("paging", paging);
		model.addAttribute("item_list", service.select_items_list_paging(paging));
		return "item_list_admin.jsp";
	}
	
	@RequestMapping(value="/item_list_com.do")
	public String select_items_list_com(ItemsVO vo ,Model model, HttpSession session,
			 						@RequestParam( value="nowPage", required=false ) String nowPage,
			 						@RequestParam( value="cntPerPage", required=false ) String cntPerPage
									) {
		
		if( vo.getSearch_condition() == null) vo.setSearch_condition("model_code"); 
		if( vo.getSearch_keyword() == null) vo.setSearch_keyword("");
		vo.setBrand_name((String)session.getAttribute("brand_name"));
		
		int total = service.count_items_com(vo);
		if( nowPage == null && cntPerPage == null ) {
			nowPage = "1";
			cntPerPage = "5";
		} else if( nowPage == null ) {
			nowPage = "1";
		} else if( cntPerPage == null ) {
			cntPerPage = "5";
		}
		
		PagingVO paging = new PagingVO( total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		paging.setStart(1);
		paging.setSearch_condition(vo.getSearch_condition());
		paging.setSearch_keyword(vo.getSearch_keyword());
		paging.setBrand_name((String)session.getAttribute("brand_name"));
		
		model.addAttribute("paging", paging);
		model.addAttribute("item_list", service.select_items_list_com(paging));
		
		return "item_list_com.jsp";
	}

	@RequestMapping(value="/item_list_simple.do")
	public String select_items_list_simple(ItemsVO vo ,Model model, HttpServletRequest request, HttpServletResponse response, 
										   @RequestParam( value="nowPage", required=false ) String nowPage,
										   @RequestParam( value="cntPerPage", required=false ) String cntPerPage
										   ) {
		if( vo.getSearch_condition() == null) vo.setSearch_condition("brand_name"); 
		if( vo.getSearch_keyword() == null) vo.setSearch_keyword("");
		
		int total = service.count_items(vo);
		if( nowPage == null && cntPerPage == null ) {
			nowPage = "1";
			cntPerPage = "3";
		} else if( nowPage == null ) {
			nowPage = "1";
		} else if( cntPerPage == null ) {
			cntPerPage = "3";
		}
		
		PagingVO paging = new PagingVO( total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		int start = paging.getStart();
		int end = paging.getEnd();
		
		List<ItemsVO> result = new ArrayList<ItemsVO>();
		
		List<ItemsVO> ranked_items = service.select_items_list(vo);
		System.out.println(ranked_items.toString());
		//쿠키 관련 객체 생성
		Cookie[] cookies = request.getCookies();
		String[] item_cookie_list = null;
		Map<String, Integer> cookie_brand_cnt = new HashMap<String, Integer>();
		
		//가져온 쿠키 구분자로 구분
		if(cookies !=null && cookies.length > 0 ) {
			for(int i = 0; i < cookies.length; i++) {
				if ( cookies[i].getName().equals("item_cookie")){
					item_cookie_list = cookies[i].getValue().substring(0,cookies[i].getValue().length()-1).split("/");
					break;
				}
			}
		}
		
		//Map에 담아 쿠키 숫자 카운트
		if( item_cookie_list != null){
			for(String list : item_cookie_list){
				if(cookie_brand_cnt.containsKey(list)){
					cookie_brand_cnt.put(list, cookie_brand_cnt.get(list)+1 );
				} else {
					cookie_brand_cnt.put(list, 1);
				}
			}
		}
		
		if( item_cookie_list != null ) {
	
			List<String> brand_rank = new ArrayList<String>();
			List<Entry<String, Integer>> list_entries = new ArrayList<Entry<String, Integer>>(cookie_brand_cnt.entrySet());
	
			Collections.sort(list_entries, new Comparator<Entry<String, Integer>>() {
				
				public int compare(Entry<String, Integer> obj1, Entry<String, Integer> obj2) {
					return obj2.getValue().compareTo(obj1.getValue());
				}
			});
			
			//키 값만 저장
			for(int i = 0; i < list_entries.size(); i ++) {
				brand_rank.add(list_entries.get(i).getKey());
			}
	
			//저장된 키값을 기준으로 가져온 객체에 Order 할당
			for(int i = 0; i < ranked_items.size(); i ++) {
				for(int j = 0; j < brand_rank.size(); j ++) {
					if(ranked_items.get(i).getBrand_code().equals(brand_rank.get(j))) {
							ranked_items.get(i).setRank(j+1); 
					} 
				}
			}
			
			// Order 기준으로  객체 리스트 정렬, 내림차순
			Comparator<ItemsVO> comparator = new Comparator<ItemsVO>() {
			    @Override
			    public int compare(ItemsVO a, ItemsVO b) {
			    	if(a.getRank() == b.getRank()) return 0;
			    	return a.getRank() - b.getRank();
			    }
			};
			
			Collections.sort(ranked_items, comparator);
				
			for(int i = start; i < end+1; i ++) {
				result.add(ranked_items.get(i-1));
				if( i == ranked_items.size()) break;
			}
			
			model.addAttribute("items_list", result);
		} else {
			
			for(int i = start; i < end+1; i ++) {
				result.add(ranked_items.get(i-1));
				if( i == ranked_items.size()) break;
			}
			model.addAttribute("items_list", result);
			
		}
		
		model.addAttribute("paging", paging);
	
//		int total = service.count_items();
//		if( nowPage == null && cntPerPage == null ) {
//			nowPage = "1";
//			cntPerPage = "3";
//		} else if( nowPage == null ) {
//			nowPage = "1";
//		} else if( cntPerPage == null ) {
//			cntPerPage = "3";
//		}
//		
//		Paging_util paging = new Paging_util(vo, total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
//		
//		List<ItemsVO> ranked_items = service.select_items_list_simple(vo);
//		System.out.println(ranked_items.toString());
//		//쿠키 관련 객체 생성
//		Cookie[] cookies = request.getCookies();
//		String[] item_cookie_list = null;
//		Map<String, Integer> cookie_brand_cnt = new HashMap<String, Integer>();
//		
//		//가져온 쿠키 구분자로 구분
//		if(cookies !=null && cookies.length > 0 ) {
//			for(int i = 0; i < cookies.length; i++) {
//				if ( cookies[i].getName().equals("item_cookie")){
//					item_cookie_list = cookies[i].getValue().substring(0,cookies[i].getValue().length()-1).split("/");
//					break;
//				}
//			}
//		}
//		
//		//Map에 담아 쿠키 숫자 카운트
//		if( item_cookie_list != null){
//			for(String list : item_cookie_list){
//				if(cookie_brand_cnt.containsKey(list)){
//					cookie_brand_cnt.put(list, cookie_brand_cnt.get(list)+1 );
//				} else {
//					cookie_brand_cnt.put(list, 1);
//				}
//			}
//		}
//		
//		//쿠키 카운트 기준으로 정렬 오름차순
//		List<String> brand_rank = new ArrayList<String>();
//		List<Entry<String, Integer>> list_entries = new ArrayList<Entry<String, Integer>>(cookie_brand_cnt.entrySet());
//
//		Collections.sort(list_entries, new Comparator<Entry<String, Integer>>() {
//			
//			public int compare(Entry<String, Integer> obj1, Entry<String, Integer> obj2) {
//				return obj2.getValue().compareTo(obj1.getValue());
//			}
//		});
//		
//		//키 값만 저장
//		for(int i = 0; i < list_entries.size(); i ++) {
//			brand_rank.add(list_entries.get(i).getKey());
//		}
//
//		System.out.println(brand_rank.toString());
//		System.out.println(cookie_brand_cnt.toString());
//
//		//저장된 키값을 기준으로 가져온 객체에 Order 할당
//		for(int i = 0; i < ranked_items.size(); i ++) {
//			for(int j = 0; j < brand_rank.size(); j ++) {
//				if(ranked_items.get(i).getBrand_code().equals(brand_rank.get(j))) {
//						ranked_items.get(i).setRank(j+1); 
//				} 
//			}
//		}
//		
//		// Order 기준으로  객체 리스트 정렬, 내림차순
//		Comparator<ItemsVO> comparator = new Comparator<ItemsVO>() {
//		    @Override
//		    public int compare(ItemsVO a, ItemsVO b) {
//		        return a.getRank() - b.getRank();
//		    }
//		};
//		System.out.println(ranked_items);
//		Collections.sort(ranked_items, comparator);
//		System.out.println(ranked_items);
//		
//		model.addAttribute("paging", vo);
//		model.addAttribute("items_list", ranked_items);
		return "item_simple.jsp";
	}
}