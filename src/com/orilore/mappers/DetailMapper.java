package com.orilore.mappers;
import java.util.List;
import com.orilore.model.*;
public interface DetailMapper{
	public void insert(Detail bean);
	public Detail selectOne(int id);
	public void delete(int id);
	public List<Detail> select();
	public void update(Detail bean);
}