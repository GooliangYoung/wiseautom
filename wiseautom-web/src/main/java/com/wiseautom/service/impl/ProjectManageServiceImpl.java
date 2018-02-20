package com.wiseautom.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

import com.wiseautom.dao.ProjectManageDao;
import com.wiseautom.entity.ProjectManage;
import com.wiseautom.service.ProjectManageService;

/**
 * @author GooliangYoung
 */
@Service("projectManageService")
public class ProjectManageServiceImpl implements ProjectManageService {
    @Autowired
    private ProjectManageDao projectManageDao;

    @Override
    public ProjectManage get(String objId) {
        return projectManageDao.get(objId);
    }

    @Override
    public List<ProjectManage> getList(Map<String, Object> map) {
        return projectManageDao.getList(map);
    }

    @Override
    public int getCount(Map<String, Object> map) {
        return projectManageDao.getCount(map);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void save(ProjectManage projectManage) {
        projectManageDao.save(projectManage);
    }

    @Override
    public void update(ProjectManage projectManage) {
        projectManageDao.update(projectManage);
    }

    @Override
    public void delete(String objId) {
        projectManageDao.delete(objId);
    }

    @Override
    public void deleteBatch(String[] objIds) {
        projectManageDao.deleteBatch(objIds);
    }

    @Override
    public void updateState(String[] ids, String stateValue) {
        for (String id : ids) {
            ProjectManage projectManage = get(id);
            update(projectManage);
        }
    }

    @Override
    /**
     * 根据项目代码获取项目数量
     *
     * @param projectCode 项目代码
     * @return int
     */
    public int queryByProjectCode(String projectCode) {
        return projectManageDao.queryByProjectCode(projectCode);
    }
}
