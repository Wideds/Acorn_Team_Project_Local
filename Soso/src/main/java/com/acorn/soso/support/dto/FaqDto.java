package com.acorn.soso.support.dto;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Alias("faqDto")
public class FaqDto {
	//Faq 페이지 필드 값
	
	//질문 번호(내부 관리용 페이지에는 UI 처리 X)
	private int faq_num;
	//질문 카테고리
	private String category;
	//질문 
	private String question;
	//질문 답변
	private String answer;
	//페이지 관리
	private int startRowNum;
	private int endRowNum;
	private int prevNum;  //이전글의 글번호
	private int nextNum;
}
