package com.acorn.soso.users.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.acorn.soso.users.service.OAuthService;

@Controller
public class OAuthController {

	@Autowired
	private OAuthService oservice;

	@RequestMapping(value = "/kakao_login")
    public String kakaoCallback(@RequestParam String code, HttpSession session) {
        System.out.println(code);
        String access_Token = oservice.getKakaoAccessToken(code);
        System.out.println("controller access_token : " + access_Token);

        HashMap<String, Object> userInfo = oservice.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);

        // 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            session.setAttribute("userId", userInfo.get("email"));
            session.setAttribute("access_Token", access_Token);
        }

        return "kakao_login"; // kakao.jsp 파일로 이동
    }
	
	@RequestMapping(value = "/kakao")
    public String login(@RequestParam("code") String code, HttpSession session) {
        String access_Token = oservice.getKakaoAccessToken(code);
        HashMap<String, Object> userInfo = oservice.getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);
        
        //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
        if (userInfo.get("email") != null) {
            session.setAttribute("userId", userInfo.get("email"));
            session.setAttribute("access_Token", access_Token);
        }
        return "kakao_login";
    }
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session) {
		oservice.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.removeAttribute("access_Token");
	    session.removeAttribute("userId");
	    return "redirect:/";
	}

}