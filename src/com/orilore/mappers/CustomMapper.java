package com.orilore.mappers;
import java.util.List;
import com.orilore.model.*;
public interface CustomMapper{
	public void insert(Custom bean);
	public Custom selectOne(int id);
	public void delete(int id);
	public int count(Custom custom);
	public List<Custom> select(Custom custom);
	public void update(Custom bean);
	public Custom selectByPhone(String phone);
	public List<String> getNonames();
}