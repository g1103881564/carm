package com.orilore.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orilore.bizs.IStockBiz;
import com.orilore.model.Stock;

@Controller
@Scope("prototype")
@RequestMapping("/pages/stock/")
public class CtrStock {
	@Resource
	private IStockBiz biz;
	
	@RequestMapping("find/{cid}")
	public @ResponseBody List<Stock> find(@PathVariable("cid") int cid){
		return biz.findStock(cid);
	}
	
	@RequestMapping("get/{id}")
	public @ResponseBody Stock get(@PathVariable("id") int id){
		return biz.getStock(id);
	}
	
	@RequestMapping("save")
	public @ResponseBody boolean save(@RequestBody List<Map<String,String>> beans){
		List<Stock> stocks = new ArrayList<Stock>();
		for (Map<String,String> map : beans) {
			Stock stock = new Stock();
			stock.setCid(Integer.parseInt(map.get("cid")));
			stock.setSize(map.get("size"));
			stock.setPrice(Float.parseFloat(map.get("price")));
			stock.setSale(Float.parseFloat(map.get("sale")));
			stock.setQuantity(Float.parseFloat(map.get("quantity")));
			stocks.add(stock);
		}
		return biz.addStock(stocks);
	}
}
