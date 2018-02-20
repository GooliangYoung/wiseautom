package com.wiseautom.service;

import com.wiseautom.entity.ProjectManage;

import java.util.List;
import java.util.Map;

/**
 * 项目管理表
 *
 * @author GooliangYoung
 * @date 2018-02-18 14:08:39
 */
public interface ProjectManageService {

    ProjectManage get(String objId);

    List<ProjectManage> getList(Map<String, Object> map);

    int getCount(Map<String, Object> map);

    void save(ProjectManage projectManage);

    void update(ProjectManage projectManage);

    void delete(String objId);

    void deleteBatch(String[] objIds);

    void updateState(String[] ids, String stateValue);

    /**
     * 根据项目代码获取项目数量
     *
     * @param projectCode 项目代码
     * @return int
     */
    int queryByProjectCode(String projectCode);
}
