package com.wiseautom.service;

import com.wiseautom.entity.BusinessFriend;

import java.util.List;
import java.util.Map;

/**
 * 商业伙伴干系人
 *
 * @author GooliangYoung
 * @date 2018-02-18 14:08:39
 */
public interface BusinessFriendService {

    BusinessFriend get(String objId);

    List<BusinessFriend> getList(Map<String, Object> map);

    int getCount(Map<String, Object> map);

    void save(BusinessFriend businessFriend);

    void update(BusinessFriend businessFriend);

    void delete(String objId);

    void deleteBatch(String[] objIds);

    void updateState(String[] ids, String stateValue);
}
