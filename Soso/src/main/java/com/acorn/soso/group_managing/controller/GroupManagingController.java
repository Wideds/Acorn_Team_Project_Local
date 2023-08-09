package com.acorn.soso.group_managing.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.acorn.soso.group.dto.GroupDto;
import com.acorn.soso.group.service.GroupService;
import com.acorn.soso.group_managing.dao.GroupManagingDao;
import com.acorn.soso.group_managing.dto.GroupManagingDto;
import com.acorn.soso.group_managing.service.GroupManagingService;

@Controller
public class GroupManagingController {
	
	@Autowired
	GroupManagingService service;
	
	
	@GetMapping("/group_managing/admin_main")
	public String admin_main(HttpServletRequest request, HttpSession session) {
		String manager_id = (String)session.getAttribute("id");
		service.getGroupList(manager_id, request);
		return "group_managing/admin_main";
	}
	
	@GetMapping("/group_managing/joinApprove")
	public String joinApprove(int num) {
		service.joinApprove(num);
		return "group_managing/joinApprove";
	}
	
	@GetMapping("/group_managing/user_main")
	public String user_main() {
		return "group_managing/user_main";
	}
	
	@GetMapping("/group_managing/group_insertForm")
	public String group_insertForm() {
		return "group_managing/group_insertForm";
	}
	
	@GetMapping("/group_managing/group_updateForm")
	public String group_updateForm(int num, HttpServletRequest request, HttpSession session) {
		String manager_id = (String)session.getAttribute("id");
		GroupDto dto = service.getGroupData(num, request);
		if(dto.getManager_id().equals(manager_id)) {
			return "group_managing/group_updateForm";
		}
		return "redirect:/group_managing/admin_main";
	}
	@PostMapping("/group_managing/group_update")
	public String group_update(GroupDto dto, HttpServletRequest request) {
		service.updateGroupData(dto, request);
		return "redirect:/group_managing/admin_main";
	}
	@GetMapping("/group_managing/group_delete")
	public String group_delete(int num, HttpServletRequest request, HttpSession session) {
		String manager_id = (String)session.getAttribute("id");
		GroupDto dto = service.getGroupData(num, request);
		if(dto.getManager_id().equals(manager_id)) {
			service.deleteGroupData(num);
			return "redirect:/group_managing/admin_main";
		} else {
			return "redirect:/group_managing/admin_main";
		}
	}
	
	@GetMapping("/group_managing/group_userdetail")
	public String group_userdetail() {
		return "group_managing/group_userdetail";
	}
	
	@GetMapping("/group_managing/applicantList")
	public String group_applicantList(GroupManagingDto dto, HttpServletRequest request) {
		dto.setGroupNum(1);
		service.getApplicantList(dto, request);
		
		return "group_managing/applicantList";
	}
	
	@GetMapping("/group_managing/memberList")
	public String group_memberList(GroupManagingDto dto, HttpServletRequest request) {
		dto.setGroupNum(1);
		service.getMemberList(dto, request);
		return "group_managing/memberList";
	}
	
	@GetMapping("/group_managing/kickedMemberList")
	public String group_kickedMemberList(GroupManagingDto dto, HttpServletRequest request) {
		dto.setGroupNum(1);
		service.getKickedMemberList(dto, request);
		return "group_managing/kickedMemberList";
	}
	
	@GetMapping("/group_managing/rejectedApplicantList")
	public String group_rejectedApplicantList(GroupManagingDto dto, HttpServletRequest request) {
		dto.setGroupNum(1);
		service.getRejectedApplicantList(dto, request);
		return "group_managing/rejectedApplicantList";
	}
	
	@GetMapping("/group_managing/kick")
	public String kick(int num) {
		service.kick(num);
		return "redirect:/group_managing/memberList";
	}
	
	@GetMapping("/group_managing/reject")
	public String reject(int num) {
		service.reject(num);
		return "/group_managing/applicantList";
	}
	
	@GetMapping("/group_managing/dropOut")
	public String dropOut(int num) {
		service.dropOut(num);
		return "redirect:/group_managing/memberList";
	}
}
