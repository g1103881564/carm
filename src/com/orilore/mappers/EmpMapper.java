package com.orilore.mappers;

import java.util.List;
import com.orilore.model.Emp;

public interface EmpMapper {
	public boolean insert(Emp emp);
	public boolean delete(int id);
	public boolean update(Emp emp);
	public Emp selectOne(int id);
	public int count();
	public List<Emp> select(int page,int count);
}
