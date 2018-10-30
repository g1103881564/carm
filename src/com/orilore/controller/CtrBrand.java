package com.orilore.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orilore.bizs.IBrandBiz;
import com.orilore.model.Brand;

@Controller
@Scope("prototype")
@RequestMapping("/pages/brand/")
public class CtrBrand {
	@Resource
	private IBrandBiz biz;
	@RequestMapping("find/{page}/{count}")
	public @ResponseBody List<Brand> findAll(@PathVariable("page") int page,@PathVariable("count") int count){
		return biz.findBrand(page,count);
	}
	@RequestMapping("count/{count}")
	public @ResponseBody int getPages(@PathVariable("count") int count){
		return biz.getPages(count);
	}
	@RequestMapping("remove/{id}")
	public @ResponseBody boolean remove(@PathVariable("id") int id){
		return biz.removeBrand(id);
	}
	@RequestMapping("save")
	public @ResponseBody boolean save(@RequestBody Brand bean){
		if(bean.getId()==null){
			return biz.addBrand(bean);
		}else{
			return biz.modifyBrand(bean);
		}
	}
	
}
