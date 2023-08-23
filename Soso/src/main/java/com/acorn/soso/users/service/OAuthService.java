package com.acorn.soso.users.service;

public interface OAuthService {
	public void createKakaoUser(String token);
	String getKakaoAccessToken(String code);
	
}
