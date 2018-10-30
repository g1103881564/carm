package com.orilore.model;

public class Comp {
	private Integer cid;
	private Integer fid;
	private String name;
	private String factory;
	private Float price;
	private Float price2;
	private Float sale;
	private Float sale2;
	private Integer page;
	private Integer count;
	
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getFid() {
		return fid;
	}
	public void setFid(Integer fid) {
		this.fid = fid;
	}
	public String getName() {
		if(this.name!=""){
			return "%"+name+"%";
		}else{
			return null;
		}
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFactory() {
		if(this.factory!=""){
			return "%"+factory+"%";
		}else{
			return null;
		}
	}
	public void setFactory(String factory) {
		this.factory = factory;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public Float getPrice2() {
		return price2;
	}
	public void setPrice2(Float price2) {
		this.price2 = price2;
	}
	public Float getSale() {
		return sale;
	}
	public void setSale(Float sale) {
		this.sale = sale;
	}
	public Float getSale2() {
		return sale2;
	}
	public void setSale2(Float sale2) {
		this.sale2 = sale2;
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
	
}
