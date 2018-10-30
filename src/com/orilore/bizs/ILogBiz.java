package com.orilore.bizs;

import java.util.List;

import com.orilore.model.Log;

public interface ILogBiz {
	public void addLog(Log log);
	public void modifyLog(Log log);
	public List<Log> findLogs(); 
}
