package com.orilore.model;
public class Size{
	private Integer id;//ID
	private String name;//�����ͺ�
	private Integer bid;//����Ʒ��
	private Integer status;//״̬
	
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