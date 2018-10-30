package com.orilore.model;
public class Brand{
	private Integer id;//ID
	private String name;//Æ·ÅÆÃû³Æ
	private Integer status;//É¾³ý×´Ì¬
	
	public void setId(Integer id){
		this.id=id;	}
	public Integer getId(){
		return this.id;
	}
	public void setName(String name){
		this.name=name;
	}
	public String getName(){
		return this.name;
	}
	public void setStatus(Integer status){
		this.status=status;
	}
	public Integer getStatus(){
		return this.status;
	}
}