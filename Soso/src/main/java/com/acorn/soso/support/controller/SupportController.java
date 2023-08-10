package com.acorn.soso.support.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SupportController {
	
	@GetMapping("/support/support_main")
	public String support_main() {
		
		return "support/support_main";
	}
	
	@GetMapping("/support/support_faq")
	public String support_faq() {
		
		return "support/support_faq";
	}
	@GetMapping("/support/support_faq_user")
	public String support_faq_user() {
		
		return "support/support_faq_user";
	}
	@GetMapping("/support/support_faq_request")
	public String support_faq_request() {
		
		return "support/support_faq_request";
	}
	@GetMapping("/support/support_faq_open")
	public String support_faq_open() {
		
		return "support/support_faq_open";
	}
	@GetMapping("/support/support_faq_etc")
	public String support_faq_etc() {
		
		return "support/support_faq_etc";
	}
	
	@GetMapping("/support/support_notice")
	public String support_notice() {
		
		return "support/support_notice";
	}
	
	@GetMapping("/support/support_inquire")
	public String support_inquire() {
		
		return "support/support_inquire";
	}
	@GetMapping("/support/support_inquire_register")
	public String support_inquire_register() {
		
		return "support/support_inquire_register";
	}
	@GetMapping("/support/support_inquire_MyInquire")
	public String support_inquire_MyInquire() {
		
		return "support/support_inquire_MyInquire";
	}
}
