package com.acorn.soso.users.controller;

import org.springframework.stereotype.Controller;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.acorn.soso.users.dto.UsersDto;
import com.acorn.soso.users.service.KakaoService;
import com.acorn.soso.users.service.OAuthService;
import com.acorn.soso.users.service.UsersService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
public class KakaoController {
    @Autowired
    private KakaoService kakaoservice;

    @Autowired
    private UsersService userservice;

    @RequestMapping(value = "/kakao_callback", method = RequestMethod.GET)
    public String redirectkakao(@RequestParam String code, HttpSession session) throws IOException {
        // System.out.println("code:: " + code);

        // 접속토큰 get
        String kakaoToken = kakaoservice.getReturnAccessToken(code);

        // 접속자 정보 get
        Map<String, Object> result = kakaoservice.getUserInfo(kakaoToken);
        // log.info("result:: " + result);
        String snsId = (String) result.get("id");
        String userName = (String) result.get("nickname");
        String email = (String) result.get("email");
        String userpw = snsId;

        // 분기
        UsersDto dto = new UsersDto();
        // 일치하는 snsId 없을 시 회원가입
        // System.out.println(oservice.kakaoLogin(snsId));
        if (userservice.kakaoLogin(snsId) == null) {
            // log.warn("카카오로 회원가입");
            dto.setUserid(email);
            dto.setUserpw(userpw);
            dto.setUserName(userName);
            dto.setSnsId(snsId);
            dto.setEmail(email);
            userservice.kakaoJoin(dto);
        }

        // 일치하는 snsId가 있으면 멤버객체에 담음.
        // log.warn("카카오로 로그인");
        String userid = userservice.findUserIdBy2(snsId);
        UserDto dto = userservice.findByUserId(userid);
        // log.warn("member:: " + vo);
        CustomUser user = new CustomUser(vo);
        // log.warn("user : " + user);
        List<GrantedAuthority> roles = CustomUser.getList(vo);
        Authentication auth = new UsernamePasswordAuthenticationToken(user, null, roles);
        // log.warn("auth : " + auth);
        SecurityContextHolder.getContext().setAuthentication(auth);
        // SessionConfigVO configVO =new SessionConfigVO();
        // configVO.setUser_name((String)result.get("nickname"));
        // configVO.setProfile_img((String)result.get("profile_image"));

        // session.setAttribute("sessionConfigVO", configVO);
        /* 로그아웃 처리 시, 사용할 토큰 값 */
        session.setAttribute("kakaoToken", kakaoToken);

        return "redirect:/";

    }
}
