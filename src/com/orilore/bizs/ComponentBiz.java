package com.orilore.bizs;
import com.orilore.model.*;
import com.orilore.mappers.*;
import java.util.*;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service
public class ComponentBiz implements IComponentBiz{
	@Resource
	private ComponentMapper mapper;
	@Override
	public Component addComponent(Component bean) {
		mapper.insert(bean);
		return bean;
	}
	@Override
	public boolean removeComponent(int id) {
		mapper.delete(id);
		return true;
	}
	@Override
	public Component modifyComponent(Component bean) {
		mapper.update(bean);
		return bean;
	}
	@Override
	public Component getComponent(int id) {
		return mapper.selectOne(id);
	}
	@Override
	public List<Component> findComponent(int page,int count) {
		return mapper.select((page-1)*count,count);
	}
	@Override
	public List<Component> findComponent(Comp bean) {
		bean.setPage((bean.getPage()-1)*bean.getCount());
		return mapper.query(bean);
	}
	@Override
	public List<Component> getSimple() {
		return mapper.getSimple();
	}
	@Override
	public int getPages(Comp bean) {
		int p = bean.getCount();
		int n = mapper.count(bean);
		int m = 1;
		if(n%p==0){
			m = n/p;
		}else{
			m = n/p+1;
		}
		return m;
	}
	
	@Override
	public List<Stock> stockState() {
		return mapper.selectState();
	}
	
	@Override
	public List<Component> stockWarning() {
		return mapper.selectWarning();
	}
	@Override
	public List<Money> stockMoney(Money money) {
		return mapper.selectMoney(money);
	}
}
