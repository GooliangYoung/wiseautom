package com.wiseautom.dao;

import com.wiseautom.entity.Area;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author GooliangYoung
 */
public interface AreaDao extends BaseDao<Area> {

    List<Area> getAreaListByIsShow(HashMap<String, Object> paraMap);

    int getCount(Map<String, Object> params);

    List<Area> findByParentId(String pId);
}
