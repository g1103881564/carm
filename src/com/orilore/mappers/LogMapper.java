package com.orilore.mappers;

import java.util.List;
import com.orilore.model.Log;

public interface LogMapper {
	public void insert(Log log);
	public void update(Log log);
	public List<Log> select();
}
