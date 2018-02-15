package com.wiseautom.dao;

import com.wiseautom.entity.SysRole;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 角色管理
 *
 * @author GooliangYoung
 */
@Repository
public interface SysRoleDao extends BaseDao<SysRole> {

    /**
     * 查询用户创建的角色ID列表
     */
    List<Long> queryRoleIdList(Long createUserId);

    List<SysRole> findAll(Map<String, Object> params);
}
