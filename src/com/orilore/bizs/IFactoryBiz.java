package com.orilore.bizs;

import java.util.List;

import com.orilore.model.Factory;

public interface IFactoryBiz {
	public boolean addFactory(Factory bean);
	public boolean removeFactory(int id);
	public boolean modifyFactory(Factory bean);
	public Factory getFactory(int id);
	public int getPages(int count);
	public List<Factory> findFactory(int page,int count);
}
