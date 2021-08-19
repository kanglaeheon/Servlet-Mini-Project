package com.phone.dao;

import java.util.List;

import com.phone.vo.PhoneBookVO;

public interface PhoneBookDAO {
	public List<PhoneBookVO> getList();	//	전체 목록
	public List<PhoneBookVO> search(String keyword);	//	검색 목록
	public boolean insert(PhoneBookVO vo);	//	삽입
	public boolean delete(Long id);	//	삭제
}
