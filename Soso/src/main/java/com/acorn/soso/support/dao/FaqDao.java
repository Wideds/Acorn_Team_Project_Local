package com.acorn.soso.support.dao;

import java.util.List;

import com.acorn.soso.support.dto.FaqDto;

public interface FaqDao {
	//질문 목록
	public List<FaqDto>getList(FaqDto dto);
	//질문 추가
	public void insert(FaqDto dto);
	//키워드를 활용한 글정보 얻어오기 (키워드에 부합하는 글중에서 이전글, 다음글의 글번호도 얻어올수 있도록)
	public FaqDto getData(FaqDto dto);
	//질문 정보 얻어오기
	public FaqDto getData(int faq_num);
	//질문의 갯수
	public int getCount(FaqDto dto);
	//질문 수정
	public void update(FaqDto dto);
	//질문 삭제
	public void delete(int faq_num);

}
