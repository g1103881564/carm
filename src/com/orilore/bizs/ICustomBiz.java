package com.orilore.bizs;
import com.orilore.model.*;
import java.util.List;
public interface ICustomBiz{
	public Custom addCustom(Custom custom);
	public boolean removeCustom(int id);
	public boolean modifyCustom(Custom custom);
	public int getPages(Custom custom,int count);
	public Custom getCustom(int id);
	public Custom getCustomByPhone(String phone);
	public List<String> getNonames();
	public List<Custom> findCustom(Custom custom,int page,int count);
}