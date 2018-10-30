package com.orilore.bizs;
import com.orilore.model.*;
import java.util.List;
public interface ICategoryBiz{
	public boolean addCategory(Category category);
	public boolean removeCategory(int id);
	public boolean modifyCategory(Category category);
	public Category getCategory(int id);
	public int getPages(int count);
	public List<Category> findCategory(int page,int count);
}