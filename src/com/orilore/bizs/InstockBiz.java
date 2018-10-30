package com.orilore.bizs;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.orilore.mappers.InstockMapper;
import com.orilore.mappers.StockMapper;
import com.orilore.model.Instock;
import com.orilore.model.Stock;
@Service
public class InstockBiz implements IInstockBiz{
	@Resource
	private InstockMapper mapper;
	@Resource
	private StockMapper sapper;
	@Override
	public boolean addInstock(Instock stock) {
		List<Stock> stocks = sapper.select(stock.getCid());
		if(stocks!=null && stocks.size()>0){
			for (Stock bean : stocks) {
				if(bean.getSize().equals(stock.getSize())){
					bean.setPrice(stock.getPrice());
					bean.setSale(stock.getSale());
					bean.setQuantity(bean.getQuantity()+stock.getQuantity());
					sapper.update(bean);
					break;
				}
			}
		}else{
			Stock bean = new Stock();
			bean.setCid(stock.getCid());
			bean.setPrice(stock.getPrice());
			bean.setQuantity(stock.getQuantity());
			bean.setSale(stock.getSale());
			bean.setSize(stock.getSize());
			sapper.insert(bean);
		}
		mapper.insert(stock);
		return true;
	}

	@Override
	public boolean removeInstock(int id) {
		Instock stock = mapper.selectOne(id);
		List<Stock> beans = sapper.select(stock.getCid());
		mapper.delete(id);
		for(Stock bean : beans){
			if(bean.getSize().equals(stock.getSize())){
				bean.setQuantity(bean.getQuantity()-stock.getQuantity());
				sapper.update(bean);
				break;
			}
		}
		return true;
	}

	@Override
	public boolean modifyInstock(Instock stock) {
		mapper.update(stock);
		return true;
	}

	@Override
	public Instock getInstock(int id) {
		return mapper.selectOne(id);
	}

	@Override
	public List<Instock> findInstock(Map<String,Object> condition) {
		Integer page = (Integer)condition.get("page");
		Integer count = (Integer)condition.get("count");
		int begin = (page-1)*count;
		condition.put("page", begin);
		return mapper.select(condition);
	}

	@Override
	public int getPages(Map<String,Object> condition) {
		int n = mapper.count(condition);
		int count = (Integer)condition.get("count");
		int m = 1;
		if(n%count==0){
			m = n/count;
		}else{
			m = n/count+1;
		}
		return m;
	}

	@Override
	public List<Instock> monthState(String month) {
		return mapper.selectByMonth(month);
	}

	@Override
	public List<Instock> yearState(String year) {
		return mapper.selectByYear(year);
	}
}
