package com.wiseautom.dao;

import com.wiseautom.entity.Commpara;
import com.wiseautom.entity.SysCode;

import java.util.List;
import java.util.Map;

/**
 * 字典管理
 * 
 * @author chenyi
 * @email qq228112142@qq.com
 * @date 2017-11-06 14:49:28
 */
public interface CommparaDao extends BaseDao<Commpara> {

    List<SysCode> getCodeValues(Map<String, Object> params);

    List<Commpara> findByVerify(Commpara commpara);
}
