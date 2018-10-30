package com.orilore.mappers;
import java.util.List;
import com.orilore.model.*;
public interface FactoryMapper{
	public void insert(Factory bean);
	public Factory selectOne(int id);
	public void delete(int id);
	public int count();
	public List<Factory> select(int page,int count);
	public void update(Factory bean);
}
