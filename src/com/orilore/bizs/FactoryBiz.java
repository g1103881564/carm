package com.orilore.bizs;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.orilore.mappers.FactoryMapper;
import com.orilore.model.Factory;
@Service
public class FactoryBiz implements IFactoryBiz{
	@Resource 
	private FactoryMapper mapper;
	@Override
	public boolean addFactory(Factory bean) {
		try{
			this.mapper.insert(bean);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	@Override
	public boolean removeFactory(int id) {
		try{
			this.mapper.delete(id);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	@Override
	public boolean modifyFactory(Factory bean) {
		try{
			this.mapper.update(bean);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	@Override
	public Factory getFactory(int id) {
		return this.mapper.selectOne(id);
	}
	@Override
	public List<Factory> findFactory(int page,int count) {
		return this.mapper.select((page-1)*count,count);
	}
	@Override
	public int getPages(int count) {
		int n = mapper.count();
		int m = 1;
		if(n%count==0){
			m = n/count;
		}else{
			m = n/count+1;
		}
		return m;
	}
}
