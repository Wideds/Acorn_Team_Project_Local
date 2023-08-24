package com.acorn.soso.test.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;

import com.acorn.soso.test.dto.BookDto;

public interface BookService {

	//책의 정보를 불러오기 위한 서비스
	public void getBookList(Model model, HttpServletRequest request);
	
	//책을 임시로 DB에 저장
	public void saveBook(@RequestBody List<BookDto> bookList);
}
