package com.orilore.bizs;
import com.orilore.model.*;
import com.orilore.mappers.*;
import java.util.*;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service
public class StockBiz implements IStockBiz{
	@Resource
	private StockMapper mapper;
	@Override
	public boolean addStock(Stock bean) {
		try{
			mapper.insert(bean);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	@Override
	public boolean addStock(List<Stock> beans) {
		try{
			if(beans!=null && beans.size()>0){
				int cid = beans.get(0).getCid();
				mapper.delete(cid);
				for (Stock stock : beans) {
					mapper.insert(stock);
				}
			}
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	@Override
	public boolean removeStock(int cid) {
		try{
			mapper.delete(cid);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	@Override
	public boolean modifyStock(Stock bean) {
		try{
			mapper.update(bean);
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
			return false;
		}
	}
	@Override
	public Stock getStock(int id) {
		return mapper.selectOne(id);
	}
	@Override
	public List<Stock> findStock(int cid) {
		return mapper.select(cid);
	}
}
