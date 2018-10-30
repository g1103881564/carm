package com.orilore.bizs;
import com.orilore.model.*;
import java.util.List;
public interface IDetailBiz{
	public boolean addDetail(Detail detail);
	public boolean removeDetail(int id);
	public boolean modifyDetail(Detail detail);
	public Detail getDetail(int id);
	public List<Detail> findDetail();
}