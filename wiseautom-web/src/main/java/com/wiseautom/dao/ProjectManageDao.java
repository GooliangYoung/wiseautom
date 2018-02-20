package com.wiseautom.dao;

import com.wiseautom.entity.ProjectManage;

/**
 * 项目管理表
 *
 * @author GooliangYoung
 * @date 2018-02-18 14:08:39
 */
public interface ProjectManageDao extends BaseDao<ProjectManage> {
    /**
     * 根据项目代码获取项目数量
     *
     * @param projectCode 项目代码
     * @return int
     */
    int queryByProjectCode(String projectCode);
}
