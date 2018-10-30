package com.orilore.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orilore.bizs.IInstockBiz;
import com.orilore.model.Instock;

@Controller
@RequestMapping("/pages/instock/")
@Scope("prototype")
public class CtrInstock {
	@Resource
	private IInstockBiz biz;
	
	@RequestMapping("add")
	public @ResponseBody boolean add(@RequestBody Instock bean){
		return biz.addInstock(bean);
	}
	
	@RequestMapping("get/{id}")
	public @ResponseBody Instock get(@PathVariable int id){
		return biz.getInstock(id);
	}
	
	@RequestMapping("remove/{id}")
	public @ResponseBody boolean remove(@PathVariable int id){
		return biz.removeInstock(id);
	}
	
	@RequestMapping("save")
	public @ResponseBody boolean save(@RequestBody Instock bean){
		return biz.modifyInstock(bean);
	}
	
	@RequestMapping("find")
	public @ResponseBody List<Instock> find(@RequestBody Map<String,Object> condition){
		return biz.findInstock(condition);
	}
	
	@RequestMapping("count")
	public @ResponseBody int getPages(@RequestBody Map<String,Object> condition){
		return biz.getPages(condition);
	}
	
	@RequestMapping("year/{y}")
	public @ResponseBody List<Instock> stateYear(@PathVariable("y") String y){
		return biz.yearState(y);
	}
	
	@RequestMapping("month/{m}")
	public @ResponseBody List<Instock> stateMonth(@PathVariable("m") String m){
		String month = m+"-01";
		return biz.monthState(month);
	}
}
