package com.orilore.model;
public class Stock{
	private Integer id;//ID
	private Integer cid;//���ID
	private Float quantity;//����
	private Integer status;//״̬
	private Float price;//����
	private Float sale;//�ۼ�
	private String size;//�ͺ�
	private String sname;//�������
	
	public void setId(Integer id){
		this.id=id;
	}

		return this.id;
	}
	
	public void setCid(Integer cid){
		this.cid=cid;
	}

		return this.cid;
	}
	
	public void setQuantity(Float quantity){
		this.quantity=quantity;
	}

		return this.quantity;
	}
	
	public void setStatus(Integer status){
		this.status=status;
	}

		return this.status;
	}

	public Float getSale() {
		return sale;
	}

	public void setSale(Float sale) {
		this.sale = sale;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}
}