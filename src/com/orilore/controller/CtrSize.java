package com.orilore.controller;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.orilore.bizs.ISizeBiz;
import com.orilore.model.Size;

@Controller
@Scope("prototype")
@RequestMapping("/pages/size/")
public class CtrSize {
	@Resource
	private ISizeBiz biz;
	@RequestMapping("find/{bid}/{page}/{count}")
	public @ResponseBody List<Size> findAll(@PathVariable("bid") int bid,@PathVariable("page") int page,@PathVariable("count") int count){
		return biz.findSize(bid,page,count);
	}
	@RequestMapping("count/{bid}/{count}")
	public @ResponseBody int getPages(@PathVariable("bid") int bid,@PathVariable("count") int count){
		return biz.getPages(bid,count);
	}
	@RequestMapping("remove/{id}")
	public @ResponseBody boolean remove(@PathVariable("id") int id){
		return biz.removeSize(id);
	}
	@RequestMapping("save")
	public @ResponseBody boolean save(@RequestBody Size bean){
		if(bean.getId()==null){
			return biz.addSize(bean);
		}else{
			return biz.modifySize(bean);
		}
	}
	
}
