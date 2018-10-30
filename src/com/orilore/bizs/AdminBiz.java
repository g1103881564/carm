package com.orilore.bizs;
import com.orilore.model.*;
import com.orilore.mappers.*;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service
public class AdminBiz implements IAdminBiz{
	@Resource
	private AdminMapper mapper;
	
	@Override
	public boolean modifyAdmin(Admin bean) {
		mapper.update(bean);
		return true;
	}
	@Override
	public Admin getAdmin(Admin admin) {
		return mapper.selectOne(admin);
	}
}
