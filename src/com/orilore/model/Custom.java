package com.orilore.model;

import java.util.List;

public class Custom{
	private Integer id;//ID
	private String phone;//联系电话
	private String name;//姓名
	private String sex;//性别
	private String hiredate;//登记日期
	private Integer status;//状态
	private String info;//备注
	private int page;//页码
	private int count;//每页数量
	private List<Car> cars;//车辆
	
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	public void setPhone(String phone){
		this.phone=phone;	}

	public String getPhone(){
		return this.phone;
	}

	public void setName(String name){
		this.name=name;
	}
	public String getName(){
		return this.name;
	}
	public void setSex(String sex){
		this.sex=sex;
	}
	public String getSex(){
		return this.sex;
	}
	
	public void setHiredate(String hiredate){
		this.hiredate=hiredate;
	}
	public String getHiredate(){
		if(this.hiredate!=null && this.hiredate.length()>10){
			return this.hiredate.substring(0,10);
		}
		return this.hiredate;
	}
	
	public void setStatus(Integer status){
		this.status=status;
	}
	public Integer getStatus(){
		return this.status;
	}
	public List<Car> getCars() {
		return cars;
	}
	public void setCars(List<Car> cars) {
		this.cars = cars;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}