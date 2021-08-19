package com.phone.vo;

//	VO 객체
//	- 처리 로직을 갖지 않는다
//	- 순수 데이터를 가지는 객체
//	- 기본 생성자가 있어야 한다
//	- toString, equals 등은 오버라이드 하기도 한다

public class PhoneBookVO {
	//	필드
	//	VO 객체에서는 기본 타입 대신 Wrapper 사용
	private Long Id;
	private String name;
	private String hp;
	private String tel;
	
	//	생성자 - 기본 생성자가 필요
	public PhoneBookVO() {}
	
	public PhoneBookVO(String name, String hp, String tel) {
		this.name = name;
		this.hp = hp;
		this.tel = tel;
	}
	
//	생성자 필요한지 파악 후 활성화 할 것
	public PhoneBookVO(Long id, String name, String hp, String tel) {
		this(name, hp, tel);
		this.Id = id;
		}
	
	//	getter & setter
	public Long getId() {
		return Id;
	}

	public void setId(Long id) {
		this.Id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "PhoneBookVO [Id=" + Id + ", name=" + name + ", hp=" + hp + ", tel=" + tel + "]";
	}
	
	
	
}

	

