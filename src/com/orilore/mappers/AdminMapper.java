package com.orilore.mappers;
import com.orilore.model.*;
public interface AdminMapper{
	public Admin selectOne(Admin admin);
	public void update(Admin bean);
}