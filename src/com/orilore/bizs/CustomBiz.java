package com.orilore.bizs;
import com.orilore.model.*;
import com.orilore.mappers.*;
import java.util.*;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
@Service
public class CustomBiz implements ICustomBiz{
	@Resource
	private CustomMapper mapper;
	@Override
	public Custom addCustom(Custom bean) {
		try {
			mapper.insert(bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	@Override
	public boolean removeCustom(int id) {
		try {
			mapper.delete(id);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	@Override
	public boolean modifyCustom(Custom bean) {
		try{
			mapper.update(bean);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	@Override
	public Custom getCustom(int id) {
		return mapper.selectOne(id);
	}

	@Override
	public List<Custom> findCustom(Custom custom,int page,int count) {
		custom.setPage((page-1)*count);
		custom.setCount(count);
		return mapper.select(custom);
	}
	@Override
	public Custom getCustomByPhone(String phone) {
		return mapper.selectByPhone(phone);
	}
	@Override
	public int getPages(Custom custom,int count) {
		int n = mapper.count(custom);
		int m = 1;
		if(n%count==0){
			m = n/count;
		}else{
			m = n/count+1;
		}
		return m;
	}
	@Override
	public List<String> getNonames() {
		return this.mapper.getNonames();
	}
}
