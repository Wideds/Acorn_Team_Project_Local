package com.acorn.soso.group.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acorn.soso.group.dao.GroupReviewDao;
import com.acorn.soso.group.dto.GroupDto;
import com.acorn.soso.group.dto.GroupReviewDto;
import com.acorn.soso.group.dto.JjimDto;
import com.acorn.soso.group.service.GroupService;

@Controller
public class GroupController {

	@Autowired
	private GroupService service;
	
	//찜하기 기능 구현(ajax없이)
	@PostMapping("/group/jjim")
	//id값과 num값을 받아오기 위해 request만들기
	public String jjim(HttpServletRequest request) {
		service.jjim(request);
		return "redirect:/group/test?num=1";
	}
		
	//리뷰 수정 요청 처리(json)
	@RequestMapping("/group/review_update")
	@ResponseBody
	public Map<String, Object> reviewUpdate(GroupReviewDto dto){
		service.updateReview(dto);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isSuccess", true);
		return map;
	}
	
	//소모임 가입 신청
	@PostMapping("/group/join")
	//num값을 가져오기 위한 request
	//정보를 담기 위한 model
	public String join(HttpServletRequest request) {
		service.joinGroup(request);
		//insert하면 리다일렉트->나중에 호출한 곳으로 돌아가는 로직 구상
		return "redirect:/";
	}
	
	//test페이지 불러오면서 후기글 불러오기 위한 service 호출
	@GetMapping("/group/test")
	public String test(HttpServletRequest request, Model model) {
		service.reviewList(request, model);
		service.knowjjim(request);
		return "group/test";
	}
	
	@GetMapping("/group/group_in")
	public String groupIn() {
		
		return "group/group_in";
	}
	
	//리뷰 삭제
	@RequestMapping("/group/review_delete")
	@ResponseBody
	public Map<String, Object> reviewDelete(HttpServletRequest request){
		service.deleteReview(request);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isSuccess", true);
		return map;
	}
	//댓글 더보기
	@RequestMapping("/group/ajax_review_list")
	public String reviewList(HttpServletRequest request) {
		try {
			Thread.sleep(1000);
		}catch(InterruptedException e) {
			e.printStackTrace();
		}
		service.moreReview(request);
		return "group/ajax_review_list";
	}
	//새로운 댓글 저장 요청 처리
	@RequestMapping("group/review_insert")
	public String reviewInsert(HttpServletRequest request, int ref_group) {
		service.saveReview(request);
		return "redirect:/group/detail?num="+ref_group;
	}
	
	//소모임 추가하기
	@PostMapping("/group/insert")
	public String insert(GroupDto dto, HttpServletRequest request) {
		service.insert(dto, request);
		return "group/insert";
	}
	
	//delete
	@RequestMapping("/group/delete")
	public String delete(int num) {
		service.delete(num);
		return "redirect:/group/list";
	}
	//update
	@RequestMapping("/group/update")
	public String update(GroupDto dto, HttpServletRequest request) {
		service.update(dto, request);
		return "redirect:/group/list";
		
	}
	
	//updateform 이동
	@RequestMapping("/group/update_form")
	public ModelAndView uploadform(ModelAndView mView, int num) {
		service.getDetail(mView, num);
		mView.setViewName("group/update_form");
		return mView;
	}
	
	//detail 페이지
	@RequestMapping(method =RequestMethod.GET , value = "/group/detail")
	public ModelAndView detail(ModelAndView mView, int num) {
		service.getDetail(mView, num);		
		mView.setViewName("group/detail");
		return mView;
	}
	
	//사진 업로드 & DB 저장
	@RequestMapping(method = RequestMethod.POST, value = "/group/upload")
	public String upload(GroupDto dto, HttpServletRequest request) {
		service.saveImage(dto, request);
		return "redirect:/group/list";
	}
	
	//갤러리 form 페이지 이동
	@RequestMapping("/group/upload_form")
	public String upload_form(HttpServletRequest request) {
		return "group/upload_form";
	}
	
	//갤러리 리스트 이동
	@RequestMapping("/group/list")
	public String list(HttpServletRequest request) {
		service.getList(request);
		return "group/list";
	}
	
	//랭킹 리스트 이동
	@RequestMapping("/ranking/list")
	public String Rankinglist(HttpServletRequest request) {
		service.getRanking(request);
		return "ranking/list";
	}
	
	//메인 페이지로 이동
	@RequestMapping("/")
	public String home(HttpServletRequest request) {
		service.getRanking(request);
		return "home";
	}
	
	//업데이트 폼 이동, 업데이트, 삭제는 일단 나중에 하기로ㅇㅇ
}
