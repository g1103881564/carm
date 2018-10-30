package com.orilore.mappers;

import java.util.*;
import com.orilore.model.Car;

public interface CarMapper {
	public void insert(Car bean);
	public Car selectOne(int id);
	public Car getCarByNo(String no);
	public Car getCarByCode(String code);
	public void delete(int id);
	public int count(Map<String,Object> condition);
	public List<Car> select(Map<String,Object> condition);
	public void update(Car bean);
	public List<String> getNos();
}
