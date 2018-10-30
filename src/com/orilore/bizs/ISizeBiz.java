package com.orilore.bizs;
import com.orilore.model.*;
import java.util.List;
public interface ISizeBiz{
	public boolean addSize(Size size);
	public boolean removeSize(int id);
	public int getPages(int bid,int count);
	public boolean modifySize(Size size);
	public Size getSize(int id);
	public List<Size> findSize(int id,int page,int count);
}