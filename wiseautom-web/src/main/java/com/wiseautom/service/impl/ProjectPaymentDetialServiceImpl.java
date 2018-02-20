package com.wiseautom.service.impl;

import com.wiseautom.dao.ProjectPaymentDetialDao;
import com.wiseautom.entity.ProjectPaymentDetial;
import com.wiseautom.service.ProjectPaymentDetialService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;


@Service("projectPaymentDetialService")
@Transactional
public class ProjectPaymentDetialServiceImpl implements ProjectPaymentDetialService {
    @Autowired
    private ProjectPaymentDetialDao projectPaymentDetialDao;

    @Override
    public ProjectPaymentDetial get(String objId) {
        return projectPaymentDetialDao.get(objId);
    }

    @Override
    public List<ProjectPaymentDetial> getList(Map<String, Object> map) {
        return projectPaymentDetialDao.getList(map);
    }

    @Override
    public int getCount(Map<String, Object> map) {
        return projectPaymentDetialDao.getCount(map);
    }

    @Override
    public void save(ProjectPaymentDetial projectPaymentDetial) {
        projectPaymentDetialDao.save(projectPaymentDetial);
    }

    @Override
    public void update(ProjectPaymentDetial projectPaymentDetial) {
        projectPaymentDetialDao.update(projectPaymentDetial);
    }

    @Override
    public void delete(String objId) {
        projectPaymentDetialDao.delete(objId);
    }

    @Override
    public void deleteBatch(String[] objIds) {
        projectPaymentDetialDao.deleteBatch(objIds);
    }

    @Override
    public void updateState(String[] ids, String stateValue) {
        for (String id : ids) {
            ProjectPaymentDetial projectPaymentDetial = get(id);
            update(projectPaymentDetial);
        }
    }

}
