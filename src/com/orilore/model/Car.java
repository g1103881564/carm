package com.orilore.model;

import java.util.List;

public class Car{
	private Integer id;//ID
	private Integer bid;//����Ʒ��ID
	private Integer sid;//�����ͺ�ID
	private Integer pid;//�������ͻ���ID
	private String code;//����ʶ����
	private String color;//������ɫ
	private String no;//���ƺ�
	private Float km;//������
	private String hiredate;//�Ǽ�����
	private String info;//��ע
	private Integer status;//״̬
	private Integer year;//�������
	private Custom custom;//�������ͻ���
	private Brand brand;//����Ʒ��
	private Size size;//�����ͺ�
	private List<Record> records;//ά�޼�¼
	
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