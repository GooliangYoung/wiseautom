package com.wiseautom.service;

import java.util.List;


/**
 * 用户与角色对应关系
 *
 * @author GooliangYoung
 */
public interface SysUserRoleService {

    void saveOrUpdate(Long userId, List<Long> roleIdList);

    /**
     * 根据用户ID，获取角色ID列表
     *
     * @param userId userId
     * @return list
     */
    List<Long> queryRoleIdList(Long userId);

    void delete(Long userId);
}
