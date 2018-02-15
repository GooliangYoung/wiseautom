package com.wiseautom.service;

import com.wiseautom.entity.SysOss;

import java.util.List;
import java.util.Map;

/**
 * oss配置
 *
 * @author GooliangYoung
 */
public interface SysOssService {

    SysOss get(String bucket);

    List<SysOss> getList(Map<String, Object> map);

    int getCount(Map<String, Object> map);

    void save(SysOss sysOss);

    void update(SysOss sysOss);

    void delete(String bucket);

    void deleteBatch(String[] buckets);

    void updateState(String[] ids, String stateValue);
}
