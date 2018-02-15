package com.wiseautom.dao;

import com.wiseautom.entity.SysCode;

import java.util.List;
import java.util.Map;

/**
 * 表码信息表
 *
 * @author GooliangYoung
 */
public interface SysCodeDao extends BaseDao<SysCode> {

    List<SysCode> getCodeValues(Map<String, Object> params);

    List<SysCode> findByVerify(SysCode sysCode);
}
