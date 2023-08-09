package com.acorn.soso.users.info.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.acorn.soso.users.info.service.UsersInfoService;

@Controller
public class UsersInfoController {
	@Autowired
	private UsersInfoService service;
    
	//작성 글 보기
	@GetMapping("/users/info/writing_list")
	public String WritingList(Model model) {
		service.getWritingList(model);
		return "users/info/writing_list";
	}
	
	//작성 댓글 보기
	@GetMapping("/users/info/comment_list")
	public String CommentList(Model model) {
		service.getCommentList(model);
		return "users/info/comment_list";
	}
	
	//작성 문의 보기
	@GetMapping("/users/info/support_list")
	public String SupportList(Model model) {
		service.getSupportList(model);
		return "users/info/support_list";
	}
}
