package com.wiseautom.service;

import com.wiseautom.entity.SysLog;

import java.util.List;
import java.util.Map;

/**
 * 系统日志
 *
 * @author GooliangYoung
 */
public interface SysLogService {

    SysLog queryObject(Long id);

    List<SysLog> queryList(Map<String, Object> map);

    int queryTotal(Map<String, Object> map);

    void save(SysLog sysLog);

    void update(SysLog sysLog);

    void delete(Long id);

    void deleteBatch(Long[] ids);
}
