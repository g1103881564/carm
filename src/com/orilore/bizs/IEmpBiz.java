package com.orilore.bizs;
import com.orilore.model.*;
import java.util.List;
public interface IEmpBiz{
	public boolean addEmp(Emp emp);
	public boolean removeEmp(int id);
	public boolean modifyEmp(Emp emp);
	public Emp getEmp(int id);
	public int getPages(int count);
	public List<Emp> findEmp(int page,int count);
}