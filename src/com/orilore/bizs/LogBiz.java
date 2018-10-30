package com.orilore.bizs;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.orilore.mappers.LogMapper;
import com.orilore.model.Log;
@Service
public class LogBiz implements ILogBiz {
	@Resource
	private LogMapper mapper;
	@Override
	public void addLog(Log log) {
		mapper.insert(log);
	}

	@Override
	public void modifyLog(Log log) {
		mapper.update(log);
	}

	@Override
	public List<Log> findLogs() {
		return mapper.select();
	}

}
