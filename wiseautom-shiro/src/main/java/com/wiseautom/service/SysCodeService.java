package com.wiseautom.service;

import com.wiseautom.entity.SysCode;

import java.util.List;
import java.util.Map;

/**
 * 表码信息表
 *
 * @author GooliangYoung
 */
public interface SysCodeService {

    SysCode queryObject(Long id);

    List<SysCode> queryList(Map<String, Object> map);

    int queryTotal(Map<String, Object> map);

    void save(SysCode sysCode);

    void update(SysCode sysCode);

    void delete(Long id);

    void deleteBatch(Long[] ids);

    List<SysCode> getCodeValues(Map<String, Object> params);

    List<SysCode> findByVerify(SysCode sysCode);
}
