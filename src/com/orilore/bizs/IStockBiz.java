package com.orilore.bizs;
import com.orilore.model.*;

import java.util.List;
public interface IStockBiz{
	public boolean addStock(Stock stock);
	public boolean addStock(List<Stock> beans);
	public boolean removeStock(int cid);
	public boolean modifyStock(Stock stock);
	public Stock getStock(int id);
	public List<Stock> findStock(int cid);
}