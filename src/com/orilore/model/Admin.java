package com.orilore.model;
public class Admin{
	private Integer id;
	private String username;
	private String password;
	private String code;
	
	public void setId(Integer id){
		this.id=id;	}

	public Integer getId(){
		return this.id;
	}
	public void setUsername(String username){
		this.username=username;
	}
	public String getUsername(){
		return this.username;
	}
	public void setPassword(String password){
		this.password=password;
	}
	public String getPassword(){
		return this.password;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
}