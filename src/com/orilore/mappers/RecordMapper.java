package com.orilore.mappers;
import java.util.List;
import com.orilore.model.*;
public interface RecordMapper{
	public int insert(Record bean);
	public Record selectOne(int id);
	public void delete(int id);
	public List<Record> select(Record bean);
	public void update(Record bean);
	public int count(Record bean);
	public List<Record> selectCurrentMonth();
	public List<Record> selectByMonth(String month);
	public List<Record> selectByYear(String year);
}