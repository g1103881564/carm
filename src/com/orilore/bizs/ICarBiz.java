package com.orilore.bizs;
import com.orilore.model.*;
import java.util.List;
import java.util.Map;
public interface ICarBiz{
	public Car addCar(Car car);
	public boolean removeCar(int id);
	public Car modifyCar(Car car);
	public Car getCar(int id);
	public Car getCarByNo(String no);
	public int getPages(Map<String,Object> condition);
	public List<Car> findCar(Map<String,Object> condition);
	public List<String> getNos();
}