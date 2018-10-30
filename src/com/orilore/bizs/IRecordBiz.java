package com.orilore.bizs;
import com.orilore.model.*;

import java.util.List;
public interface IRecordBiz{
	public boolean addRecords(Record record,List<Detail> details);
	public int getPages(Record record);
	public boolean removeRecord(int id);
	public boolean modifyRecord(Record record);
	public Record getRecord(int id);
	public List<Record> findRecord(Record bean);
	public List<Record> currentMonth();
	public List<Record> monthState(String month);
	public List<Record> yearState(String year);
}