package com.orilore.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orilore.bizs.IComponentBiz;
import com.orilore.model.Comp;
import com.orilore.model.Component;
import com.orilore.model.Money;

@Controller
@Scope("prototype")
@RequestMapping("/pages/component/")
public class CtrComponent {
	@Resource
	private IComponentBiz biz;
	//��ӻ�������
	@RequestMapping("save")
	public @ResponseBody Component save(@RequestBody Component bean){
		if(bean.getId()!=null && bean.getId()>0){
			bean = biz.modifyComponent(bean);
		}else{
			bean = biz.addComponent(bean);
		}
		return bean;
	}
	//����ID��ѯ�����Ϣ
	@RequestMapping("get/{id}")
	public @ResponseBody Component get(@PathVariable("id") int id){
		Component component = null;
		if(id>0){
			component = biz.getComponent(id);
		}
		return component;
	}
	//����IDɾ�������Ϣ
	@RequestMapping("remove/{id}")
	public @ResponseBody boolean remove(@PathVariable("id") int id){
		if(id>0){
			biz.removeComponent(id);
			return true;
		}
		return false;
	}
	
	//��ѯ�����Ҫ��Ϣ
	@RequestMapping("simple")
	public @ResponseBody List<Component> getSimple(){
		return biz.getSimple();
	}
	
	@RequestMapping("count")
	public @ResponseBody int getPages(@RequestBody Comp bean){
		return biz.getPages(bean);
	}
	//�������������ѯ�����Ϣ
	@RequestMapping("query")
	public @ResponseBody List<Component> query(@RequestBody Comp bean){
		return biz.findComponent(bean);
	}
	
	//ͳ�������ֵ��Ϣ
	@RequestMapping("money")
	public @ResponseBody List<Money> money(@RequestBody Money bean){
		return biz.stockMoney(bean);
	}
	
	//���ݷ�ҳ��ѯ�����Ϣ
	@RequestMapping("find/{page}/{count}")
	public @ResponseBody List<Component> find(@PathVariable("page") int page,@PathVariable("count") int count){
		return biz.findComponent(page,count);
	}
}
