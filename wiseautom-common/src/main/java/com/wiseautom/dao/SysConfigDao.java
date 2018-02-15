package com.wiseautom.dao;

import com.wiseautom.entity.SysConfig;

import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 系统配置信息
 *
 * @author GooliangYoung
 */
public interface SysConfigDao extends BaseDao<SysConfig> {

    /**
     * 根据key，查询value
     *
     * @param paramKey key
     * @return str
     */
    String queryByKey(String paramKey);

    /**
     * 根据key，更新value
     *
     * @param key   key
     * @param value value
     * @return int
     */
    int updateValueByKey(@Param("key") String key, @Param("value") String value);

    /**
     * 查询配置项
     *
     * @param params 参数
     * @return list
     */
    List<SysConfig> findRule(Map<String, Object> params);

    /**
     * 设置参数
     *
     * @param config config
     */
    void setRule(SysConfig config);

    /**
     * 查找code
     *
     * @param code code
     * @return list
     */
    List<SysConfig> findByCode(String code);
}
