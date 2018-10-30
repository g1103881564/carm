package com.orilore.mappers;
import java.util.List;
import com.orilore.model.*;
public interface ComponentMapper{
	public void insert(Component bean);
	public Component selectOne(int id);
	public void delete(int id);
	public List<Component> select(int page,int count);
	public int count(Comp bean);
	public List<Component> query(Comp bean);
	public void update(Component bean);
	public List<Component> getSimple();
	public List<Stock> selectState();
	public List<Component> selectWarning();
	public List<Money> selectMoney(Money money);
}