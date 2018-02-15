package com.wiseautom.dao;

import com.wiseautom.entity.SysRoleMenu;

import java.util.List;

/**
 * 角色与菜单对应关系
 *
 * @author GooliangYoung
 */
public interface SysRoleMenuDao extends BaseDao<SysRoleMenu> {

    /**
     * 根据角色ID，获取菜单ID列表
     */
    List<Long> queryMenuIdList(Long roleId);
}
