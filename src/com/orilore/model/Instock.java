package com.orilore.model;

public class Instock {
	private Integer id;
	private Integer cid;
	private Integer fid;
	private String size;
	private Float price;
	private Float sale;
	private Float quantity;
	private String indate;
	private Integer status = 0;
	private String cname;
	private String fname;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
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
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public Float getSale() {
		return sale;
	}
	public void setSale(Float sale) {
		this.sale = sale;
	}
	public Float getQuantity() {
		return quantity;
	}
	public void setQuantity(Float quantity) {
		this.quantity = quantity;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		if(indate!=null && indate.length()>10){
			this.indate = indate.substring(0,10);
		}else{
			this.indate = indate;
		}
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
}
