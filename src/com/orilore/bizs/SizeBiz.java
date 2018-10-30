package com.orilore.bizs;
import com.orilore.model.*;
import com.orilore.mappers.*;
import java.util.*;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service
public class SizeBiz implements ISizeBiz{
	@Resource
	private SizeMapper mapper;
	@Override
	public boolean addSize(Size bean) {
		try{
			mapper.insert(bean);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	@Override
	public boolean removeSize(int id) {
		try{
			mapper.delete(id);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	@Override
	public boolean modifySize(Size bean) {
		try{
			mapper.update(bean);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	@Override
	public Size getSize(int id) {
		return mapper.selectOne(id);
	}
	@Override
	public List<Size> findSize(int id,int page,int count) {
		return mapper.select(id,(page-1)*count,count);
	}
	@Override
	public int getPages(int bid, int count) {
		int n = mapper.count(bid);
		int m = 1;
		if(n%count==0){
			m = n/count;
		}else{
			m = n/count+1;
		}
		return m;
	}
}
