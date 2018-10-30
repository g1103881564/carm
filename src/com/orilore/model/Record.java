package com.orilore.model;

import java.util.List;

public class Record{
	private Integer id;//ID
	private Integer cid;//车辆ID
	private Float ymoney;//应收
	private Float smoney;//实收
	private Float smoney1;
	private Float hmoney;//工时费
	private Float money;//毛利
	private String pay;//支付方式
	private String mdate;//维修日期
	private String mdate1;
	private String info;//备注
	private Integer emp;//员工ID
	private Integer status;//维修状态1完成0未完成
	private Integer page;//页码
	private Integer count;//每页显示的记录数
	private String ename;//维修人员姓名
	private String cname;//客户姓名
	private String no;//车牌号码
	private String code;//车辆识别码
	private List<Detail> details;//详情
	
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return this.id;
	}
	
	public void setCid(Integer cid){
		this.cid=cid;
	}
	public Integer getCid(){
		return this.cid;
	}
	
	public void setYmoney(Float ymoney){
		this.ymoney=ymoney;
	}
	public Float getYmoney(){
		return this.ymoney;
	}
	
	public void setSmoney(Float smoney){
		this.smoney=smoney;
	}
	public Float getSmoney(){
		return this.smoney;
	}
	
	public void setMdate(String mdate){
		this.mdate=mdate;
	}
	public String getMdate(){
		if(this.mdate!=null && this.mdate.length()>10){
			return this.mdate.substring(0,10);
		}
		return this.mdate;
	}
	
	public void setInfo(String info){
		this.info=info;
	}
	public String getInfo(){
		return this.info;
	}
	
	public void setEmp(Integer emp){
		this.emp=emp;
	}
	public Integer getEmp(){
		return this.emp;
	}
	
	public void setStatus(Integer status){
		this.status=status;
	}
	public Integer getStatus(){
		return this.status;
	}

	public Float getHmoney() {
		return hmoney;
	}

	public void setHmoney(Float hmoney) {
		this.hmoney = hmoney;
	}

	public Float getMoney() {
		return money;
	}

	public void setMoney(Float money) {
		this.money = money;
	}

	public Float getSmoney1() {
		return smoney1;
	}

	public void setSmoney1(Float smoney1) {
		this.smoney1 = smoney1;
	}

	public String getMdate1() {
		return mdate1;
	}

	public void setMdate1(String mdate1) {
		this.mdate1 = mdate1;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public List<Detail> getDetail() {
		return details;
	}

	public void setDetail(List<Detail> details) {
		this.details = details;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}
}