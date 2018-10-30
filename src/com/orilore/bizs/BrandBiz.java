package com.orilore.bizs;
import com.orilore.model.*;
import com.orilore.mappers.*;
import java.util.*;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
@Service
public class BrandBiz implements IBrandBiz{
	@Resource
	private BrandMapper mapper;
	@Override
	public boolean addBrand(Brand bean) {
		try{
			this.mapper.insert(bean);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	@Override
	public boolean removeBrand(int id) {
		try{
			this.mapper.delete(id);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	@Override
	public boolean modifyBrand(Brand bean) {
		try{
			this.mapper.update(bean);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	@Override
	public Brand getBrand(int id) {
		return this.mapper.selectOne(id);
	}
	@Override
	public List<Brand> findBrand(int page,int count) {
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
