package com.orilore.mappers;
import java.util.List;
import com.orilore.model.*;
public interface StockMapper{
	public void insert(Stock bean);
	public Stock selectOne(int id);
	public void delete(int id);
	public List<Stock> select(int cid);
	public void update(Stock bean);
}