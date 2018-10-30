package com.orilore.model;

import java.util.List;

public class Car{
	private Integer id;//ID
	private Integer bid;//车辆品牌ID
	private Integer sid;//车辆型号ID
	private Integer pid;//车主（客户）ID
	private String code;//车辆识别码
	private String color;//车辆颜色
	private String no;//车牌号
	private Float km;//公里数
	private String hiredate;//登记日期
	private String info;//备注
	private Integer status;//状态
	private Integer year;//出厂年份
	private Custom custom;//车主（客户）
	private Brand brand;//车辆品牌
	private Size size;//车辆型号
	private List<Record> records;//维修记录
	
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	public void setSid(Integer sid){
		this.sid=sid;
	}
	public Integer getSid(){
		return this.sid;
	}
	public void setCode(String code){
		this.code=code;
	}
	public String getCode(){
		return this.code;
	}
	public void setColor(String color){
		this.color=color;
	}
	public String getColor(){
		return this.color;
	}
	public void setPid(Integer pid){
		this.pid=pid;
	}
	public Integer getPid(){
		return this.pid;
	}
	public void setInfo(String info){
		this.info=info;
	}
	public String getInfo(){
		return this.info;
	}
	public void setStatus(Integer status){
		this.status=status;
	}
	public Integer getStatus(){
		return this.status;
	}
	public void setYear(Integer year){
		this.year=year;
	}
	public Integer getYear(){
		return this.year;
	}
	public Float getKm() {
		return km;
	}
	public void setKm(Float km) {
		this.km = km;
	}
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getHiredate() {
		return hiredate;
	}
	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
	public Custom getCustom() {
		return custom;
	}
	public void setCustom(Custom custom) {
		this.custom = custom;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	public Size getSize() {
		return size;
	}
	public void setSize(Size size) {
		this.size = size;
	}
	public List<Record> getRecords() {
		return records;
	}
	public void setRecords(List<Record> records) {
		this.records = records;
	}
}