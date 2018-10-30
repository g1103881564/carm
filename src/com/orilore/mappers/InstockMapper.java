package com.orilore.mappers;
import java.util.List;
import java.util.Map;

import com.orilore.model.*;
public interface InstockMapper{
	public void insert(Instock bean);
	public Instock selectOne(int id);
	public void delete(int id);
	public List<Instock> select(Map<String,Object> condition);
	public int count(Map<String,Object> condition);
	public void update(Instock bean);
	public List<Instock> selectByMonth(String month);
	public List<Instock> selectByYear(String year);
}