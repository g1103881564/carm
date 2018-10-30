package com.orilore.bizs;
import com.orilore.model.*;

import java.util.List;
import java.util.Map;
public interface IInstockBiz{
	public boolean addInstock(Instock stock);
	public boolean removeInstock(int id);
	public boolean modifyInstock(Instock stock);
	public Instock getInstock(int id);
	public int getPages(Map<String,Object> condition);
	public List<Instock> findInstock(Map<String,Object> condition);
	public List<Instock> monthState(String month);
	public List<Instock> yearState(String year);
}