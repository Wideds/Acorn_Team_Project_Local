package com.acorn.soso.users.service;

import java.util.Map;

public interface KakaoService {

	public String getReturnAccessToken(String code);
	public Map<String,Object> getUserInfo(String access_token);
}
