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
	 * ���泵����Ϣ
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
	 * ��ѯ���г��ƺ���
	 * @return List<String>
	 */
	@RequestMapping("getnos")
	public @ResponseBody List<String> getNos(){
		return biz.getNos();
	}
	
	/**
	 * ���ݸ���������ѯҳ��
	 * @param condition
	 * @return int
	 */
	@RequestMapping("count")
	public @ResponseBody int getPages(@RequestBody Map<String,Object> condition){
		return biz.getPages(condition);
	}
	
	/**
	 * ����ID��ѯ������Ϣ
	 * @param id
	 * @return Car
	 */
	@RequestMapping("get/{id}")
	public @ResponseBody Car get(@PathVariable("id") int id){
		return biz.getCar(id);
	}
	
	/**
	 * ���ݳ��ƺ����ѯ������Ϣ
	 * @param condition
	 * @return Car
	 */
	@RequestMapping("getcar")
	public @ResponseBody Car getCar(@RequestBody Map<String,Object> condition){
		Car car = biz.getCarByNo((String)condition.get("no"));
		return car;
	}
	
	/**
	 * ���ݸ���������ѯ������Ϣ
	 * @param condition
	 * @return List<Car>
	 */
	@RequestMapping("find")
	public @ResponseBody List<Car> find(@RequestBody Map<String,Object> condition){
		return biz.findCar(condition);
	}
	/**
	 * ����IDɾ��������Ϣ
	 * @param int id
	 * @return boolean
	 */
	@RequestMapping("remove/{id}")
	public @ResponseBody boolean remove(@PathVariable("id") int id){
		return biz.removeCar(id);
	}
}
