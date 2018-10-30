package com.orilore.mappers;
import java.util.List;
import com.orilore.model.*;
public interface SizeMapper{
	public void insert(Size bean);
	public Size selectOne(int id);
	public int count(int bid);
	public void delete(int id);
	public List<Size> select(int id,int page,int count);
	public void update(Size bean);
}