package com.orilore.bizs;
import com.orilore.model.*;
import com.orilore.mappers.*;
import java.util.*;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class RecordBiz implements IRecordBiz{
	@Resource
	private RecordMapper mapper;
	@Resource
	private DetailMapper dapper;
	@Resource
	private StockMapper sapper;
	@Override
	public boolean addRecords(Record record,List<Detail> details) {
		if(details!=null){
			float cb = 0f;//成本
			for (Detail d : details) {
				if(d.getPrice()!=null && d.getPrice()>0 && d.getQuantity()!=null && d.getQuantity()>0){
					float m = d.getPrice() * d.getQuantity();//单位进价*数量=单位成本
					cb+=m;//成本合计
				}
			}
			if(record.getSmoney()!=null && record.getSmoney()>0){
				record.setMoney(record.getSmoney() - cb);//实收-成本合计=毛利
			}
		}
		int rid = mapper.insert(record);
		if(rid>0 && details!=null){
			for (Detail d : details) {
				d.setRid(record.getId());
				dapper.insert(d);
				Stock stock = sapper.selectOne(d.getSid());
				stock.setQuantity(stock.getQuantity() - d.getQuantity());
				sapper.update(stock);
			}
		}
		return true;
		
	}
	@Override
	public boolean removeRecord(int id) {
		mapper.delete(id);
		return true;
	}
	@Override
	public boolean modifyRecord(Record bean) {
		mapper.update(bean);
		return true;
	}
	@Override
	public Record getRecord(int id) {
		return mapper.selectOne(id);
	}
	@Override
	public List<Record> findRecord(Record record) {
		record.setPage((record.getPage()-1)*record.getCount());
		if(record.getStatus()==-1){
			record.setStatus(null);
		}
		if(record.getEmp()==0){
			record.setEmp(null);
		}
		if(record.getMdate()!=null && (record.getMdate1()==null || record.getMdate1().equals(""))){
			record.setMdate1(record.getMdate());
		}
		if(record.getMdate1()!=null && (record.getMdate()==null || record.getMdate().equals(""))){
			record.setMdate(record.getMdate1());
		}
		return mapper.select(record);
	}
	@Override
	public int getPages(Record record) {
		if(record.getStatus()==-1){
			record.setStatus(null);
		}
		if(record.getEmp()==0){
			record.setEmp(null);
		}
		if(record.getMdate()!=null && (record.getMdate1()==null || record.getMdate1().equals(""))){
			record.setMdate1(record.getMdate());
		}
		if(record.getMdate1()!=null && (record.getMdate()==null || record.getMdate().equals(""))){
			record.setMdate(record.getMdate1());
		}
		int n = mapper.count(record);
		int m = 1;
		Integer pageCount = record.getCount();
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
	public List<Record> currentMonth() {
		return mapper.selectCurrentMonth();
	}
	@Override
	public List<Record> monthState(String month) {
		return mapper.selectByMonth(month);
	}
	@Override
	public List<Record> yearState(String year) {
		return mapper.selectByYear(year);
	}
}
