package com.acorn.soso.group.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("joinDto")
//소모임의 가입을 위한 dto
public class GroupJoinDto {
	//멤버 번호
	private int num;
	//소모임 번호
	private int group_Num;
	private String user_Id;
	private String intro;
	private int isjoin;
	private String request_dt;
	private String join_dt;
	private String kick_dt;
}
