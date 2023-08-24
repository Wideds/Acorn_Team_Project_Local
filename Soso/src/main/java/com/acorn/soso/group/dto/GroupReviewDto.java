package com.acorn.soso.group.dto;

import org.apache.ibatis.type.Alias;

import com.acorn.soso.users.dto.UsersDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("reviewDto")
public class GroupReviewDto {
	private int review_num;
	private int group_num;
	private String writer;
	private String content;
	private String profile;
	private String regdate;
	private int rate;
	private int startRowNum;
	private int endRowNum;
}
