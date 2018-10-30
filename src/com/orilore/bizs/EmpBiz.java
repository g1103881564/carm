package com.orilore.bizs;

import java.util.List;

import javax.annotation.Resource;
import com.orilore.mappers.EmpMapper;
import org.springframework.stereotype.Service;

import com.orilore.model.Emp;
@Service
public class EmpBiz implements IEmpBiz {
	@Resource
	private EmpMapper mapper;
	@Override
	public boolean addEmp(Emp emp) {
		return mapper.insert(emp);
	}

	@Override
	public boolean removeEmp(int id) {
		return mapper.delete(id);
	}

	@Override
	public boolean modifyEmp(Emp emp) {
		return mapper.update(emp);
	}

	@Override
	public Emp getEmp(int id) {
		return mapper.selectOne(id);
	}

	@Override
	public int getPages(int count) {
		int n = mapper.count();
		int m = 1;
		if(n%count==0){
			m = n/count;
		}else{
			m = n/count+1;
		}
		return m;
	}

	@Override
	public List<Emp> findEmp(int page, int count) {
		return mapper.select((page-1)*count,count);
	}

}
