package com.orilore.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orilore.bizs.ICategoryBiz;
import com.orilore.model.Category;

@Controller
@Scope("prototype")
@RequestMapping("/pages/category/")
public class CtrCategory {
	@Resource
	private ICategoryBiz biz;
	@RequestMapping("count/{count}")
	public @ResponseBody int getPages(@PathVariable("count") int count){
		return biz.getPages(count);
	}
	
	@RequestMapping("find/{page}/{count}")
	public @ResponseBody List<Category> find(@PathVariable("page") int page,@PathVariable("count") int count){
		return this.biz.findCategory(page, count);
	}
	
	@RequestMapping("remove/{id}")
	public @ResponseBody boolean remove(@PathVariable("id") int id){
		return this.biz.removeCategory(id);
	}
	
	@RequestMapping("save")
	public @ResponseBody boolean save(@RequestBody Category category){
		if(category.getId()==null){
			return this.biz.addCategory(category);
		}else{
			return this.biz.modifyCategory(category);
		}
	}
}
