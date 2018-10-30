package com.orilore.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orilore.bizs.IFactoryBiz;
import com.orilore.model.Factory;

@Controller
@Scope("prototype")
@RequestMapping("/pages/factory/")
public class CtrFactory {
	@Resource
	private IFactoryBiz biz;
	@RequestMapping("find/{page}/{count}")
	public @ResponseBody List<Factory> find(@PathVariable("page") int page,@PathVariable("count") int count){
		return biz.findFactory(page, count);
	}
	
	@RequestMapping("remove/{id}")
	public @ResponseBody boolean remove(@PathVariable("id") int id){
		return biz.removeFactory(id);
	}
	
	@RequestMapping("count/{count}")
	public @ResponseBody int getPages(@PathVariable("count") int count){
		return biz.getPages(count);
	}
	
	@RequestMapping("get/{id}")
	public @ResponseBody Factory get(@PathVariable("id") int id){
		return biz.getFactory(id);
	}
	
	@RequestMapping("save")
	public @ResponseBody boolean save(@RequestBody Factory bean){
		if(bean.getId()==null){
			return biz.addFactory(bean);
		}else{
			return biz.modifyFactory(bean);
		}
	}
}
