package com.orilore.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orilore.bizs.ICustomBiz;
import com.orilore.model.Custom;

@Controller
@Scope("prototype")
@RequestMapping("/pages/custom/")
public class CtrCustom {
	@Resource
	private ICustomBiz biz;
	@RequestMapping("save")
	public @ResponseBody Custom save(@RequestBody Custom bean){
		if(bean.getId()==null){
			biz.addCustom(bean);
		}else{
			biz.modifyCustom(bean);
		}
		return bean;
	}
	
	@RequestMapping("remove/{id}")
	public @ResponseBody boolean remove(@PathVariable("id") int id){
		return biz.removeCustom(id);
	}
	
	@RequestMapping("count/{count}")
	public @ResponseBody int count(@RequestBody Custom custom, @PathVariable("count") int count){
		return biz.getPages(custom,count);
	}
	
	@RequestMapping("find/{page}/{count}")
	public @ResponseBody List<Custom> find(@RequestBody Custom custom,@PathVariable("page") int page,@PathVariable("count") int count){
		return biz.findCustom(custom,page,count);
	}
	
	@RequestMapping("get/{id}")
	public @ResponseBody Custom get(@PathVariable("id") int id){
		return biz.getCustom(id);
	}
	
	@RequestMapping("getnonames")
	public @ResponseBody List<String> getNonames(){
		return biz.getNonames();
	}
	
	@RequestMapping("query/{phone}")
	public @ResponseBody Custom query(@PathVariable("phone") String phone){
		return biz.getCustomByPhone(phone);
	}
}
