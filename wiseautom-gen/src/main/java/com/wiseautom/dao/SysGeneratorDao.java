package com.wiseautom.dao;

import java.util.List;
import java.util.Map;

/**
 * 代码生成器
 *
 * @author GooliangYoung
 */
public interface SysGeneratorDao {

    /**
     * 查询表信息
     *
     * @param map 表名
     * @return list
     */
    List<Map<String, Object>> queryList(Map<String, Object> map);

    /**
     * 查询表的数量
     *
     * @param map 表名
     * @return int
     */
    int queryTotal(Map<String, Object> map);

    /**
     * 查询表信息
     *
     * @param tableName 表名
     * @return 字段
     */
    Map<String, String> queryTable(String tableName);

    /**
     * 查询表字段
     *
     * @param tableName 表名
     * @return list
     */
    List<Map<String, String>> queryColumns(String tableName);
}
