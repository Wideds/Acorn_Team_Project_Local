package com.acorn.soso.users.service;

import java.util.HashMap;

public interface OAuthService {
	public void createKakaoUser(String token);
	String getKakaoAccessToken(String code);
	public HashMap<String, Object> getUserInfo (String access_Token);
	public void kakaoLogout(String access_Token);
}
