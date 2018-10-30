package com.orilore.model;

import java.util.List;

public class Record{
	private Integer id;//ID
	private Integer cid;//����ID
	private Float ymoney;//Ӧ��
	private Float smoney;//ʵ��
	private Float smoney1;
	private Float hmoney;//��ʱ��
	private Float money;//ë��
	private String pay;//֧����ʽ
	private String mdate;//ά������
	private String mdate1;
	private String info;//��ע
	private Integer emp;//Ա��ID
	private Integer status;//ά��״̬1���0δ���
	private Integer page;//ҳ��
	private Integer count;//ÿҳ��ʾ�ļ�¼��
	private String ename;//ά����Ա����
	private String cname;//�ͻ�����
	private String no;//���ƺ���
	private String code;//����ʶ����
	private List<Detail> details;//����
	
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