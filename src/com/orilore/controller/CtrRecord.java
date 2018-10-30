package com.orilore.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.orilore.bizs.IRecordBiz;
import com.orilore.model.Detail;
import com.orilore.model.Record;

@Controller
@RequestMapping("/pages/record/")
public class CtrRecord {
	@Resource
	private IRecordBiz biz;
	
	/**
	 * 根据组合条件查询配件信息
	 * @param bean
	 * @return List<Record>
	 */
	@RequestMapping("query")
	public @ResponseBody List<Record> query(@RequestBody Record bean){
		return biz.findRecord(bean);
	}
	
	/**
	 * 根据月份查询收入支出情况
	 * @param m年月
	 * @return List<Record>
	 */
	@RequestMapping("month/{m}")
	public @ResponseBody List<Record> stateMonth(@PathVariable("m") String m){
		String month = m+"-01";
		return biz.monthState(month);
	}
	
	/**
	 * 根据年份查询收入支出情况
	 * @param y年份
	 * @return List<Record>
	 */
	@RequestMapping("year/{y}")
	public @ResponseBody List<Record> stateYear(@PathVariable("y") String y){
		return biz.yearState(y);
	}
	
	/**
	 * 根据组合条件查询页数
	 * @param bean
	 * @return int
	 */
	@RequestMapping("count")
	public @ResponseBody int getPages(@RequestBody Record bean){
		return biz.getPages(bean);
	}
	
	/**
	 * 根据ID删除维修记录
	 * @param id
	 * @return boolean
	 */
	@RequestMapping("remove/{id}")
	public @ResponseBody boolean remove(@PathVariable("id") int id){
		return biz.removeRecord(id);
	}
	
	/**
	 * 根据ID查询维修记录
	 * @param id
	 * @return Record
	 */
	@RequestMapping("get/{id}")
	public @ResponseBody Record getRecord(@PathVariable("id") int id){
		return biz.getRecord(id);
	}
	
	/**
	 * 保存维修记录
	 * @param request
	 * @return boolean
	 */
	@RequestMapping("save")
	public @ResponseBody boolean save(HttpServletRequest request){
		//获取请求参数-维修日期
		String date = request.getParameter("date");
		//获取请求参数-维修员工ID
		String emp = request.getParameter("emp");
		//获取请求参数-支付方式
		String pay = request.getParameter("pay");
		//获取请求参数-工时费
		String hmoney = request.getParameter("hmoney");
		//获取请求参数-实收金额
		String smoney = request.getParameter("smoney");
		//获取请求参数-应收金额
		String ymoney = request.getParameter("ymoney");
		//获取请求参数-备注
		String info = request.getParameter("info");
		//获取请求参数-车辆ID
		String carid = request.getParameter("carid");
		//获取请求参数-配件ID数组
		String[] cids = request.getParameterValues("cids[]");
		//获取请求参数-配件型号数组
		String[] sizes = request.getParameterValues("sizes[]");
		//获取请求参数-配件库存记录ID数组
		String[] sids = request.getParameterValues("sids[]");
		//获取请求参数-配件进价数组
		String[] prices = request.getParameterValues("prices[]");
		//获取请求参数-配件售价数组
		String[] sales = request.getParameterValues("sales[]");
		//获取请求参数-配件使用数量数组
		String[] quantitys = request.getParameterValues("quantitys[]");
		/*********构建维修记录对象record封装数据***********/
		Record record = new Record();
		record.setCid(Integer.parseInt(carid));
		record.setYmoney(Float.parseFloat(ymoney));
		record.setSmoney(Float.parseFloat(smoney));
		record.setHmoney(Float.parseFloat(hmoney));
		record.setMdate(date);
		record.setInfo(info);
		record.setEmp(Integer.parseInt(emp));
		record.setPay(pay);
		record.setStatus(0);
		/**************维修记录封装完毕******************/
		
		/***********构建配件使用详细集合ds****************/
		List<Detail> ds = null;
		if(cids!=null){
			ds = new ArrayList<Detail>();
			for(int i=0;i<cids.length;i++){
				Detail d = new Detail();
				d.setCid(Integer.parseInt(cids[i]));
				d.setSize(sizes[i]);
				d.setSid(Integer.parseInt(sids[i]));
				d.setPrice(Float.parseFloat(prices[i]));
				d.setSale(Float.parseFloat(sales[i]));
				d.setQuantity(Float.parseFloat(quantitys[i]));
				ds.add(d);
			}
		}
		/***********配件使用详细集合ds封装完毕***********************/
		return biz.addRecords(record,ds);
	}
}
