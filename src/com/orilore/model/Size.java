package com.orilore.model;
public class Size{
	private Integer id;//ID
	private String name;//车辆型号
	private Integer bid;//所属品牌
	private Integer status;//状态
	
	public void setId(Integer id){		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	public void setName(String name){
		this.name=name;	}
	public String getName(){
		return this.name;
	}
	public void setBid(Integer bid){
		this.bid=bid;
	}
	public Integer getBid(){
		return this.bid;
	}
	public void setStatus(Integer status){
		this.status=status;
	}	public Integer getStatus(){
		return this.status;
	}
}