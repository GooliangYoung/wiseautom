package com.wiseautom.dao;

import com.wiseautom.entity.SysUserRole;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户与角色对应关系
 *
 * @author GooliangYoung
 */
@Repository
public interface SysUserRoleDao extends BaseDao<SysUserRole> {

    /**
     * 根据用户ID，获取角色ID列表
     */
    List<Long> queryRoleIdList(Long userId);
}
