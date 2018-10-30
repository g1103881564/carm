package com.orilore.model;
public class Detail{
	private Integer cid;//配件ID
	private Integer rid;//维修记录ID
	private String size;//配件型号
	private Integer sid;//配件库存ID
	private Float price;//配件进价
	private Float sale;//配件售价
	private Float quantity;//配件数量
	private Integer status;//状态
	private String pname;
	
	
	public void setCid(Integer cid){
		this.cid=cid;
	}
	public Integer getCid(){
		return this.cid;
	}	public void setRid(Integer rid){
		this.rid=rid;
	}
	public Integer getRid(){
		return this.rid;
	}
	public void setQuantity(Float quantity){		this.quantity=quantity;
	}
	public Float getQuantity(){
		return this.quantity;
	}
	public void setStatus(Integer status){
		this.status=status;
	}	public Integer getStatus(){
		return this.status;
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
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}

}