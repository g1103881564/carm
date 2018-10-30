package com.orilore.bizs;
import com.orilore.model.*;
import com.orilore.mappers.*;
import java.util.*;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service
public class CarBiz implements ICarBiz{
	@Resource
	private CarMapper mapper;
	@Override
	public Car addCar(Car bean) {
		mapper.insert(bean);
		return bean;
	}
	@Override
	public boolean removeCar(int id) {
		mapper.delete(id);
		return true;
	}
	@Override
	public Car modifyCar(Car bean) {
		mapper.update(bean);
		return bean;
	}
	@Override
	public Car getCar(int id) {
		return mapper.selectOne(id);
	}
	@Override
	public List<Car> findCar(Map<String,Object> map) {
		if(map!=null){
			Integer page = (Integer) map.get("page");
			Integer count = (Integer) map.get("count");
			if(page!=null && count!=null){
				page = (page-1)*count;
				map.put("page", page);
			}
		}
		return mapper.select(map);
	}
	@Override
	public List<String> getNos() {
		return this.mapper.getNos();
	}
	@Override
	public int getPages(Map<String,Object> condition) {
		int n = mapper.count(condition);
		int m = 1;
		Integer pageCount = (Integer)condition.get("count");
		if(pageCount!=null){
			if(n%pageCount==0){
				m = n/pageCount;
			}else{
				m = n/pageCount+1;
			}
		}
		return m;
	}
	@Override
	public Car getCarByNo(String no) {
		Car car = null;
		if(no!=null){
			if(no.length()==7){
				car = mapper.getCarByNo(no);
			}else{
				car = mapper.getCarByCode(no);
			}
		}
		return car;
	}
}
