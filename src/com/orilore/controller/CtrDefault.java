package com.orilore.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orilore.bizs.IComponentBiz;
import com.orilore.bizs.IRecordBiz;
import com.orilore.model.Component;
import com.orilore.model.Record;
import com.orilore.model.Stock;

@Controller
@RequestMapping("/pages/default/")
public class CtrDefault {
	@Resource
	private IComponentBiz biz;
	@Resource
	private IRecordBiz rb;
	
	@RequestMapping("stock")
	public @ResponseBody List<Stock> stockState(){
		return biz.stockState();
	}
	
	@RequestMapping("warning")
	public @ResponseBody List<Component> stockWarning(){
		return biz.stockWarning();
	}
	
	@RequestMapping("current")
	public @ResponseBody List<Record> currentMonth(){
		return rb.currentMonth();
	}
	
}
