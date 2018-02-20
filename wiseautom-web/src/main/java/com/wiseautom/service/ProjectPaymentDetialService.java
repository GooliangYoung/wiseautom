package com.wiseautom.service;

import com.wiseautom.entity.ProjectPaymentDetial;

import java.util.List;
import java.util.Map;

/**
 * 项目回款明细
 * 
 * @author GooliangYoung
 * @date 2018-02-18 14:08:39
 */
public interface ProjectPaymentDetialService {
	
	ProjectPaymentDetial get(String objId);
	
	List<ProjectPaymentDetial> getList(Map<String, Object> map);
	
	int getCount(Map<String, Object> map);
	
	void save(ProjectPaymentDetial projectPaymentDetial);
	
	void update(ProjectPaymentDetial projectPaymentDetial);
	
	void delete(String objId);
	
	void deleteBatch(String[] objIds);

    void updateState(String[] ids, String stateValue);
}
