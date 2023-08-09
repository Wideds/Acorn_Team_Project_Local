package com.acorn.soso.users.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("usersDto")
public class UsersDto {
	private String id;
	private String pwd;
	private String email;
	private String profile;
	private String regdate;
	private String newPwd;
  
	private String name;
	private String birth;
	private String gender;
	
	private Integer svcUsePolicyAgreement;
	private Integer psInfoProcessAgreement;
    private Integer mktInfoReceiveAgreement;

}
