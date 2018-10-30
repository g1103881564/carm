package com.orilore.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orilore.bizs.ICarBiz;
import com.orilore.model.Car;

@Controller
@Scope("prototype")
@RequestMapping("/pages/car/")
public class CtrCar {
	@Resource
	private ICarBiz biz;
	
	/**
	 * 保存车辆信息
	 * @param car
	 * @return boolean
	 */
	@RequestMapping("save")
	public @ResponseBody Car save(@RequestBody Car car){
		if(car.getId()!=null){
			return biz.modifyCar(car);
		}else{
			return biz.addCar(car);
		}
	}
	/**
	 * 查询所有车牌号码
	 * @return List<String>
	 */
	@RequestMapping("getnos")
	public @ResponseBody List<String> getNos(){
		return biz.getNos();
	}
	
	/**
	 * 根据各种条件查询页数
	 * @param condition
	 * @return int
	 */
	@RequestMapping("count")
	public @ResponseBody int getPages(@RequestBody Map<String,Object> condition){
		return biz.getPages(condition);
	}
	
	/**
	 * 根据ID查询车辆信息
	 * @param id
	 * @return Car
	 */
	@RequestMapping("get/{id}")
	public @ResponseBody Car get(@PathVariable("id") int id){
		return biz.getCar(id);
	}
	
	/**
	 * 根据车牌号码查询车辆信息
	 * @param condition
	 * @return Car
	 */
	@RequestMapping("getcar")
	public @ResponseBody Car getCar(@RequestBody Map<String,Object> condition){
		Car car = biz.getCarByNo((String)condition.get("no"));
		return car;
	}
	
	/**
	 * 根据各种条件查询车辆信息
	 * @param condition
	 * @return List<Car>
	 */
	@RequestMapping("find")
	public @ResponseBody List<Car> find(@RequestBody Map<String,Object> condition){
		return biz.findCar(condition);
	}
	/**
	 * 根据ID删除车辆信息
	 * @param int id
	 * @return boolean
	 */
	@RequestMapping("remove/{id}")
	public @ResponseBody boolean remove(@PathVariable("id") int id){
		return biz.removeCar(id);
	}
}
