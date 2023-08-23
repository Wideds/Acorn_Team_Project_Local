package com.acorn.soso;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {
	@GetMapping("/")
	public String home(HttpServletRequest request) {
		return "redirect:main";
	}
	
	@GetMapping("/main")
	public String main() {
		return "main";
	}
	
}
