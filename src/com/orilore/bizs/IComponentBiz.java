package com.orilore.bizs;
import com.orilore.model.*;

import java.util.List;
public interface IComponentBiz{
	public Component addComponent(Component component);
	public boolean removeComponent(int id);
	public Component modifyComponent(Component component);
	public Component getComponent(int id);
	public List<Component> findComponent(Comp bean);
	public List<Component> findComponent(int page,int count);
	public List<Component> getSimple();
	public int getPages(Comp comp);
	
	public List<Stock> stockState();
	public List<Component> stockWarning();
	public List<Money> stockMoney(Money money);
}