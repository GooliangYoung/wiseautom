package com.wiseautom.service;

import java.util.List;
import java.util.Map;

/**
 * 代码生成器
 *
 * @author GooliangYoung
 */
public interface SysGeneratorService {

    /**
     * 查询表信息
     *
     * @param map map
     * @return list
     */
    List<Map<String, Object>> queryList(Map<String, Object> map);

    /**
     * 查询表数量
     *
     * @param map map
     * @return int
     */
    int queryTotal(Map<String, Object> map);

    /**
     * 查询表信息
     *
     * @param tableName 表名
     * @return map
     */
    Map<String, String> queryTable(String tableName);

    /**
     * 查询表字段
     *
     * @param tableName 表名
     * @return list
     */
    List<Map<String, String>> queryColumns(String tableName);

    /**
     * 生成代码
     *
     * @param tableNames 表名
     * @return return
     */
    byte[] generatorCode(String[] tableNames);
}
