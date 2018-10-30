package com.orilore.model;
public class Category{
	private Integer id;//配件分类ID
	private String name;//配件分类名称
	private Integer status;//状态
	
	public void setId(Integer id){
		this.id=id;	}
	public Integer getId(){
		return this.id;
	}
	public void setName(String name){
		this.name=name;
	}	public String getName(){
		return this.name;
	}
	public void setStatus(Integer status){
		this.status=status;
	}
	public Integer getStatus(){
		return this.status;
	}
}