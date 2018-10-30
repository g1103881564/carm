package com.orilore.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orilore.bizs.IEmpBiz;
import com.orilore.model.Emp;

@Controller
@Scope("prototype")
@RequestMapping("/pages/emp/")
public class CtrEmp {
	@Resource
	private IEmpBiz biz;
	@RequestMapping("find/{page}/{count}")
	public @ResponseBody List<Emp> findAll(@PathVariable("page") int page,@PathVariable("count") int count){
		return biz.findEmp(page,count);
	}
	@RequestMapping("count/{count}")
	public @ResponseBody int getPages(@PathVariable("count") int count){
		return biz.getPages(count);
	}
	@RequestMapping("remove/{id}")
	public @ResponseBody boolean remove(@PathVariable("id") int id){
		return biz.removeEmp(id);
	}
	@RequestMapping("save")
	public @ResponseBody boolean save(@RequestBody Emp bean){
		if(bean.getId()==null){
			return biz.addEmp(bean);
		}else{
			return biz.modifyEmp(bean);
		}
	}
}
