package com.wiseautom.service.impl;

import com.wiseautom.dao.OrganizeDao;
import com.wiseautom.entity.Organize;
import com.wiseautom.service.OrganizeService;
import com.wiseautom.utils.RandomCharUtil;
import com.wiseautom.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.Map;


@Service("organizeService")
@Transactional
public class OrganizeServiceImpl implements OrganizeService {
    @Autowired
    private OrganizeDao organizeDao;

    @Override
    public Organize queryObject(String orgId) {
        return organizeDao.queryObject(orgId);
    }

    @Override
    public List<Organize> queryList(Map<String, Object> map) {
        return organizeDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return organizeDao.queryTotal(map);
    }

    @Override
    public void save(Organize organize) {
        organize.setOrgId(RandomCharUtil.getNumberRand());
        if (StringUtil.isEmpty(organize.getParentOrgId())) {
            organize.setLevelOrg(organize.getOrgId());
        } else {
            Organize pOrganize = organizeDao.queryObject(organize.getParentOrgId());
            organize.setLevelOrg(pOrganize.getLevelOrg() + "," + organize.getOrgCode());
        }
        organize.setInDate(new Date());
        organizeDao.save(organize);
    }

    @Override
    public void update(Organize organize) {
        organizeDao.update(organize);
    }

    @Override
    public void delete(String orgId) {
        organizeDao.delete(orgId);
        List<Organize> organizes = organizeDao.queryByParentId(orgId);
        for (Organize organize : organizes) {

            if (StringUtil.isEmpty(organize.getParentOrgId())) {
                organizeDao.delete(orgId);
            }
            {
                this.delete(organize.getOrgId());
            }
        }
    }

    @Override
    public void deleteBatch(String[] orgIds) {
        organizeDao.deleteBatch(orgIds);
    }

    @Override
    public void updateState(String[] ids, String stateValue) {
        for (String id : ids) {
            Organize organize = queryObject(id);
            organize.setState(stateValue);
            update(organize);
        }
    }

    @Override
    public List<Organize> getList() {
        return organizeDao.getList();
    }

    @Override
    public Organize queryByOrgCode(String orgCode) {
        return organizeDao.queryByOrgCode(orgCode);
    }

}
