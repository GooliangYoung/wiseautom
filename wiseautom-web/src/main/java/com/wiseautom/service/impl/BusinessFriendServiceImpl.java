package com.wiseautom.service.impl;

import com.wiseautom.dao.BusinessFriendDao;
import com.wiseautom.entity.BusinessFriend;
import com.wiseautom.service.BusinessFriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;


@Service("businessFriendService")
@Transactional
public class BusinessFriendServiceImpl implements BusinessFriendService {
    @Autowired
    private BusinessFriendDao businessFriendDao;

    @Override
    public BusinessFriend get(String objId) {
        return businessFriendDao.get(objId);
    }

    @Override
    public List<BusinessFriend> getList(Map<String, Object> map) {
        return businessFriendDao.getList(map);
    }

    @Override
    public int getCount(Map<String, Object> map) {
        return businessFriendDao.getCount(map);
    }

    @Override
    public void save(BusinessFriend businessFriend) {
        businessFriendDao.save(businessFriend);
    }

    @Override
    public void update(BusinessFriend businessFriend) {
        businessFriendDao.update(businessFriend);
    }

    @Override
    public void delete(String objId) {
        businessFriendDao.delete(objId);
    }

    @Override
    public void deleteBatch(String[] objIds) {
        businessFriendDao.deleteBatch(objIds);
    }

    @Override
    public void updateState(String[] ids, String stateValue) {
        for (String id : ids) {
            BusinessFriend businessFriend = get(id);
            update(businessFriend);
        }
    }

}
