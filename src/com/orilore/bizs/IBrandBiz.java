package com.orilore.bizs;
import com.orilore.model.*;
import java.util.List;
public interface IBrandBiz{
	public boolean addBrand(Brand brand);
	public boolean removeBrand(int id);
	public boolean modifyBrand(Brand brand);
	public Brand getBrand(int id);
	public int getPages(int count);
	public List<Brand> findBrand(int page,int count);
}