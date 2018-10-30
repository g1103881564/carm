package com.orilore.mappers;
import java.util.List;
import com.orilore.model.*;
public interface CategoryMapper{
	public void insert(Category bean);
	public Category selectOne(int id);
	public void delete(int id);
	public int count();
	public List<Category> select(int page,int count);
	public void update(Category bean);
}