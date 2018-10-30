package com.orilore.mappers;
import java.util.List;
import com.orilore.model.*;
public interface BrandMapper{
	public void insert(Brand bean);
	public Brand selectOne(int id);
	public int count();
	public void delete(int id);
	public List<Brand> select(int page,int count);
	public void update(Brand bean);
}