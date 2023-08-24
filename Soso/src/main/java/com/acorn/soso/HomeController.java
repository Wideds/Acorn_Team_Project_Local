package com.acorn.soso;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.acorn.soso.group.service.GroupService;


@Controller
public class HomeController {
	@Autowired
	private GroupService service;	
	
	@GetMapping("/")
	public String home(HttpServletRequest request) {
		return "redirect:main";
	}
	
	@GetMapping("/main")
	public String view(HttpServletRequest request, Model model) {
		service.getViewList(request, model);
		return "main";
	}
	
}
