package com.orilore.model;

import java.util.List;

public class Component{
	private Integer fid;//供货商ID
	private Integer id;//配件ID
	private Integer cid;//分类ID
	private Integer status;//状态
	private Float price;//进价
	private Float sale;//售价
	private Integer warning;//库存预警
	private String code;//编号	private String name;//名称
	private String factory;//厂家
	private String term;//保修期
	private String info;//备注
	private Factory fact;//供应商
	private Category cate;//分类
	private Factory supplier;//供应商
	private List<Stock> stocks;//库存
	
	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){		return this.id;
	}
	public void setCode(String code){
		this.code=code;
	}
	public String getCode(){
		return this.code;
	}	public void setName(String name){
		this.name=name;
	}
	public String getName(){
		return this.name;
	}
	public void setPrice(Float price){
		this.price=price;
	}
	public Float getPrice(){
		return this.price;
	}
	public void setSale(Float sale){
		this.sale=sale;
	}
	public Float getSale(){
		return this.sale;
	}
	public void setFactory(String factory){		this.factory=factory;
	}
	public String getFactory(){
		return this.factory;
	}
	public void setStatus(Integer status){
		this.status=status;	}
	public Integer getStatus(){
		return this.status;
	}
	public void setTerm(String term){
		this.term=term;
	}	public String getTerm(){
		return this.term;
	}
	public void setCid(Integer cid){
		this.cid=cid;	}
	public Integer getCid(){
		return this.cid;
	}
	public void setInfo(String info){
		this.info=info;
	}	public String getInfo(){
		return this.info;
	}
	public Integer getFid() {
		return fid;
	}
	public void setFid(Integer fid) {
		this.fid = fid;
	}
	public Factory getFact() {
		return fact;
	}
	public void setFact(Factory fact) {
		this.fact = fact;
	}
	public Category getCate() {
		return cate;
	}
	public void setCate(Category cate) {
		this.cate = cate;
	}
	public List<Stock> getStocks() {
		return stocks;
	}
	public void setStocks(List<Stock> stocks) {
		this.stocks = stocks;
	}
	public Integer getWarning() {
		return warning;
	}
	public void setWarning(Integer warning) {
		this.warning = warning;
	}
	public Factory getSupplier() {
		return supplier;
	}
	public void setSupplier(Factory supplier) {
		this.supplier = supplier;
	}
}